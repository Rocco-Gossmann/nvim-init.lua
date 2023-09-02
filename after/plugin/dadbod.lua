vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql" },
    command = [[setlocal omnifunc=vim_dadbod_competion#omni]],
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
        vim.schedule(function()
            require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
        end)
    end
})
