return function(wk)
--[[============================================================================
-- Markdown Preview
--============================================================================]]
    wk.register({
        d = {
            name = "Display Preview",
            ['b'] = "which_key_ignore",
            ['r'] = { vim.cmd.MarkdownPreview, "Run/Start" },

            ['l'] = "which_key_ignore",
            ['j'] = "which_key_ignore",
            ['h'] = "which_key_ignore",
            ['<CR>'] = "which_key_ignore",

            ['s'] = {vim.cmd.MarkdownPreviewStop, "Stop" },
        }
    }, { prefix="<leader>", mode = "n" })
end
