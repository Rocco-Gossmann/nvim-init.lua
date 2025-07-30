-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local whichkey = require("which-key")
local mappfunc = require("rg.mapping_functions");
local templates = require("rg.template");
local telescope_builtin = require('telescope.builtin');

--[[============================================================================
-- Common Keymaps:
-- -----------------------------------------------------------------------------
-- these are some rempas, that, for some reason don't work when configured any
-- other way
--============================================================================]]

whichkey.add({

	-- Code
	{ '<leader>c',       group = '[C]ode' },
	{ '<leader>cr',      vim.lsp.buf.rename,                                desc = '[C]ode [R]ename',                         mode = 'n' },
	{ '<leader>cd',      '<cmd>Neogen<cr>',                                 desc = '[C]ode [D]ocument',                       mode = 'n' },
	{ '<leader>ca',      mappfunc.codeAction,                               desc = '[C]ode [A]ction',                         mode = { 'n', 'x' } },
	{ '<leader>cc',      '<cmd>norm gcc<cr>',                               desc = '[C]ode [C]omment',                        mode = { 'n' } },
	{ '<leader>cc',      '<cmd>norm gc<cr>',                                desc = '[C]ode [C]omment',                        mode = { 'x' } },

	{ '<leader>cl',      group = '[C]ode [L]sp' },
	{ '<leader>clr',     '<cmd>LspRestart<cr>',                             desc = '[C]ode [L]sp [R]estart',                  mode = 'n' },

	-- Qucklist
	{ '<leader>q',       group = '[Q]uicklist' },
	{ '<leader>qd',      vim.diagnostic.setloclist,                         desc = '[Q]uicklist [D]iagnostics' },
	{ '<leader>qn',      '<cmd>cnext<cr>',                                  desc = '[Q]uicklist [N]ext' },
	{ '<leader>qp',      '<cmd>cprevious<cr>',                              desc = '[Q]uicklist [P]revious' },
	{ '<leader>qc',      '<cmd>cclose<cr>',                                 desc = '[Q]uicklist [C]lose' },

	-- Exlorer
	{ '<C-n>',           '<cmd>NERDTreeToggle<cr>',                         mode = 'n' },
	{ 'E',               group = '[E]xplorer' },
	{ 'EE',              '<cmd>e .<cr>',                                    desc = '[E]xplorer in place',                     mode = 'n' },
	{ 'EL',              '<cmd>vs<cr><C-w>l<cmd>e .<cr>',                   desc = '[E]xplorer right',                        mode = 'n' },
	{ 'EH',              '<cmd>vs .<cr>',                                   desc = '[E]xplorer left',                         mode = 'n' },
	{ 'EJ',              '<cmd>sp<cr><C-w>j<cmd>e .<cr>',                   desc = '[E]xplorer bottom',                       mode = 'n' },
	{ 'EK',              '<cmd>sp .<cr>',                                   desc = '[E]xplorer top',                          mode = 'n' },
	{ 'ET',              '<cmd>tabnew .<cr>',                               desc = '[E]xplorer [t]ab',                        mode = 'n' },

	-- Close commands
	-- ZZ => Close current (default mapping)
	{ 'ZZ',              '<cmd>q<cr>',                                      desc = 'Close current buffer (warn if not saved)' },
	{ 'ZD',              '<cmd>bd!<cr>',                                    desc = 'remove current buffer (ignore unsaved)' },
	{ 'ZW',              '<cmd>wqa!<cr>',                                   desc = 'close all buffers (save all files)' },
	{ 'ZA',              '<cmd>qa!<cr>',                                    desc = 'close all buffers (ignore unsaved)' },

	{ '<leader>e',       vim.diagnostic.open_float,                         desc = 'show [E]rrors and Warnings',              mode = 'n' },
	{ '<leader>#',       '<cmd>e#<cr>',                                     desc = 'alt+tab files',                           mode = 'n' },

	-- Project
	{ '<leader>p',       group = '[P]roject' },
	{ '<leader>pf',      telescope_builtin.find_files,                      desc = '[P]roject [F]iles',                       mode = 'n' },
	{ '<leader>ps',      telescope_builtin.live_grep,                       desc = '[P]roject find [S]tring',                 mode = 'n' },
	{ '<leader>pw',      telescope_builtin.grep_string,                     desc = '[P]roject find [W]ord',                   mode = 'n' },
	{ '<leader>pt',      telescope_builtin.lsp_dynamic_workspace_symbols,   desc = '[P]roject find [T]ag',                    mode = 'n' },

	-- Files
	{ '<leader>f',       group = '[F]ile' },
	{ '<leader>ff',      telescope_builtin.find_files,                      desc = '[F]ind [F]ile',                           mode = 'n' },
	{ '<leader>fo',      telescope_builtin.oldfiles,                        desc = '[F]ind [O]lder File',                     mode = 'n' },
	{ '<leader>fh',      telescope_builtin.help_tags,                       desc = '[F]ind [H]elp',                           mode = 'n' },
	{ '<leader>fm',      '<cmd>Telescope keymaps<cr>',                      desc = '[F]ind [M]appings',                       mode = 'n' },
	{ '<leader>fr',      telescope_builtin.resume,                          desc = '[F]ind [R]esume',                         mode = 'n' },
	{ '<leader>ft',      telescope_builtin.lsp_document_symbols,            desc = '[F]ind file [T]ags',                      mode = 'n' },
	{ '<leader>fe',      '<cmd>NERDTreeFind<cr>',                           desc = '[F]ile show in [E]xplorer',               mode = 'n' },
	{ '<leader>fd',      telescope_builtin.diagnostics,                     desc = '[F]ile [D]Diagnose',                      mode = 'n' },
	{ '<leader>fg',      mappfunc.fuzzySearchInBuffer,                      desc = '[F]ile [G]rep',                           mode = 'n' },
	{ '<leader>fn',      '<cmd>NERDTreeToggle<cr>',                         desc = '[F]files ([N]erdTree)',                   mode = 'n' },

	-- Folding
	{ 'zM',              "<cmd>set foldlevel=1<cr>",                        desc = "collaps all but first level",             mode = 'n' },

	-- Git
	{ '<leader>g',       group = '[G]it' },
	{ '<leader>gf',      telescope_builtin.git_files,                       desc = 'Search [G]it [F]iles',                    mode = 'n' },
	{ '<leader>gb',      mappfunc.gitBlameLine,                             desc = '[G]it [B]lame line',                      mode = 'n' },
	{ '<leader>gn',      '<cmd>Gitsigns next_hunk<cr>',                     desc = '[G]it [N]ext changed Block',              mode = 'n' },
	{ '<leader>gp',      '<cmd>Gitsigns prev_hunk<cr>',                     desc = '[G]it [P]revious changed Block',          mode = 'n' },
	{ '<leader>gd',      '<cmd>Gitsigns preview_hunk_inline<cr>',           desc = '[G]it [D]iff Changed Block',              mode = 'n' },
	{ '<leader>gs',      '<cmd>Gitsigns stage_hunk<cr>',                    desc = '[G]it [S]tage Hunk',                      mode = 'n' },
	{ '<leader>gl',      mappfunc.tmuxLazyGit,                              desc = '[G]it [L]azygit',                         mode = 'n' },

	-- Launch
	{ '<leader>lg',      mappfunc.tmuxLazyGit,                              desc = '[L]aunch Lazy[G]it',                      mode = 'n' },
	{ '<leader>ld',      mappfunc.tmuxLazyDocker,                           desc = '[L]aunch Lazy[D]ocker',                   mode = 'n' },
	{ '<leader>ls',      mappfunc.tmuxLazySQL,                              desc = '[L]aunch Lazy[S]QL',                      mode = 'n' },
	{ '<leader>lr',      mappfunc.tmuxRanger,                               desc = '[L]aunch [R]anger',                       mode = 'n' },

	-- Make
	{ '<leader>m',       group = '[M]ake' },
	{ '<leader>mm',      '<cmd>!make<cr>',                                  desc = '[M]ake (default)',                        mode = 'n' },
	{ '<leader>mr',      mappfunc.tmuxMakeRun,                              desc = '[M]ake [R]un',                            mode = 'n' },
	{ '<leader>md',      mappfunc.tmuxMakeDev,                              desc = '[M]ake [D]ev/[D]ebug',                    mode = 'n' },
	{ '<leader>mc',      '<cmd>!make clean<cr>',                            desc = '[M]ake [c]lean',                          mode = 'n' },

	-- Split
	{ '<leader>s',       group = "[S]plit" },
	{ '<leader>sh',      '<cmd>sp<cr>',                                     desc = '[S]plit [V]ertical',                      mode = 'n' },
	{ '<leader>sv',      '<cmd>vs<cr>',                                     desc = '[S]plit [H]orizontal',                    mode = 'n' },
	{ '<leader>sb',      '<C-w>=',                                          desc = '[S]plit [B]alance',                       mode = 'n' },
	{ '<leader>sm',      '<C-w>_<C-w>|',                                    desc = '[S]plit [M]aximize',                      mode = 'n' },

	{ '<M-Down>',        '2<C-w>-',                                         desc = "Decrease Split height",                   mode = 'n' },
	{ '<M-Up>',          '2<C-w>+',                                         desc = "Increase Split height",                   mode = 'n' },
	{ '<M-Right>',       '2<C-w>>',                                         desc = "Increase Split width",                    mode = 'n' },
	{ '<M-Left>',        '2<C-w><',                                         desc = "Decrease Split width",                    mode = 'n' },


	-- Debugger
	{ '<leader>d',       group = "[D]ebugger" },
	{ "<leader>de",      mappfunc.debugger_evaluate,                        desc = "[D]ebugger [E]valuate" },
	{ "<leader>db",      vim.cmd.DapToggleBreakpoint,                       desc = "[D]ebugger [B]reakpoint Toggle" },
	{ "<F5>",            mappfunc.start_debugger,                           group = "[D]Debugger" },
	{ "<F9>",            vim.cmd.DapToggleBreakpoint,                       group = "[D]Debugger" },
	{ "<F10>",           vim.cmd.DapStepOver,                               group = "[D]Debugger" },
	{ "<F11>",           vim.cmd.DapStepInto,                               group = "[D]Debugger" },
	{ "<F12>",           vim.cmd.DapStepOut,                                group = "[D]Debugger" },
	{ "<F8>",            mappfunc.stop_debugger,                            group = "[D]Debugger" },

	-- Templates
	{ '§',               group = "Templates" },
	{ '§w',              templates.newTmuxWorkspace,                        desc = 'TMUX-[W]orkspace',                        mode = 'n' },

	-- Misc
	{ '<leader><space>', telescope_builtin.buffers,                         desc = '[ ] Find existing buffers',               mode = 'n' },
	-- { '<leader>n',       '<cmd>NERDTreeToggle<cr>',              desc = 'Files',                              mode = 'n' },

	-- Toggle
	{ '<leader>t',       group = "[T]toggle" },
	{ '<leader>tr',      '<cmd>TR<cr>',                                     desc = '[T]ask [R]unner',                         mode = 'n' },
	{ '<leader>tb',      '<cmd>BM<cr>',                                     desc = '[T]o [B]ookmarks',                        mode = 'n' },
	{ '<leader>tt',      '<cmd>Twilight<cr>',                               desc = '[T]oggle [T]wilight',                     mode = 'n' },
	{ '<leader>tz',      '<cmd>ZenMode<cr>',                                desc = '[T]oggle [Z]en-mode',                     mode = 'n' },
	{ '<leader>tm',      '<cmd>MonokaiToggleLight<cr>',                     desc = '[T]oggle [M]onokai-Theme',                mode = 'n' },

	-- LSP
	{ '<S-h>',           function() vim.lsp.buf.hover() end,                desc = 'Hover Documentation',                     mode = 'n' },
	{ 'gh',              function() vim.lsp.buf.hover() end,                desc = 'Hover Documentation',                     mode = 'n' },
	{ '<S-k>',           function() vim.lsp.buf.signature_help() end,       desc = 'Signature Documentation',                 mode = 'n' },
	{ 'gs',              function() vim.lsp.buf.signature_help() end,       desc = 'Signature Documentation',                 mode = 'n' },
	{ 'gd',              telescope_builtin.lsp_definitions,                 desc = '[G]oto [D]efinition',                     mode = 'n' },
	{ 'gr',              telescope_builtin.lsp_references,                  desc = '[G]oto [R]eferences',                     mode = 'n' },
	{ 'gi',              telescope_builtin.lsp_implementations,             desc = '[G]oto [I]mplementation',                 mode = 'n' },
	{ 'gD',              telescope_builtin.lsp_type_definitions,            desc = '[G]oto type-[D]efinition',                mode = 'n' },

	-- Visual Mode Helpers
	{ "J",               ":m '>+1<CR>gv=gv",                                mode = 'x',                                       noremap = true,     silent = true },
	{ "K",               ":m '<-2<CR>gv=gv",                                mode = 'x',                                       noremap = true,     silent = true },
	{ '<leader>p',       '"_dP',                                            mode = 'x',                                       noremap = true,     silent = true },
	{ "<C-r>",           ":s///g<Left><Left><Left>",                        mode = 'x',                                       noremap = true },
	{ "<C-l>",           ":s/^\\(\\s\\{-\\}\\)//g<Left><Left><Left><Left>", mode = 'x',                                       noremap = true },
	{ "<C-y>",           '"+yy',                                       mode = 'x' },

	--      keep cursor centered
	{ "n",               "nzz",                                             mode = "v",                                       noremap = true,     silent = true },
	{ "N",               "Nzz",                                             mode = "v",                                       noremap = true,     silent = true },
	{ "<C-d>",           "<C-d>zz",                                         mode = "v",                                       noremap = true,     silent = true },
	{ "<C-u>",           "<C-u>zz",                                         mode = "v",                                       noremap = true,     silent = true },

	-- Insert Mode Helpers
	{ "<C-j>",           function() require("blink-cmp").show() end,        mode = { "i" },                                   noremap = true,     silent = true },
	{ "<C-h>",           function() vim.lsp.buf.signature_help() end,       mode = { "i" },                                   noremap = true,     silent = true },

	-- TMUX-Navigations
	{ "<C-h>",           "<cmd>TmuxNavigateLeft<cr>",                       mode = "n",                                       noremap = true,     silent = true },
	{ "<C-j>",           "<cmd>TmuxNavigateDown<cr>",                       mode = "n",                                       noremap = true,     silent = true },
	{ "<C-k>",           "<cmd>TmuxNavigateUp<cr>",                         mode = "n",                                       noremap = true,     silent = true },
	{ "<C-l>",           "<cmd>TmuxNavigateRight<cr>",                      mode = "n",                                       noremap = true,     silent = true },

	-- Terminal Helpes
	{'<Esc><Esc>', '<C-\\><C-n>', desc="Exit terminal mode", mode = "t"},

})

--[[============================================================================
-- Native Vim Tweaks
-- -----------------------------------------------------------------------------
-- these are some rempas, that, for some reason don't work when configured any
-- other way
--============================================================================]]
vim.cmd [[

	nnoremap M m
	nnoremap m `

	map q <nop>
	nnoremap s @
	nnoremap Q q

	nnoremap <C-p> <C-i>

]]

