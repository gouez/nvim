-- use this as a diff tool (faster than Diffview)
-- there are overlaps with gitgutter. following are nice features
if true then
  -- skip vgit setup as it conflict with gitsigns
  return
end
require("vgit").setup({
  keymaps = {},
  settings = {
    live_gutter = {
      enabled = false,
      edge_navigation = false, -- This allows users to navigate within a hunk
    },
    live_blame = {
      enabled = false,
    },
    authorship_code_lens = {
      enabled = false,
    },
    scene = {
      diff_preference = "unified",
    },
    diff_preview = {
      keymaps = {
        buffer_stage = "S",
        buffer_unstage = "U",
        buffer_hunk_stage = "s",
        buffer_hunk_unstage = "u",
        toggle_view = "t",
      },
    },
    signs = {
      priority = 4,
      definitions = {
        GitSignsAdd = {
          texthl = "GitSignsAdd",
          text = "|",
        },
        -- GitSignsDelete = {
        --   texthl = "GitSignsDelete",
        --   text = "d",
        -- },
        GitSignsChange = {
          texthl = "GitSignsChange",
          text = "|",
        },
      },
    },
  },
})

