local config = {}


function config.move()
  require("gomove").setup({
    -- whether or not to map default key bindings, (true/false)
    map_defaults = true,
    -- what method to use for reindenting, ("vim-move" / "simple" / ("none"/nil))
    reindent_mode = "vim-move",
    -- whether to not to move past line when moving blocks horizontally, (true/false)
    move_past_line = false,
    -- whether or not to ignore indent when duplicating lines horizontally, (true/false)
    ignore_indent_lh_dup = true,
  })
end

function config.ufo()
  --- not all LSP support this
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ("  %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
  end
  local whitelist = {
    ["gotmpl"] = "indent",
    ["python"] = "lsp",
    ["html"] = "indent",
  }
  require("ufo").setup({
    -- fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype)
      if whitelist[filetype] then
        return whitelist[filetype]
      end
      return ""
    end,
  })
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.o.ft
  if whitelist[ft] then
    require("ufo").setVirtTextHandler(bufnr, handler)
  end
end

return config
