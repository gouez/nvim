local api, lsp = vim.api, vim.lsp
local my_group = vim.api.nvim_create_augroup('GouGroup', {})


vim.cmd([[
      augroup daprepl
        autocmd FileType dap-repl set nobuflisted
      augroup end
    ]])
-- auto save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    command = "silent! wall",
    nested = true,
})

-- remove auto-comments
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

vim.api.nvim_create_user_command("BufferDelete", function()
    ---@diagnostic disable-next-line: missing-parameter
    local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
    local modified = vim.api.nvim_buf_get_option(0, "modified")
    if file_exists == 0 and modified then
        local user_choice = vim.fn.input("The file is not saved, whether to force delete? Press enter or input [y/n]:")
        if user_choice == "y" or string.len(user_choice) == 0 then
            vim.cmd("bd!")
        end
        return
    end
    local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"
    vim.cmd(force and "bd!" or string.format("bp | bd! %s", vim.api.nvim_get_current_buf()))
end, { desc = "Delete the current Buffer while maintaining the window layout" })

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]   )
    end,
})


api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = my_group,
    pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
    callback = function()
        vim.opt_local.undofile = false
    end,
})

api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'InsertLeave' }, {
    group = my_group,
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'dashboard' and not vim.opt_local.cursorline:get() then
            vim.opt_local.cursorline = true
        end
    end,
})

api.nvim_create_autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
    group = my_group,
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'dashboard' and vim.opt_local.cursorline:get() then
            vim.opt_local.cursorline = false
        end
    end,
})

api.nvim_create_autocmd({ 'BufEnter' }, {
    group = my_group,
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'NvimTree' then
            local val = '%#WinbarNvimTreeIcon#   %*'
            local path = vim.fn.getcwd()
            path = path:gsub(vim.env.HOME, '~')
            val = val .. '%#WinbarPath#' .. path .. '%*'
            api.nvim_set_hl(0, 'WinbarNvimTreeIcon', { fg = '#98be65' })
            api.nvim_set_hl(0, 'WinbarPath', { fg = '#fab795' })
            api.nvim_win_set_option(0, 'winbar', val)
        end
    end,
})
