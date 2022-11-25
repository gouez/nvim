require 'navigator'.setup({
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  -- preview_height = 0.35, -- max height of preview windows
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  default_mapping = false,
  keymaps = {
    { key = "gK", func = vim.lsp.declaration, desc = 'declaration' },
    -- { key = '<leader>ld', func = "require('navigator.diagnostics').show_buf_diagnostics", doc = 'show_buf_diagnostics' },

  },
  icons = {
    -- Code acion
    code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
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
    disply_diagnostic_qf = false,
    diagnostic_virtual_text = false,
  }
})
