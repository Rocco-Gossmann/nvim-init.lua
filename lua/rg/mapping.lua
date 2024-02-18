-- Commonn - Keymaps
-- -- Telescope
vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc = "[F]ind [F]ile" })
vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers, { desc = "[F]ind [B]uffer" })
vim.keymap.set("n", "<leader>fs", require('telescope.builtin').live_grep, { desc = "[F]ind [S]tring" })
vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>ft', require('telescope.builtin').builtin, { desc = '[F]ind [T]elescope' })

-- -- Splits
vim.keymap.set('n', 'El', '<cmd>vs<cr><C-w>l<cmd>e .<cr>', { desc = '[E]xplorer right' })
vim.keymap.set('n', 'Eh', '<cmd>vs .<cr>', { desc = '[E]xplorer left' })
vim.keymap.set('n', 'Ej', '<cmd>sp<cr><C-w>j<cmd>e .<cr>', { desc = '[E]xplorer bottom' })
vim.keymap.set('n', 'Ek', '<cmd>sp .<cr>', { desc = '[E]xplorer top' })

vim.keymap.set('n', '_', '<cmd>sp<cr>', { desc = 'Split Vertical' })
vim.keymap.set('n', 'I', '<cmd>vs<cr>', { desc = 'Split Horizontal' })


-- Keymaps, that differ per FileType (Due to differennt technics and binaries being used)

-- <leader>cf - code Format


-- PHP
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.php" },
    callback = function()
        vim.keymap.set('n', '<leader>cf', "<cmd>w<cr><cmd>!pretty-php -q %<cr>", { desc = '[C]ode [F]ormat' });
    end
})

-- Lua
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.lua" },
    callback = function()
        vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = '[C]ode [F]ormat' });
    end
})

-- Markdown, Java-/Typescript, (s)css, JSON, JSX
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", ".html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" },
    callback = function()
        vim.keymap.set('n', '<leader>cf', "<cmd>Prettier<cr>", { desc = '[C]ode [F]ormat' });
    end
})


-- vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
-- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
