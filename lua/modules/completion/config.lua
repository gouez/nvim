local config = {}


function config.mason()
  local mason = require("modules.completion.mason")
  mason.setup()
end

function config.lspsaga()
  local saga = require('lspsaga')
  saga.init_lsp_saga({
    symbol_in_winbar = {
      enable = true,
    },
  })
end

return config
