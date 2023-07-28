return function(wk)
--[[============================================================================
-- Go run
--============================================================================]]
    wk.register({
        ['e'] = {
            name = "Run",

            ['d'] = {":w<cr>:!go run %<CR>", "Run file"},

            ['b'] = "which_key_ignore",
            ['r'] = "which_key_ignore",

            ['l'] = "which_key_ignore",
            ['j'] = "which_key_ignore",
            ['h'] = "which_key_ignore",
            ['<CR>'] = "which_key_ignore",

            ['s'] = "which_key_ignore",
            ['<space>'] = "which_key_ignore",
            ['c'] = "which_key_ignore",
        }
    }, { mode = "n" })
end
