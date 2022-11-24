local M = {}

M.join = function(...)
  return table.concat(vim.tbl_flatten({ ... }), "/")
end

M.get_importable_subfiles = function(dir)

  local sub_dir = dir:gsub("%.", "/")
  local root_dir = M.join(vim.fn.stdpath("config"), "lua", sub_dir)

  ---@diagnostic disable-next-line: param-type-mismatch
  local file_tbl = vim.fn.globpath(root_dir, "*.lua", false, true)

  for i, v in ipairs(file_tbl) do
    file_tbl[i] = string.format("%s/%s", sub_dir, vim.fn.fnamemodify(v, ":t:r"))
  end

  return file_tbl
end

return M
