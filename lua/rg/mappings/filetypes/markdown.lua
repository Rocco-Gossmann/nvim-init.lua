return function(wk)
--[[============================================================================
-- Markdown Preview
--============================================================================]]
    wk.register({
        ['q'] = {
            name = "Display Preview",

            ['r'] = { vim.cmd.MarkdownPreview, "Run/Start" },
            ['s'] = {vim.cmd.MarkdownPreviewStop, "Stop" },

            ['b'] = "which_key_ignore",

            ['l'] = "which_key_ignore",
            ['j'] = "which_key_ignore",
            ['h'] = "which_key_ignore",
            ['<CR>'] = "which_key_ignore",

            ['<space>'] = "which_key_ignore",
            ['c'] = "which_key_ignore",
        }
    }, { mode = "n" })
end
