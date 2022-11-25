local config = {}


function config.nightfox()

  local t = {
    "carbonfox",
  }
  math.randomseed(os.time())
  local v = math.random(1, #t)

  vim.cmd("colorscheme " .. t[v])

end

function config.aurora()

end

function config.noice()
  require("noice").setup({
    cmdline = {
      enabled = false,
      -- view = "cmdline",
      -- opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
      -- icons = {
      --   ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
      --   ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
      --   [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
      -- },
    },
    messages = {
      enabled = false,
    },
    lsp_progress = {
      enabled = true,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      --- @type NoiceFormat|string
      format = "lsp_progress",
      --- @type NoiceFormat|string
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- frequency to update lsp progress message
      view = "mini",
    },
  })
end

function config.notify()
  -- local loader = require("packer").loader
  -- if not packer_plugins["telescope.nvim"].loaded then
  --   loader("telescope.nvim")
  -- end

  require("notify").setup({
    -- Animation style (see below for details)
    stages = "fade_in_slide_out", -- "slide",

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 5000,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    background_colour = function()
      local group_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg#")
      if group_bg == "" or group_bg == "none" then
        group_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Float")), "bg#")
        if group_bg == "" or group_bg == "none" then
          return "#000000"
        end
      end
      return group_bg
    end,

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })
  -- require("telescope").load_extension("notify")
  vim.notify = require("notify")

end

return config
