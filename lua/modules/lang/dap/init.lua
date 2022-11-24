local utils = require("utils.func")
local dap_status_ok, dap = pcall(require, "dap")

if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

dapui.setup({
  expand_lines = true,
  icons = { expanded = "", collapsed = "", circular = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    -- 	max_height = 0.9,
    -- 	max_width = 0.5, -- Floats will be treated as percentage of your screen.
    -- 	border = vim.g.single, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local configurations_dir_path = "modules.lang.dap.conf"
local require_file_tbl = utils.get_importable_subfiles(configurations_dir_path)

for _, require_file in ipairs(require_file_tbl) do
  local dap_config = require(require_file)
  dap.adapters = vim.tbl_deep_extend("force", dap.adapters, dap_config.adapters)
  dap.configurations = vim.tbl_deep_extend("force", dap.configurations, dap_config.configurations)
end
