return {
  keymaps = {
    { '<leader>h', function() print('hello world!') end, description = 'Say hello' },
    { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
    {
      '<leader>c',
      { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
      description = 'Toggle comment'
    },
    -- lsp
    { 'gr', ':lua require("navigator.reference").async_ref()<CR>', description = 'async ref', opts = { silent = false } },
    { 'g0', ':lua require("navigator.symbols").document_symbols()<CR>', description = 'document symbols' },
    { 'gW', ':lua require("navigator.workspace").workspace_symbol_live()<CR>', description = 'workspace symbol live' },
    { 'gd', ':lua require("navigator.definition").definition()<CR>', description = 'definition' },
    { 'gp', ':lua require("navigator.definition").definition_preview()<CR>', description = 'definition preview' },
    { '<Space>ca',
      {
        n = { ':lua require("navigator.codeAction").code_action()<CR>', description = 'code action' },
        v = { ':lua require("navigator.codeAction").range_code_action()<CR>', description = 'range code action' }
      }
    },
    { '<Space>rn', ':lua require("navigator.rename").rename()<CR>', description = 'rename' },
    { '<Leader>gi', ':lua vim.lsp.buf.incoming_calls()<CR>', description = 'incoming calls' },
    { '<Leader>go', ':lua vim.lsp.buf.outgoing_calls()<CR>', description = 'outgoing calls' },
    { 'gi', ':lua vim.lsp.buf.implementation()<CR>', description = 'implementation' },
    { 'gL', ':lua require("navigator.diagnostics").show_diagnostics()<CR>', description = 'show diagnostics' },
    { 'gG', ':lua require("navigator.diagnostics").show_buf_diagnostics()<CR>', description = 'show buf diagnostics' },
    { '<leader>dt', ':lua require("navigator.diagnostics").toggle_diagnostics()<CR>', description = 'toggle diagnostics' },
    { ']d', ':lua vim.diagnostic.goto_next()<CR>', description = 'next diagnostics' },
    { '[d', ':lua vim.diagnostic.goto_prev()<CR>', description = 'prev diagnostics' },
    { '[0', ':lua vim.diagnostic.set_loclist()<CR>', description = 'diagnostics set loclist' },
    { 'K', ':lua vim.lsp.buf.hover()<CR>', description = 'hover' },
    { ']r', ':lua require("navigator.treesitter").goto_next_usage()<CR>', description = 'goto next usage' },
    { '[r', ':lua require("navigator.treesitter").goto_previous_usage()<CR>', description = 'goto previous usage' },

    -- terminal
    { '<leader>th', ':ToggleTerm direction=horizontal<CR>', description = 'terminal horizontal' },
    { '<leader>tl', ':ToggleTerm direction=vertical<CR>', description = 'terminal vertical' },
    { '<leader>tf', ':ToggleTerm direction=float<CR>', description = 'terminal float' },
  },
  commands = {
    -- packer
    { ':PackerUpdate', description = 'Packer Update' },
    { ':PackerInstall', description = 'Packer Install' },
    { ':PackerCompile', description = 'Packer Compile' },
    -- lsp
    { ':LspInfo', description = 'Lsp Info' },
    { ':LspLog', description = 'Lsp Log' },
    { ':LspRestart', description = 'Lsp Restart' },
    -- telescope
    -- { ':Telescope keymaps', description = 'Show keymaps' },
    -- { ':Telescope vim_options', description = 'Telescope vim_options' },
    -- { ':Telescope lsp_dynamic_workspace_symbols', description = 'lsp_dynamic_workspace_symbol' },
    -- { ':Telescope lsp_document_symbols', description = 'lsp_document_symbols' },
    -- { ':Telescope commands', description = 'Lists available plugin/user commands' },
    -- { ':Telescope help_tags', description = 'help_tags' },
    -- { ':Telescope colorscheme', description = 'colorscheme' },
    -- search/replace
    -- { ':lua require("spectre").open_visual({select_word=true})', description = 'search current word' },
    -- { ':lua lua require("spectre").open_file_search()', description = 'search in current file' },
    -- Code Runner
    { ':RunFile', description = 'Run the current file' },
    --- terminal
    { ':ToggleTerm direction=horizontal', description = 'Open terminal horizontal' },
    { ':ToggleTerm direction=float', description = 'Open terminal float' },
    -- comments
    { ':TodoQuickFix', description = ':TodoQuickFix' },
    { ':TodoLocList', description = 'TodoLocList' },
    { ':TodoTelescope', description = 'TodoTelescope' },
    -- tree
    -- { ':Neotree source=filesystem reveal=true', description = 'reveal file' },
  },
  functions = {

  },
}
