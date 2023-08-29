vim.schedule(function()

    vim.cmd [[

        set foldexpr=nvim_treesitter#foldexpr()

        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

    ]]

    vim.opt.foldmethod="expr"
end)
