local tools = {}
local conf = require('modules.tools.config')

tools["nvim-lua/plenary.nvim"] = {}

tools["mrjones2014/legendary.nvim"] = {
  requires = "dressing.nvim",
  config = "require('modules.tools.legendary')",
}

tools["nvim-telescope/telescope.nvim"] = {
  cmd = 'Telescope',
  config = "require('modules.tools.telescope')",
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
    { 'nvim-telescope/telescope-dap.nvim', opt = true },
  },
}

tools["akinsho/toggleterm.nvim"] = {
  cmd = { "ToggleTerm", "TermExec" },
  event = { "CmdwinEnter", "CmdlineEnter" },
  config = "require('modules.tools.floaterm')",
}

tools["sindrets/diffview.nvim"] = {
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
    "DiffviewFocusFiles",
    "DiffviewToggleFiles",
    "DiffviewRefresh",
  },
  config = "require('modules.tools.diffview')",
}

tools["lewis6991/gitsigns.nvim"] = {
  config = "require('modules.tools.gitsigns')",
  -- keys = {']c', '[c'},  -- load by lazy.lua
  opt = true,
}

-- early stage...
tools["tanvirtin/vgit.nvim"] = { -- gitsign has similar features
  setup = function()
    vim.o.updatetime = 2000
  end,
  cmd = { "VGit" },
  -- after = {"telescope.nvim"},
  opt = true,
  config = "require('modules.tools.vgit')",
}

tools["akinsho/git-conflict.nvim"] = {
  cmd = {
    "GitConflictListQf",
    "GitConflictChooseOurs",
    "GitConflictChooseTheirs",
    "GitConflictChooseBoth",
    "GitConflictNextConflict",
  },
  opt = true,
  config = "require('modules.tools.git-conflict')",
}

tools["tpope/vim-fugitive"] = {
  cmd = { "Gvsplit", "Git", "Gedit", "Gstatus", "Gdiffsplit", "Gvdiffsplit", "Flog", "Flogsplit" },
  opt = true,
}

-- tools["rmagatti/auto-session"] = { config = conf.session }
tools["Shatur/neovim-session-manager"] = { config = conf.session }

tools["rmagatti/session-lens"] = {
  opt = true,
  -- cmd = "SearchSession",
  -- after = { "telescope.nvim" },
  config = function()
    require("packer").loader("telescope.nvim")
    require("telescope").load_extension("session-lens")
    require("session-lens").setup({
      path_display = { "shorten" },
      theme_conf = { border = true },
      previewer = true,
    })
  end,
}

tools["kevinhwang91/nvim-bqf"] = {
  opt = true,
  event = { "CmdlineEnter", "QuickfixCmdPre" },
  config = "require('modules.tools.bqf')",
}

-- lua require'telescope'.extensions.project.project{ display_type = 'full' }
tools["ahmedkhalf/project.nvim"] = {
  opt = true,
  after = { "telescope.nvim" },
  config = "require('modules.tools.project')"
}
tools["phaazon/hop.nvim"] = {
  event = "BufRead",
  opt = true,
  config = function()
    require("hop").setup({ key = "etovxqpdygfblzhckisuran" })
  end
}
return tools
