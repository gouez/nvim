local config = {}


function config.nightfox()

  local t = {
    "carbonfox",
    "terafox"
  }
  math.randomseed(os.time())
  local v = math.random(1, #t)

  vim.cmd("colorscheme " .. t[v])

end

function config.aurora()
  
end

return config
