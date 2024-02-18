vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files,  { desc = "[F]ind [F]ile"})
vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers,     { desc = "[F]ind [B]uffer"})
vim.keymap.set("n", "<leader>fs", require('telescope.builtin').live_grep,   { desc = "[F]ind [S]tring"})
vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags,   { desc = "[F]ind [H]elp"})
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume,      { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>ft', require('telescope.builtin').builtin,     { desc = '[F]ind [T]elescope' })




-- vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
-- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
