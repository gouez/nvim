-- Set floaterm window's background to black
  -- Set floating window border line color to cyan, and background to orange
  require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    -- shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = "curved",
      -- width = <value>,
      -- height = <value>,
      winblend = 3,
    },
  })
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({ cmd = "lazygit --debug", hidden = true })
  local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

  function _lazygit_toggle()
    lazygit:toggle()
  end

  function _lazydocker_toggle()
    lazydocker:toggle()
  end

  function _gd_toggle(...)
    local args = { ... }
    local ver
    if #args > 0 then
      ver = args[1]
    else
      ver = ""
    end
    local cmd = "gd" .. " " .. ver
    if ver == "a" then
      cmd = "git diff"
    end
    local gd = Terminal:new({ cmd = cmd, hidden = true })
    gd:toggle()
    vim.cmd("normal! a")
  end

  function _jest_test()
    local cmd = "npx vue-cli-service test:unit --testPathPattern=" .. [["]] .. vim.fn.expand("%:t") .. [["]]
    local gd = Terminal:new({ cmd = cmd, hidden = true })
    gd:toggle()
  end

  vim.cmd("command! LG lua _lazygit_toggle()")
  vim.cmd("command! -nargs=* GD lua _gd_toggle(<f-args>)")
  vim.cmd("command! LD lua _lazydocker_toggle()")
  vim.cmd("command! Jest lua _jest_test()")

  local fzf = Terminal:new({ cmd = "fzf", hidden = true })

  function _fzf_toggle()
    fzf:toggle()
  end

  vim.cmd("command! FZF lua _fzf_toggle()")
  -- vim.cmd("command! NNN FloatermNew --autoclose=1 --height=0.96 --width=0.96 nnn")
  -- vim.cmd("command! FN FloatermNew --autoclose=1 --height=0.96 --width=0.96")
  -- vim.cmd("command! LG FloatermNew --autoclose=1 --height=0.96 --width=0.96 lazygit")
  -- vim.cmd("command! Ranger FloatermNew --autoclose=1 --height=0.96 --width=0.96 ranger")

  -- vim.g.floaterm_gitcommit = "split"
  -- vim.g.floaterm_keymap_new = "<F19>" -- S-f7
  -- vim.g.floaterm_keymap_prev = "<F20>"
  -- vim.g.floaterm_keymap_next = "<F21>"
  -- vim.g.floaterm_keymap_toggle = "<F24>"
  -- Use `git ls-files` for git files, use `find ./ *` for all files under work directory.
  -- grep -rli 'old-word' * | xargs -i@ sed -i 's/old-word/new-word/g' @
  --  rg -l 'old-word' * | xargs -i@ sed -i 's/old-word/new-word/g' @