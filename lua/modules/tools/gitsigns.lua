if not packer_plugins["plenary.nvim"].loaded then
    require("packer").loader("plenary.nvim")
  end
  require("gitsigns").setup({
    signs = {
      add = { hl = "GitGutterAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitGutterChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitGutterDelete", text = "ﬠ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitGutterDelete", text = "ﬢ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = {
        hl = "GitGutterChangeDelete",
        text = "┊",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    -- sign_priority = 6,
    update_debounce = 400,
    numhl = false,
    word_diff = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      -- Actions
      map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
      map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
      -- map("n", "<leader>hS", gs.stage_buffer) -- hydra
      -- map("n", "<leader>hu", gs.undo_stage_hunk)
      -- map("n", "<leader>hR", gs.reset_buffer)
      -- map("n", "<leader>hp", gs.preview_hunk)
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end)
      map("n", "<leader>tb", gs.toggle_current_line_blame)
      map("n", "<leader>hd", gs.diffthis)
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end)
      -- map("n", "<leader>td", gs.toggle_deleted)

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,

    watch_gitdir = { interval = 1000, follow_files = true },
    status_formatter = nil, -- Use default
    debug_mode = false,
    current_line_blame = true,
    current_line_blame_opts = { delay = 1500 },
    diff_opts = { internal = true },
  })

  vim.api.nvim_set_hl(0, "GitSignsAddInline", { link = "DiffAdd" }) -- diff mode: Deleted line |diff.txt|
  vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { link = "DiffDelete" }) -- diff mode: Deleted line |diff.txt|
  vim.api.nvim_set_hl(0, "GitSignsChangeInline", { link = "DiffAdd" }) -- diff mode: Deleted line |diff.txt|
  vim.api.nvim_create_user_command("Stage", "'<,'>Gitsigns stage_hunk", { range = true })