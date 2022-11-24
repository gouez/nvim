local ui = {}
local conf = require('modules.ui.config')

ui["kyazdani42/nvim-web-devicons"] = {}

ui["rose-pine/neovim"] = { opt = true, config = function()
  vim.cmd([[colorscheme  rose-pine]])
end }
ui["NLKNguyen/papercolor-theme"] = { opt = true, config = function()

  vim.cmd([[colorscheme  papercolor]])
  vim.cmd('hi VertSplit  guifg=#444444   guibg=none gui=none')
end }
ui["sainnhe/gruvbox-material"] = { opt = true, config = "require('modules.ui.gruvbox')" }
ui["EdenEast/nightfox.nvim"] = { opt = true, config = conf.nightfox }
ui["ray-x/aurora"] = { opt = true, config = conf.aurora }

ui["goolord/alpha-nvim"] = {
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require 'alpha'.setup(require 'alpha.themes.startify'.config)
  end
}


ui["windwp/windline.nvim"] = {
  config = "require('modules.ui.windline')",
  opt = false,
}


ui["nvim-neo-tree/neo-tree.nvim"] = {
  cmd = { "Neotree" },
  requires = {
    "MunifTanjim/nui.nvim",
    { "nvim-lua/plenary.nvim", opt = true },
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  module = "neo-tree",
  branch = "v2.x",
  config = "require('modules.ui.neo-tree')",
}

ui["akinsho/nvim-bufferline.lua"] = {
  config = "require('modules.ui.bufferline')",
  event = "UIEnter",
  opt = true,
}

ui["lukas-reineke/indent-blankline.nvim"] = { config = "require('modules.ui.blankline')" }

return ui
