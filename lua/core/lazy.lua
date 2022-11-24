local loader = require("packer").loader
local start = vim.loop.now()
local function randomscheme()
  local themes = {
    "papercolor-theme",
    "neovim",
    "gruvbox-material",
    "nightfox.nvim",
  }
  math.randomseed(os.time())
  local v = math.random(1, #themes)
  local loading_theme = themes[v]
  return loading_theme
end

local loading_theme = randomscheme()

local function load_colorscheme(theme)
  require("packer").loader(theme)
end

load_colorscheme(loading_theme)

vim.cmd('highlight NormalFloat         guifg=none      guibg=none  gui=none')

local lazy_timer = 20

vim.defer_fn(function()
  loader("hydra.nvim")
end, lazy_timer + 80)
