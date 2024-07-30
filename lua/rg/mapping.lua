require('which-key').register {
    ['<leader>b'] = { name = '[B]ookmarks (use // BM: ...)', _ = 'which_key_ignore' },
    ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    ['E']         = { name = '[E]xplorer', _ = 'which_key_ignore' },
    ['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
    ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    ['<leader>m'] = { name = '[M]ake', _ = 'which_key_ignore' },

    ['<leader>p'] = { name = '[P]roject', _ = 'which_key_ignore' },

    ['<leader>t'] = { name = '[T]ask', _ = 'which_key_ignore' },
    ['<leader>l'] = { name = '[L]azy', _ = 'which_key_ignore' },
    ['<leader>s'] = { name = "[S]plit" , _ = 'which_key_ignore' },
    ['<Tab>'] = { name = "[Tab]" , _ = 'which_key_ignore' }

    --   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}

local silnor = { noremap = true, silent = true }

--[[============================================================================
-- Repeated COmmands
--============================================================================]]
local sysClipCopy = '"+yy'
--local replaceUnderCursor = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";

local telescope_builtin = require('telescope.builtin');

--[[============================================================================
-- Select + Visual Mode helpers
--============================================================================]]
vim.keymap.set({ "x" }, "J", ":m '>+1<CR>gv=gv", silnor); -- Move Selected Line Down
vim.keymap.set({ "x" }, "K", ":m '<-2<CR>gv=gv", silnor); -- Move Selected Line Up
vim.keymap.set({ "x" }, '<leader>p', '"_dP', silnor);

vim.keymap.set({ "x" }, "<C-r>", ":s///g<Left><Left><Left>", { noremap = true });                  -- Replace in selection
vim.keymap.set({ "x" }, "<C-l>", ":s/^\\(\\s\\{-\\}\\)//g<Left><Left><Left><Left>", { noremap = true }); -- Replace in sleected line (preselected whitespace group)
vim.keymap.set({ "x" }, "<C-y>", sysClipCopy, silnor);

vim.keymap.set({ 'n' }, '<C-n>', '<cmd>NERDTreeToggle<cr>')
vim.keymap.set({ 'n' }, '<leader>lg', '<cmd>LazyGit<cr>')

vim.keymap.set({ 'n' }, '<C-/>', '/\\c')

vim.keymap.set({ 'n' }, "<leader>t", "<cmd>TR<cr>", silnor);

--[[============================================================================
-- Lsp
--============================================================================]]
vim.keymap.set({ "n" }, '<S-h>', function() vim.lsp.buf.hover() end, { desc = 'Hover Documentation' });
vim.keymap.set({ "n" }, '<S-k>', function() vim.lsp.buf.signature_help() end, { desc = 'Signature Documentation' });
vim.keymap.set({ 'n' }, 'gd', telescope_builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
vim.keymap.set({ 'n' }, 'gr', telescope_builtin.lsp_references, { desc = '[G]oto [R]eferences' })
vim.keymap.set({ 'n' }, 'gI', telescope_builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
vim.keymap.set({ 'n' }, 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })


-- vim.keymap.set({ 'n' }, '<leader>D', telescope_builtin.lsp_type_definitions, { desc = 'Type [D]efinition' })

-- -- Insert - Mode use
vim.keymap.set({ "i" }, '<C-j>', function() vim.lsp.buf.signature_help() end, silnor);
vim.keymap.set({ "i" }, '<C-h>', '<cmd>lua vim.lsp.buf.completion({ reason = require("cmp").ContextReason.Auto })<CR>',
    silnor);

--[[============================================================================
-- [C]ode Actions
--============================================================================]]
vim.keymap.set({ "n" }, "<leader>cr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" });
vim.keymap.set({ "n" }, "<leader>cd", "<cmd>Neogen<cr>", { desc = "[C]ode [D]ocument" });
vim.keymap.set({ "n" }, '<leader>ca', function()
    vim.lsp.buf.code_action {
        context = {
            only = {
                'quickfix',
                'refactor',
                'source'
            }
        }
    }
end, { desc = '[C]ode [A]ction' })

--[[============================================================================
-- Mapping m/M + numbers to Global Bookmarks
--============================================================================]]
vim.keymap.set({ 'n' }, 'M1', 'mA', silnor)
vim.keymap.set({ 'n' }, 'M2', 'mB', silnor)
vim.keymap.set({ 'n' }, 'M3', 'mC', silnor)
vim.keymap.set({ 'n' }, 'M4', 'mD', silnor)
vim.keymap.set({ 'n' }, 'M5', 'mE', silnor)
vim.keymap.set({ 'n' }, 'M6', 'mF', silnor)
vim.keymap.set({ 'n' }, 'M7', 'mG', silnor)
vim.keymap.set({ 'n' }, 'M8', 'mH', silnor)
vim.keymap.set({ 'n' }, 'M9', 'mI', silnor)
vim.keymap.set({ 'n' }, 'M0', 'mJ', silnor)

vim.keymap.set({ 'n' }, 'm1', '`A', silnor)
vim.keymap.set({ 'n' }, 'm2', '`B', silnor)
vim.keymap.set({ 'n' }, 'm3', '`C', silnor)
vim.keymap.set({ 'n' }, 'm4', '`D', silnor)
vim.keymap.set({ 'n' }, 'm5', '`E', silnor)
vim.keymap.set({ 'n' }, 'm6', '`F', silnor)
vim.keymap.set({ 'n' }, 'm7', '`G', silnor)
vim.keymap.set({ 'n' }, 'm8', '`H', silnor)
vim.keymap.set({ 'n' }, 'm9', '`I', silnor)
vim.keymap.set({ 'n' }, 'm0', '`J', silnor)

--[[ ===========================================================================
-- Snippet Helpers
--============================================================================]]
-- You can set [NXT] in side your snippes etc, and then use 2xTab to start editing the location
-- they are in
vim.keymap.set({ "n" }, "<Tab><Tab>", "/\\[NXT\\]<CR>v%c", { desc="Goto next [NXT]", silent = true });
vim.keymap.set({ "i" }, "<S-Tab>", "<esc>/\\[NXT\\]<CR>v%c", { silent = true });

-- Keep Cursor centered, when jumping and searching
vim.keymap.set({ "v" }, "n", "nzz", silnor);
vim.keymap.set({ "v" }, "N", "Nzz", silnor);
vim.keymap.set({ "v" }, "<C-d>", "<C-d>zz", silnor);
vim.keymap.set({ "v" }, "<C-u>", "<C-u>zz", silnor);


--[[============================================================================
-- Splits
--============================================================================]]
vim.keymap.set({ 'n' }, 'EE', '<cmd>e .<cr>', { desc = '[E]xplorer in place' })
vim.keymap.set({ 'n' }, 'El', '<cmd>vs<cr><C-w>l<cmd>e .<cr>', { desc = '[E]xplorer right' })
vim.keymap.set({ 'n' }, 'Eh', '<cmd>vs .<cr>', { desc = '[E]xplorer left' })
vim.keymap.set({ 'n' }, 'Ej', '<cmd>sp<cr><C-w>j<cmd>e .<cr>', { desc = '[E]xplorer bottom' })
vim.keymap.set({ 'n' }, 'Ek', '<cmd>sp .<cr>', { desc = '[E]xplorer top' })
vim.keymap.set({ 'n' }, 'Et', '<cmd>tabnew .<cr>', { desc = '[E]xplorer [t]ab' })

vim.keymap.set({ 'n' }, '<leader>sv', '<cmd>sp<cr>', { desc = '[S]plit [V]ertical' })
vim.keymap.set({ 'n' }, '<leader>sh', '<cmd>vs<cr>', { desc = '[S]plit [H]orizontal' })

vim.keymap.set({ 'n' }, '<leader><Tab>', '<cmd>ZenMode<cr>', { desc = 'Zen Mode' })
vim.keymap.set({ 'n' }, '<leader>b', '<cmd>BM<cr>', silnor)

vim.keymap.set({ 'n' }, '<Tab>n', 'gt', {desc = '[Tab] next'})
vim.keymap.set({ 'n' }, '<Tab>p', 'gT', {desc = '[Tab] previous'})

--[[============================================================================
-- Makefile - Tools
--============================================================================]]
vim.keymap.set({ 'n' }, '<leader>mm', '<cmd>!make<cr>', { desc = '[M]ake (default)' })
vim.keymap.set({ 'n' }, '<leader>mr', '<cmd>!tmux split-pane -h \'make run ; read\'<cr>', { desc = '[M]ake [r]un' })
vim.keymap.set({ 'n' }, '<leader>mc', '<cmd>!make clean<cr>', { desc = '[M]ake [c]lean' })

--[[============================================================================
-- Telescope / [F]ind
--============================================================================]]
-- See `:help telescope.builtin`
vim.keymap.set({ "n" }, "<leader>pf", telescope_builtin.find_files, { desc = "[P]roject [F]ile" })
-- vim.keymap.set({ "n" }, "<leader>ff", telescope_builtin.find_files, { desc = "[F]ind [F]ile" })
vim.keymap.set({ "n" }, "<leader>ps", telescope_builtin.live_grep, { desc = "[P]roject find [S]tring" })
--vim.keymap.set({ "n" }, "<leader>fs", telescope_builtin.live_grep, { desc = "[F]ind [S]tring" })
vim.keymap.set({ "n" }, "<leader>fh", telescope_builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set({ 'n' }, '<leader>fr', telescope_builtin.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set({ 'n' }, '<leader>fd', telescope_builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set({ 'n' }, '<leader>ft', telescope_builtin.lsp_document_symbols, { desc = '[F]ind [T]elescope' })
vim.keymap.set({ 'n' }, '<leader>fe', '<cmd>NERDTreeFind<cr>', { desc = '[F]ind in [E]xplorer' })

vim.keymap.set({ 'n' }, '<leader>fg', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[F]uzzily search in current buffer' })

vim.keymap.set('n', '<leader>fo', telescope_builtin.oldfiles, { desc = '[F]ind [O]lder File' })
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })


--[[============================================================================
-- Git Signs
--============================================================================]]
local gs = package.loaded.gitsigns
vim.keymap.set({ 'n' }, '<leader>gf', telescope_builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set({ 'n' }, '<leader>gb', function() gs.blame_line { full = false } end, { desc = '[G]it [b]lame line' })
vim.keymap.set({ 'n' }, '<leader>gd', gs.toggle_deleted, { desc = '[G]it show [D]eleted' })

--[[============================================================================
-- TMUX-Navigations
--============================================================================]]
vim.keymap.set({ "n" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>", silnor)
vim.keymap.set({ "n" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>", silnor)
vim.keymap.set({ "n" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>", silnor)
vim.keymap.set({ "n" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>", silnor)

vim.keymap.set({ "n" }, "<M-h>", "2<C-w><", {})
vim.keymap.set({ "n" }, "<M-j>", "2<C-w>+", {})
vim.keymap.set({ "n" }, "<M-k>", "2<C-w>-", {})
vim.keymap.set({ "n" }, "<M-l>", "2<C-w>>", {})


--
-- Keymaps, that differ per FileType (Due to differennt technics and binaries being used)

-- <leader>cf - Code-Format
-- D - Debug-Action

-- Template code
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.cpp", "*.c", "*.h" },
    callback = function()
        vim.cmd [[
            inoremap §h <esc>:lua require("rg.template").handleC_H()<cr>
        ]]
    end
})

-- Debugger
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.php", "*.go", "*.c", "*.cpp", "*.h", "*.hpp" },
    callback = function()
        require("rg.hydras.xdebug")
    end
})

-- Format before Save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go", "*.hpp", "*.h", "*.cpp", "*.c" },
    callback = function()
        vim.lsp.buf.format()
    end
})

-- Code-Formatting
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.lua", "*.go" },
    callback = function()
        vim.keymap.set({ 'n' }, '<leader>cf', vim.lsp.buf.format, { desc = '[C]ode [F]ormat' });
    end
})

-- Code - Formating -- Markdown, Java-/Typescript, (s)css, JSON, JSX
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" },
    callback = function()
        vim.keymap.set({ 'n' }, '<leader>cf', "<cmd>Prettier<cr>", { desc = '[C]ode [F]ormat' });
    end
})

--[[============================================================================
-- Native Vim Tweaks
--============================================================================]]
vim.cmd [[

    nnoremap M m
    nnoremap m `

    map q <nop>
    nnoremap s @
    nnoremap Q q

"    nnoremap gg ggzz


]]


-- vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
-- vim.keymap.set('n', '<leader>ss', telescope_builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
