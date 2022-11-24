local keymaps = require('keymap.km')

require('legendary').setup({
  keymaps = keymaps.keymaps,
  commands = keymaps.commands,
  autocmds = {
    -- Create autocmds and augroups
    { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
    {
      name = 'MyAugroup',
      clear = true,
      -- autocmds here
    },
  },
  functions = {
    -- Make arbitrary Lua functions that can be executed via the item finder
    { function() doSomeStuff() end, description = 'Do some stuff with a Lua function!' },
  },
  select_prompt = ' legendary.nvim ',
  col_separator_char = '│',
  cache_path = string.format('%s/legendary/', vim.fn.stdpath('cache')),
})
