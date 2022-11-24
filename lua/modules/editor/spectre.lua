if not packer_plugins["plenary.nvim"].loaded then
  require("packer").loader("plenary.nvim")
end

require('spectre').setup()
