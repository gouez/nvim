require 'navigator'.setup({
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  keymaps = {
    { key = "gK", func = vim.lsp.declaration, desc = 'declaration' },
    -- { key = '<leader>ld', func = "require('navigator.diagnostics').show_buf_diagnostics", doc = 'show_buf_diagnostics' },

  },
  icons = {
    -- Code action
    code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_head_severity_1 = "🈲",
    -- refer to lua/navigator.lua for more icons setups
  },
  lsp = {
    document_highlight = false,
    format_on_save = true,
    format_options = { async = false },
    diagnostic = {
      underline = true,
      virtual_text = false, -- show virtual for diagnostic message
      update_in_insert = false, -- update diagnostic message in insert mode
    },
    diagnostic_scrollbar_sign = { '▃', '▆', '█' },
    disply_diagnostic_qf = true,
    diagnostic_virtual_text = false,
  }
})
