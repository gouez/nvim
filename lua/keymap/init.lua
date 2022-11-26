api = vim.api
require('keymap.remap')
local keymap = require('core.keymap')
local nmap, imap, xmap, tmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.tmap
local expr, remap = keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd = keymap.cmd
-- -- require('keymap.config')
-- imap({
--   -- tab key
--   { '<TAB>', _G.smart_tab, opts(expr, remap) },
--   { '<S-TAB>', _G.smart_shift_tab, opts(expr, remap) },
-- })
nmap({
  { '<leader>p', cmd('Legendary') },
  -- packer
  { '<Leader>pu', cmd('PackerUpdate') },
  { '<Leader>pi', cmd('PackerInstall') },
  { '<Leader>pc', cmd('PackerCompile') },
  -- Lsp
  { '<Leader>li', cmd('LspInfo') },
  { '<Leader>ll', cmd('LspLog') },
  { '<Leader>lr', cmd('LspRestart') },
  -- Lspsaga
  -- { '[e', cmd('Lspsaga diagnostic_jump_next') },
  -- { ']e', cmd('Lspsaga diagnostic_jump_prev') },
  -- { '[c', cmd('Lspsaga show_cursor_diagnostics') },
  -- { 'K', cmd('Lspsaga hover_doc') },
  -- { 'ga', cmd('Lspsaga code_action') },
  -- { 'gd', cmd('Lspsaga peek_definition') },
  -- { 'gs', cmd('Lspsaga signature_help') },
  -- { 'gr', cmd('Lspsaga rename') },
  -- { 'gh', cmd('Lspsaga lsp_finder') },
  -- { '<Leader>o', cmd('LSoutlineToggle') },
  -- { '<Leader>g', cmd('Lspsaga open_floaterm lazygit') },

  -- dashboard create file
  { '<Leader>n', cmd('DashboardNewFile') },
  { '<Leader>ss', cmd('SessionSave') },
  { '<Leader>sl', cmd('SessionLoad') },
  -- dadbodui
  { '<Leader>d', cmd('DBUIToggle') },
  -- Telescope
  { '<Leader>j', cmd('Telescope buffers') },
  { '<Leader>fa', cmd('Telescope live_grep') },
  { '<Leader>fs', cmd('Telescope grep_string') },
  {
    '<A-b>',
    function()
      vim.cmd('Neotree toggle')
      local esc_key = api.nvim_replace_termcodes('<Esc>', true, false, true)
      api.nvim_feedkeys(esc_key, 'n', false)
    end,
  },
  { '<Leader>3', cmd('SymbolsOutline') },
  { '<Leader>2', cmd('Neotree buffers position=float') },
  { '<A-p>', cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files') },
  { '<Leader>fg', cmd('Telescope git_files') },
  { '<Leader>fw', cmd('Telescope grep_string') },
  { '<Leader>fh', cmd('Telescope help_tags') },
  { '<Leader>fo', cmd('Telescope oldfiles') },
  { '<Leader>gc', cmd('Telescope git_commits') },
  { '<Leader>fd', cmd('Telescope dotfiles') },
  -- hop.nvim
  { 'f', cmd('HopWordAC') },
  { 'F', cmd('HopWordBC') },
  -- debug
  { '<Leader><F5>', cmd('DapToggleBreakpoint') },
  { '<Leader><F6>', cmd('DapContinue') },
  { '<Leader><F7>', cmd('DapStepOver') },
  { '<Leader><F8>', cmd('DapStepInto') },
  { '<Leader><F9>', cmd('DapStepOut') },
  { '<Leader>ds', cmd('DapStop') },
  { '<Leader>dk', cmd('lua require"dap".up()') },
  { '<Leader>dj', cmd('lua require"dap".down()') },
  { '<Leader>dsbr', cmd('lua require"dap".set_breakpoint(vim.fn.input("breakpoint condition: "))') },
  { '<Leader>dsbm', cmd('lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))') },

  -- navigator.lua
  --  {'gr',cmd('require('navigator.reference').async_ref')},

})

nmap({ 'gcc', cmd('ComComment') })
xmap({ 'gcc', ':ComComment<CR>' })
nmap({ 'gcj', cmd('ComAnnotation') })

-- Lspsaga floaterminal
-- nmap({ '<A-d>', cmd('Lspsaga open_floaterm') })
-- tmap({ '<A-d>', [[<C-\><C-n>:Lspsaga close_floaterm<CR>]] })
--
-- xmap({ 'ga', cmd('Lspsaga code_action') })
