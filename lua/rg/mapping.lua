local silnor = {noremap=true, silent=true}

--[[============================================================================
-- Repeated COmmands
--============================================================================]]
local sysClipCopy = '"+yy'
local replaceUnderCursor = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";

--[[============================================================================
-- Select + Visual Mode helpers
--============================================================================]]
vim.keymap.set({"x"}, "J", ":m '>+1<CR>gv=gv", silnor); -- Move Selected Line Down 
vim.keymap.set({"x"}, "K", ":m '<-2<CR>gv=gv", silnor); -- Move Selected Line Up
vim.keymap.set({"x"}, '<leader>p', '"_dP', silnor);

vim.keymap.set({"x"}, "<C-r>", ":s///gI<Left><Left><Left><Left>", {noremap=true});                  -- Replace in selection
vim.keymap.set({"x"}, "<C-l>", ":s/^\\(\\s\\{-\\}\\)//gI<Left><Left><Left><Left>", {noremap=true}); -- Replace in sleected line (preselected whitespace group)
vim.keymap.set({"x"}, "<C-y>"         , sysClipCopy, silnor);

vim.keymap.set({'n'}, '<C-n>', '<cmd>NERDTreeToggle<cr>')
vim.keymap.set({'n'}, '<leader>fe', '<cmd>NERDTreeFind<cr>')
vim.keymap.set({'n'}, '<leader>lg', '<cmd>LazyGit<cr>')

--[[============================================================================
-- Hints and Hovers
--============================================================================]]
-- -- Insert - Mode use 
vim.keymap.set({"i"}, '<C-j>', '<cmd>lua vim.lsp.buf.completion({ reason = require("cmp").ContextReason.Auto })<CR>', silnor);
vim.keymap.set({"i"}, '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silnor);

vim.keymap.set({"n"}, '<S-h>', function() vim.lsp.buf.hover() end, {desc='Hover Documentation'});
vim.keymap.set({"n"}, '<S-k>', function() vim.lsp.buf.signature_help() end, {desc='Signature Documentation'});


--[[============================================================================
-- Surround with
--============================================================================]]
vim.keymap.set({"v"}, "<space>", 'c  <ESC>hmzplv`z', silnor);
vim.keymap.set({"v"}, ".", 'c..<ESC>hmzplv`z', silnor);
vim.keymap.set({"v"}, "\"", 'c""<ESC>hmzplv`z', silnor);
vim.keymap.set({"v"}, "'", "c''<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "`", "c``<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "(", "c()<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "[", "c[]<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "{", "c{}<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "-", "c--<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "_", "c__<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "*", "c**<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "~", "c~~<ESC>hmzplv`z", silnor);
vim.keymap.set({"v"}, "/", "c//<ESC>hmzplv`z", silnor);

--[[============================================================================
-- Mapping m/M + numbers to Global Bookmarks
--============================================================================]]
vim.keymap.set({'n'}, 'M1', 'mA'   , silnor)
vim.keymap.set({'n'}, 'M2', 'mB'   , silnor)
vim.keymap.set({'n'}, 'M3', 'mC'   , silnor)
vim.keymap.set({'n'}, 'M4', 'mD'   , silnor)
vim.keymap.set({'n'}, 'M5', 'mE'   , silnor)
vim.keymap.set({'n'}, 'M6', 'mF'   , silnor)
vim.keymap.set({'n'}, 'M7', 'mG'   , silnor)
vim.keymap.set({'n'}, 'M8', 'mH'   , silnor)
vim.keymap.set({'n'}, 'M9', 'mI'   , silnor)
vim.keymap.set({'n'}, 'M0', 'mJ'   , silnor)

vim.keymap.set({'n'}, 'm1', '`A'   , silnor)
vim.keymap.set({'n'}, 'm2', '`B'   , silnor)
vim.keymap.set({'n'}, 'm3', '`C'   , silnor)
vim.keymap.set({'n'}, 'm4', '`D'   , silnor)
vim.keymap.set({'n'}, 'm5', '`E'   , silnor)
vim.keymap.set({'n'}, 'm6', '`F'   , silnor)
vim.keymap.set({'n'}, 'm7', '`G'   , silnor)
vim.keymap.set({'n'}, 'm8', '`H'   , silnor)
vim.keymap.set({'n'}, 'm9', '`I'   , silnor)
vim.keymap.set({'n'}, 'm0', '`J'   , silnor)

--[[ ===========================================================================
-- Snippet Helpers
--============================================================================]]
-- You can set [NXT] in side your snippes etc, and then use 2xTab to start editing the location
-- they are in
vim.keymap.set({"n"}, "<Tab><Tab>", "/\\[NXT\\]<CR>v%c", {silent=true});
vim.keymap.set({"i"}, "<S-Tab>", "<esc>/\\[NXT\\]<CR>v%c", {silent=true});

-- Keep Cursor centered, when jumping and searching
vim.keymap.set({"v"}, "n", "nzz", silnor);
vim.keymap.set({"v"}, "N", "Nzz", silnor);
vim.keymap.set({"v"}, "<C-d>", "<C-d>zz", silnor);
vim.keymap.set({"v"}, "<C-u>", "<C-u>zz", silnor);

--[[============================================================================
-- Splits
--============================================================================]]
vim.keymap.set({'n'}, 'EE', '<cmd>e .<cr>', { desc = '[E]xplorer in place' })
vim.keymap.set({'n'}, 'El', '<cmd>vs<cr><C-w>l<cmd>e .<cr>', { desc = '[E]xplorer right' })
vim.keymap.set({'n'}, 'Eh', '<cmd>vs .<cr>', { desc = '[E]xplorer left' })
vim.keymap.set({'n'}, 'Ej', '<cmd>sp<cr><C-w>j<cmd>e .<cr>', { desc = '[E]xplorer bottom' })
vim.keymap.set({'n'}, 'Ek', '<cmd>sp .<cr>', { desc = '[E]xplorer top' })
vim.keymap.set({'n'}, 'Et', '<cmd>tabnew .<cr>', { desc = '[E]xplorer [t]ab' })

vim.keymap.set({'n'}, '<C-_>', '<cmd>sp<cr>', { desc = 'Split Vertical' })
vim.keymap.set({'n'}, '<C-i>', '<cmd>vs<cr>', { desc = 'Split Horizontal' })



-- Commonn - Keymaps
--============================================================================]]
-- -- Telescope
vim.keymap.set({"n"}, "<leader>ff", require('telescope.builtin').find_files, { desc = "[F]ind [F]ile" })
-- vim.keymap.set({"n"}, "<leader>fb", require('telescope.builtin').buffers, { desc = "[F]ind [B]uffer" })
vim.keymap.set({"n"}, "<leader>fs", require('telescope.builtin').live_grep, { desc = "[F]ind [S]tring" })
vim.keymap.set({"n"}, "<leader>fh", require('telescope.builtin').help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set({'n'}, '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set({'n'}, '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set({'n'}, '<leader>ft', require('telescope.builtin').lsp_document_symbols, { desc = '[F]ind [T]elescope' })
vim.keymap.set({'n'}, '<leader>fe', '<cmd>NERDTreeFind<cr>', {desc = '[F]ind in [E]xplorer'})

vim.keymap.set({'n'}, '<leader>fg', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[F]uzzily search in current buffer' })

-- -- Git Signs
local gs = package.loaded.gitsigns
vim.keymap.set({'n'}, '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set({'n'}, '<leader>gs', gs.stage_hunk, { desc = 'git stage hunk' })
vim.keymap.set({'n'}, '<leader>gu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
vim.keymap.set({'n'}, '<leader>gS', gs.stage_buffer, { desc = 'git Stage buffer' })

-- vim.keymap.set({'n'}, '<leader>gr', gs.reset_hunk, { desc = 'git reset hunk' })
-- vim.keymap.set({'n'}, '<leader>gR', gs.reset_buffer, { desc = 'git Reset buffer' })
vim.keymap.set({'n'}, '<leader>gp', gs.preview_hunk, { desc = 'preview git hunk' })
vim.keymap.set({'n'}, '<leader>gb', function() gs.blame_line { full = false } end, { desc = 'git blame line' })
vim.keymap.set({'n'}, '<leader>gd', gs.diffthis, { desc = 'git diff against index' })
vim.keymap.set({'n'}, '<leader>gD', function() gs.diffthis '~' end, { desc = 'git diff against last commit' })

vim.keymap.set({'n'}, '<leader>gc', "<cmd>Git commit<cr>", { desc = 'git diff against last commit' })
vim.keymap.set({'n'}, '<leader>gl', "<cmd>Gclog<cr>", { desc = 'git diff against last commit' })

-- vim.keymap.set({'v'}, '<leader>hs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'stage git hunk' })
-- vim.keymap.set({'v'}, '<leader>hr', function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'reset git hunk' })

-- -- TMUX-Navigations
vim.keymap.set({"n"}, "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  silnor)
vim.keymap.set({"n"}, "<C-j>", "<cmd>TmuxNavigateDown<cr>",  silnor)
vim.keymap.set({"n"}, "<C-k>", "<cmd>TmuxNavigateUp<cr>",    silnor)
vim.keymap.set({"n"}, "<C-l>", "<cmd>TmuxNavigateRight<cr>", silnor)

--
-- Keymaps, that differ per FileType (Due to differennt technics and binaries being used)

-- <leader>cf - Code-Format
-- D - Debug-Action

-- -- PHP - Code-Formating / Debugger
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.php" },
    callback = function()
        vim.keymap.set({'n'}, '<leader>cf', "<cmd>w<cr><cmd>!pretty-php -q %<cr>", { desc = '[C]ode [F]ormat' });
        require("rg.hydras.xdebug")
    end
})

-- -- Lua - Code-Formatting
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.lua" },
    callback = function()
        vim.keymap.set({'n'}, '<leader>cf', vim.lsp.buf.format, { desc = '[C]ode [F]ormat' });
    end
})

-- -- Code - Formating -- Markdown, Java-/Typescript, (s)css, JSON, JSX
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" },
    callback = function()
        vim.keymap.set({'n'}, '<leader>cf', "<cmd>Prettier<cr>", { desc = '[C]ode [F]ormat' });
    end
})

--[[============================================================================
-- TMUX-Navigation
--============================================================================]]
vim.cmd[[

    nnoremap M m
    nnoremap m `

    map q <nop>
    nnoremap s @
    nnoremap Q q

    nnoremap gg ggzz


]]


-- vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
-- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
