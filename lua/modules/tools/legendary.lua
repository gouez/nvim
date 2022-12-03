local keymaps = require('keymap.km')

require('legendary').setup({
  keymaps = keymaps.keymaps,
  commands = keymaps.commands,
  autocmds = {
  },
  select_prompt = ' legendary.nvim ',
  col_separator_char = '│',
  cache_path = string.format('%s/legendary/', vim.fn.stdpath('cache')),
  scratchpad = {
    results_view = 'print',
  },
})
