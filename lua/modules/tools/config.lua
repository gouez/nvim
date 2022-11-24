local config = {}

function config.session()
  -- if not packer_plugins["plenary.nvim"].loaded then
  --   require("packer").loader("plenary.nvim")
  -- end
  --
  -- local Path = require('plenary.path')
  require('session_manager').setup({
    -- autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  })
end

return config
