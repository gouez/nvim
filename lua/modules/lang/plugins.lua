local lang = {}
local conf = require('modules.lang.config')

lang["nvim-treesitter/nvim-treesitter"] = {
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = "require('modules.lang.nvim-treesitter')",
}

lang["nvim-treesitter/nvim-treesitter-textobjects"] = {
  after = 'nvim-treesitter'
}

lang["ray-x/go.nvim"] = {
  ft = { "go", "gomod" }, module = { "go" }, config = "require('modules.lang.go')",
}

lang["simrat39/symbols-outline.nvim"] = {
  opt = true,
  cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
  config = function()
    require("symbols-outline").setup({})
  end,
}

lang["jose-elias-alvarez/null-ls.nvim"] = { opt = true, config = require("modules.lang.null-ls").config }
lang["mfussenegger/nvim-dap"] = { config = "require('modules.lang.dap')" }
lang["rcarriga/nvim-dap-ui"] = {}
lang["theHamsta/nvim-dap-virtual-text"] = {}
lang["cshuaimin/ssr.nvim"] = { module = "ssr", config = conf.ssr }
lang["mfussenegger/nvim-dap-python"] = { ft = { "python" } }
lang["CRAG666/code_runner.nvim"] = {
  opt = true,
  cmd = { "RunCode", "RunFile" },
  requires = 'nvim-lua/plenary.nvim',
  config = "require('modules.lang.code-runner')"
}
lang["sakhnik/nvim-gdb"] = {
  opt = true,
  run = "./install.sh",
  cmd = { "GdbStart", "GdbStartLLDB" },
  config = "require('modules.lang.gdb')"
}
return lang
