vim.opt.termguicolors = true
vim.cmd([[highlight default IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight default IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight default IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight default IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight default IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight default IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
-- vim.opt.list = true
require("indent_blankline").setup({
  enabled = true,
  -- char = "|",
  char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
  filetype_exclude = { "help", "startify", "dashboard", "packer", "guihua", "NvimTree", "sidekick" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  buftype_exclude = { "terminal" },
  space_char_blankline = " ",
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "if",
    "^while",
    "jsx_element",
    "^for",
    "for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
  bufname_exclude = { "README.md" },
})
