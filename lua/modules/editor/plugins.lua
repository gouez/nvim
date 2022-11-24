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
editor["folke/todo-comments.nvim"] = {
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {}
  end
}
editor["ray-x/sad.nvim"] = {
  cmd = { "Sad" },
  opt = true,
  config = function()
    require("sad").setup({ debug = false, vsplit = false, height_ratio = 0.8 })
  end,
}
editor["kevinhwang91/nvim-ufo"] = {
  opt = true,
  requires = { "kevinhwang91/promise-async" },
  config = conf.ufo,
}
editor["booperlv/nvim-gomove"] = {
  -- event = { "CursorMoved", "CursorMovedI" },
  keys = { "v", "V", "<c-v>", "<c-V>" },
  config = conf.move,
}
editor["kylechui/nvim-surround"] = {
  opt = true,
  -- opt for sandwitch for now until some issue been addressed
  -- event = { "CursorMoved", "CursorMovedI" },
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      -- sournd  cs, ds, yss
      keymaps = {
        -- default
        -- [insert] = "ys",
        -- insert_line = "yss",
        visual = "<Leader>cr",
        -- delete = "ds",
        -- change = "cs",
      },
    })
  end,
}
return editor
