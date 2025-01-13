local whichkey = require("which-key")
local mappfunc = require("rg.mapping_functions");
local templates = require("rg.template");
local telescope_builtin = require('telescope.builtin');
local gs = package.loaded.gitsigns

whichkey.add({
    -- Tab Navigation
    { '<Tab>',           group = '[GUI Tab]' },
    { '<Tab>n',          'gt',                                   desc = '[Tab] next',                         mode = 'n' },
    { '<Tab>p',          'gT',                                   desc = '[Tab] previous',                     mode = 'n' },

    -- Code
    { '<leader>c',       group = '[C]ode' },
    { '<leader>cr',      vim.lsp.buf.rename,                     desc = '[C]ode [R]ename',                    mode = 'n' },
    { '<leader>cd',      '<cmd>Neogen<cr>',                      desc = '[C]ode [D]ocument',                  mode = 'n' },
    { '<leader>ca',      '<cmd>Neogen<cr>',                      desc = '[C]ode [D]ocument',                  mode = 'n' },
    { '<leader>ca',      mappfunc.codeAction,                    desc = '[C]ode [A]ction',                    mode = 'n' },

    { '<leader>cl',      group = '[C]ode [L]sp' },
    { '<leader>clr',     '<cmd>LspRestart<cr>',                  desc = '[C]ode [L]sp [R]estart',             mode = 'n' },

    -- Exlorer
    { 'E',               group = '[E]xplorer' },
    { 'EE',              '<cmd>e .<cr>',                         desc = '[E]xplorer in place',                mode = 'n' },
    { 'EL',              '<cmd>vs<cr><C-w>l<cmd>e .<cr>',        desc = '[E]xplorer right',                   mode = 'n' },
    { 'EH',              '<cmd>vs .<cr>',                        desc = '[E]xplorer left',                    mode = 'n' },
    { 'EJ',              '<cmd>sp<cr><C-w>j<cmd>e .<cr>',        desc = '[E]xplorer bottom',                  mode = 'n' },
    { 'EK',              '<cmd>sp .<cr>',                        desc = '[E]xplorer top',                     mode = 'n' },
    { 'ET',              '<cmd>tabnew .<cr>',                    desc = '[E]xplorer [t]ab',                   mode = 'n' },

    -- Project
    { '<leader>p',       group = '[P]roject' },
    { "<leader>pf",      telescope_builtin.find_files,           desc = "[P]roject [F]iles",                  mode = "n" },
    { "<leader>ps",      telescope_builtin.live_grep,            desc = "[P]roject find [S]tring",            mode = "n" },

    -- Files
    { '<leader>f',       group = '[F]ile' },
    { "<leader>ff",      telescope_builtin.find_files,           desc = "[F]ind [F]ile",                      mode = "n" },
    { "<leader>fs",      telescope_builtin.live_grep,            desc = "[F]String in Project",               mode = "n" },
    { "<leader>fh",      telescope_builtin.help_tags,            desc = "[F]ind [H]elp",                      mode = "n" },
    { '<leader>fr',      telescope_builtin.resume,               desc = '[F]ind [R]esume',                    mode = 'n' },
    { '<leader>fd',      telescope_builtin.diagnostics,          desc = '[F]ind [D]iagnostics',               mode = 'n' },
    { '<leader>ft',      telescope_builtin.lsp_document_symbols, desc = '[F]ind [T]elescope',                 mode = 'n' },
    { '<leader>fe',      '<cmd>NERDTreeFind<cr>',                desc = '[F]ind in [E]xplorer',               mode = 'n' },
    { '<leader>fg',      mappfunc.fuzzySearchInBuffer,           desc = '[F]uzzily search in current buffer', mode = 'n' },
    { '<leader>fo',      telescope_builtin.oldfiles,             desc = '[F]ind [O]lder File',                mode = 'n' },

    -- Git
    { '<leader>g',       group = '[G]it' },
    { '<leader>gf',      telescope_builtin.git_files,            desc = 'Search [G]it [F]iles',               mode = 'n' },
    { '<leader>gb',      mappfunc.gitBlameLine,                  desc = '[G]it [b]lame line',                 mode = 'n' },
    { '<leader>gd',      gs.toggle_deleted,                      desc = '[G]it show [D]eleted',               mode = 'n' },
    { '<leader>gl',      mappfunc.tmuxLazyGit,                   desc = '[G]it ([L]azyGit)',                  mode = 'n' },

    -- Make
    { '<leader>m',       group = '[M]ake' },
    { '<leader>mm',      '<cmd>!make<cr>',                       desc = '[M]ake (default)',                   mode = 'n' },
    { '<leader>mr',      mappfunc.tmuxMakeRun,                   desc = '[M]ake [r]un',                       mode = 'n' },
    { '<leader>mc',      '<cmd>!make clean<cr>',                 desc = '[M]ake [c]lean',                     mode = 'n' },

    -- Split
    { '<leader>s',       group = "[S]plit" },
    { '<leader>sh',      '<cmd>sp<cr>',                          desc = '[S]plit [V]ertical',                 mode = 'n' },
    { '<leader>sv',      '<cmd>vs<cr>',                          desc = '[S]plit [H]orizontal',               mode = 'n' },
    { '<leader>sb',      '<C-w>=',                               desc = '[S]plit [B]alance',                  mode = 'n' },
    { '<leader>sm',      '<C-w>_<C-w>|',                         desc = '[S]plit [M]aximize',                 mode = 'n' },

    { '<C-Down>',        '<C-w>-',                               desc = "Decrease Split height",              mode = 'n' },
    { '<C-Up>',          '<C-w>+',                               desc = "Increase Split height",              mode = 'n' },
    { '<C-Right>',       '<C-w>>',                               desc = "Increase Split width",               mode = 'n' },
    { '<C-Left>',        '<C-w><',                               desc = "Decrease Split width",               mode = 'n' },


    -- Debugger
    { '<leader>d',       group = "[D]ebugger" },
    { "<leader>de",      mappfunc.debugger_evaluate,             desc = "[D]ebugger [E]valuate" },
    { "<leader>db",      vim.cmd.DapToggleBreakpoint,            desc = "[D]ebugger [B]reakpoint Toggle" },
    { "<F5>",            mappfunc.start_debugger,                group = "[D]Debugger" },
    { "<F6>",            vim.cmd.DapToggleBreakpoint,            group = "[D]Debugger" },
    { "<F11>",           vim.cmd.DapStepInto,                    group = "[D]Debugger" },
    { "<F10>",           vim.cmd.DapStepOver,                    group = "[D]Debugger" },
    { "<S-F11>",         vim.cmd.DapStepOut,                     group = "[D]Debugger" },
    { "<F12>",           mappfunc.stop_debugger,                 group = "[D]Debugger" },

    -- Templates
    { '§',               group = "Templates" },
    { '§w',              templates.newTmuxWorkspace,             desc = 'TMUX-[W]orkspace',                   mode = 'n' },

    -- Misc
    { '<leader><Tab>',   '<cmd>ZenMode<cr>',                     desc = 'Zen Mode',                           mode = 'n' },
    { '<leader>b',       '<cmd>BM<cr>',                          desc = '[B]ookmarks',                        mode = 'n' },
    { '<leader>t',       '<cmd>TR<cr>',                          desc = '[T]ask Runner',                      mode = 'n' },
    { '<leader><space>', telescope_builtin.buffers,              desc = '[ ] Find existing buffers',          mode = 'n' },
    { '<C-n>',           '<cmd>NERDTreeToggle<cr>',              desc = 'Files',                              mode = 'n' },

})


local silnor = { noremap = true, silent = true }

--[[============================================================================
-- Repeated COmmands
--============================================================================]]
local sysClipCopy = '"+yy'
--local replaceUnderCursor = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";


--[[============================================================================
-- Select + Visual Mode helpers
--============================================================================]]
vim.keymap.set({ "x" }, "J", ":m '>+1<CR>gv=gv", silnor); -- Move Selected Line Down
vim.keymap.set({ "x" }, "K", ":m '<-2<CR>gv=gv", silnor); -- Move Selected Line Up
vim.keymap.set({ "x" }, '<leader>p', '"_dP', silnor);

vim.keymap.set({ "x" }, "<C-r>", ":s///g<Left><Left><Left>", { noremap = true });                        -- Replace in selection
vim.keymap.set({ "x" }, "<C-l>", ":s/^\\(\\s\\{-\\}\\)//g<Left><Left><Left><Left>", { noremap = true }); -- Replace in sleected line (preselected whitespace group)
vim.keymap.set({ "x" }, "<C-y>", sysClipCopy, silnor);


vim.keymap.set({ 'n' }, '<C-/>', '/\\c')


--[[============================================================================
-- Lsp
--============================================================================]]
vim.keymap.set({ "n" }, '<S-h>', function() vim.lsp.buf.hover() end, { desc = 'Hover Documentation' });
vim.keymap.set({ "n" }, '<S-k>', function() vim.lsp.buf.signature_help() end, { desc = 'Signature Documentation' });
vim.keymap.set({ 'n' }, 'gd', telescope_builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
vim.keymap.set({ 'n' }, 'gr', telescope_builtin.lsp_references, { desc = '[G]oto [R]eferences' })
vim.keymap.set({ 'n' }, 'gI', telescope_builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
vim.keymap.set({ 'n' }, 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })


-- -- Insert - Mode use
vim.keymap.set({ "i" }, '<C-j>', function() vim.lsp.buf.signature_help() end, silnor);
vim.keymap.set({ "i" }, '<C-h>', '<cmd>lua vim.lsp.buf.completion({ reason = require("cmp").ContextReason.Auto })<CR>',
    silnor);

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
vim.keymap.set({ "n" }, "<Tab><Tab>", "/\\[NXT\\]<CR>v%c", { desc = "Goto next", silent = true });
vim.keymap.set({ "i" }, "<S-Tab>", "<esc>/\\[NXT\\]<CR>v%c", { silent = true });

-- Keep Cursor centered, when jumping and searching
vim.keymap.set({ "v" }, "n", "nzz", silnor);
vim.keymap.set({ "v" }, "N", "Nzz", silnor);
vim.keymap.set({ "v" }, "<C-d>", "<C-d>zz", silnor);
vim.keymap.set({ "v" }, "<C-u>", "<C-u>zz", silnor);

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
            nnoremap §h <esc>:lua require("rg.template").handleC_H()<cr>
        ]]
    end
})

-- Template code
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.php" },
    callback = function()
        whichkey.add({
            { "§c", function() templates.handlePHP("class") end,     mode = { "n" }, desc = "PHP-Class" },
            { "§t", function() templates.handlePHP("trait") end,     mode = { "n" }, desc = "PHP-Trait" },
            { "§i", function() templates.handlePHP("interface") end, mode = { "n" }, desc = "PHP-Interface" },
        })
    end
})

-- Format before Save
-- remove trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.*"},
    callback = function()
        vim.cmd.substitute("/\\s\\+$//ge");
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go", "*.hpp", "*.h", "*.cpp", "*.c", "*.tmpl" },
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
    vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
  end,
})


-- Code-Formatting
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.lua", "*.go", "*.php" },
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
