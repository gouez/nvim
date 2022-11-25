vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_palette = "material" -- original, mix, material
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_sign_column_background = "none"

vim.g.gruvbox_material_invert_selection = 0
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_improved_strings = 1
vim.g.gruvbox_material_improved_warnings = 1
vim.g.gruvbox_material_enable_bold = 1


vim.cmd("colorscheme gruvbox-material")
vim.cmd("doautocmd ColorScheme")


vim.cmd('hi Normal guibg=black')
vim.cmd('hi EndOfBuffer guibg=black')
vim.cmd('hi FloatBorder   guibg=black')
vim.cmd('hi NormalFloat   guibg=black')
vim.cmd('hi NeoTreeDirectoryIcon  guifg=#e78a4e')
vim.cmd('hi Pmenu guibg=black')
vim.cmd('hi PmenuSel NONE')
vim.cmd('hi link PmenuSel DiffAdd')
