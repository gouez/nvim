local keymaps = require('keymap.km')

require('legendary').setup({
  keymaps = keymaps.keymaps,
  commands = keymaps.commands,
  autocmds = {
  },
  functions = {
  },
  select_prompt = ' legendary.nvim ',
  col_separator_char = '│',
  cache_path = string.format('%s/legendary/', vim.fn.stdpath('cache')),
  scratchpad = {
    results_view = 'print',
  },
  default_item_formatter = function(item)
    local Toolbox = require('legendary.toolbox')
    if Toolbox.is_keymap(item) then
      return {
        table.concat(item:modes(), ', '),
        -- item.keys,
        -- '',
        item.description,
      }
    elseif Toolbox.is_command(item) then
      return {
        '',
        -- item.cmd,
        -- '',
        item.description,
      }
    elseif Toolbox.is_autocmd(item) then
      return {
        table.concat(item.events, ', '),
        -- table.concat(vim.tbl_get(item, 'opts', 'pattern') or { '*' }, ', '),
        '',
        item.description,
      }
    elseif Toolbox.is_function(item) then
      return {
        '',
        -- '<function>',
        item.description,
      }
    else
      -- unreachable
      return {
        vim.inspect(item),
        -- '',
        '',
      }
    end
  end
})
