require("project_nvim").setup({
    datapath = vim.fn.stdpath("data"),
    ignore_lsp = { "efm" },
    exclude_dirs = { "~/.cargo/*" },
    silent_chdir = true,
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  })
  require("utils.telescope")
  require("telescope").load_extension("projects")