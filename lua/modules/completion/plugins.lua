local completion = {}
local conf = require('modules.completion.config')

completion["williamboman/mason.nvim"] = {
  config = conf.mason,
  requires = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
}

completion["hrsh7th/nvim-cmp"] = {
  after = { "LuaSnip" },
  config = "require('modules.completion.nvim-cmp')",
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
    { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", opt = true },
    { "hrsh7th/cmp-cmdline", after = "nvim-cmp", opt = true },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', opt = true },
    { "hrsh7th/cmp-cmdline", after = "nvim-cmp", opt = true },
    { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } },
  },
}
completion["ray-x/navigator.lua"] = {
  event = 'BufRead',
  requires = {
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    { 'onsails/lspkind.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'neovim/nvim-lspconfig' }
  },
  config = function()
    require 'modules.completion.navigator'
  end
}

completion["glepnir/lspsaga.nvim"] = {
  after = 'nvim-lspconfig', config = conf.lspsaga
}

completion["ray-x/lsp_signature.nvim"] = {
  opt = true,
  config = function()
    require("lsp_signature").setup({
      bind = true,
      floating_window = true,
      floating_window_above_cur_line = true,
      hint_enable = true,
      fix_pos = false,
      log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
      zindex = 1002,
      timer_interval = 100,
      extra_trigger_chars = {},
      handler_opts = {
        border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
      },
      max_height = 4,
      toggle_key = [[<M-x>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
      -- select_signature_key = [[<M-n>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
      select_signature_key = [[<M-c>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
    })
  end,
}

completion["L3MON4D3/LuaSnip"] = {
  event = 'InsertEnter',
  config = "require('modules.completion.lua-snip')",
  requires = { "rafamadriz/friendly-snippets", event = "InsertEnter" }, -- , event = "InsertEnter"
}

return completion
