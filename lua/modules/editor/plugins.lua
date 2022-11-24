local editor = {}
local conf = require('modules.editor.config')


editor["windwp/nvim-autopairs"] = {
  -- keys = {{'i', '('}},
  -- keys = {{'i'}},
  after = { "nvim-cmp" }, -- "nvim-treesitter", nvim-cmp "nvim-treesitter", coq_nvim
  -- event = "InsertEnter",  --InsertCharPre
  -- after = "hrsh7th/nvim-compe",
  config = "require('modules.editor.autopairs')",
  opt = true,
}

editor["NvChad/nvim-colorizer.lua"] = {
  config = function()
    require 'colorizer'.setup()
  end
}
editor["numToStr/Comment.nvim"] = { event = BufRead, config = "require('Comment').setup()" }
editor["windwp/nvim-spectre"] = { event = BufRead, config = "require('spectre')" }

return editor
