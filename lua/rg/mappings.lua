-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local whichkey = require("which-key")
local mappfunc = require("rg.mapping_functions");
local templates = require("rg.template");
local telescope_builtin = require('telescope.builtin');
local focusTerminalBuffer = mappfunc.focusTerminalBuffer
local focusDBTab = mappfunc.focusDBTab

--[[============================================================================
-- Common Keymaps:
-- -----------------------------------------------------------------------------
-- these are some rempas, that, for some reason don't work when configured any
-- other way
--============================================================================]]
--

whichkey.add({

	-- Surround
	{'<leader>y',       group = 'Surround' },
	{'<leader>ys', '<Plug>Ysurround', desc = 'new [S]urround'},
	{'<leader>yc', '<Plug>Csurround', desc = '[C]hange Surrounding'},
	{'<leader>yd', '<Plug>Dsurround', desc = '[D]elete Surrounding'},

	-- Launch
	{ '<leader>l',       group = '[L]aunch' },
	{ '<leader>lg',      focusTerminalBuffer("LazyGit", "lazygit"),              desc = 'Lazy[G]it',                               mode = 'n' },
	{ '<leader>lt',      focusTerminalBuffer("Terminal", ""),                    desc = '[T]erminal',                              mode = 'n' },
	{ '<leader>ld',      focusTerminalBuffer("LazyDocker", "lazydocker"),        desc = 'Lazy[D]ocker',                            mode = 'n' },
	{ '<leader>lr',      focusTerminalBuffer("Ranger", "ranger"),                desc = '[R]anger',                                mode = 'n' },
	{ '<leader>ls',      focusTerminalBuffer("Database (DBUI)", "nvim -c DBUI"), desc = 'Database ([s]torage)',                    mode = 'n' },
	{ '<leader>ll',      vim.cmd.OCTmuxPane,                                     desc = '[L]LM - Server (Ollama)',                 mode = 'n' },

	-- Code
	{ '<leader>c',       group = '[C]ode' },
	{ '<leader>cr',      vim.lsp.buf.rename,                                     desc = '[R]ename',                                mode = 'n' },
	{ '<leader>cd',      '<cmd>Neogen<cr>',                                      desc = '[D]ocument',                              mode = 'n' },
	{ '<leader>ca',      mappfunc.codeAction,                                    desc = '[A]ction',                                mode = { 'n', 'x' } },
	{ '<leader>cc',      '<cmd>norm gcc<cr>',                                    desc = '[C]omment',                               mode = { 'n' } },
	{ '<leader>cc',      '<cmd>norm gc<cr>',                                     desc = '[C]omment',                               mode = { 'x' } },

	{ '<leader>cl',      group = '[C]ode [L]sp' },
	{ '<leader>clr',     '<cmd>LspRestart<cr>',                                  desc = '[L]sp [R]estart',                         mode = 'n' },

	-- Qucklist
	{ '<leader>q',       group = '[Q]uicklist' },
	{ '<leader>qd',      vim.diagnostic.setloclist,                              desc = '[Q]uicklist [D]iagnostics' },
	{ '<leader>qn',      '<cmd>cnext<cr>',                                       desc = '[Q]uicklist [N]ext' },
	{ '<leader>qp',      '<cmd>cprevious<cr>',                                   desc = '[Q]uicklist [P]revious' },
	{ '<leader>qc',      '<cmd>cclose<cr>',                                      desc = '[Q]uicklist [C]lose' },

	{ 'q',               group = '[Q]uicklist' },
	{ 'qd',              vim.diagnostic.setloclist,                              desc = '[Q]uicklist [D]iagnostics' },
	{ 'qn',              '<cmd>cnext<cr>',                                       desc = '[Q]uicklist [N]ext' },
	{ 'qp',              '<cmd>cprevious<cr>',                                   desc = '[Q]uicklist [P]revious' },
	{ 'qc',              '<cmd>cclose<cr>',                                      desc = '[Q]uicklist [C]lose' },

	-- Exlorer
	{ '<C-n>',           '<cmd>NERDTreeToggle<cr>',                              mode = 'n' },
	{ 'E',               desc = "Explorer",                                      group = '[E]xplorer' },
	{ 'EE',              '<cmd>e .<cr>',                                         desc = '[E]xplorer in place',                     mode = 'n' },
	{ 'EL',              '<cmd>vs<cr><C-w>l<cmd>e .<cr>',                        desc = '[E]xplorer right',                        mode = 'n' },
	{ 'EH',              '<cmd>vs .<cr>',                                        desc = '[E]xplorer left',                         mode = 'n' },
	{ 'EJ',              '<cmd>sp<cr><C-w>j<cmd>e .<cr>',                        desc = '[E]xplorer bottom',                       mode = 'n' },
	{ 'EK',              '<cmd>sp .<cr>',                                        desc = '[E]xplorer top',                          mode = 'n' },
	{ 'ET',              '<cmd>tabnew .<cr>',                                    desc = '[E]xplorer [t]ab',                        mode = 'n' },

	-- Close commands
	-- ZZ => Close current (default mapping)
	{ 'Z',               group = 'Close' },
	{ 'ZZ',              '<cmd>q<cr>',                                           desc = 'Close current buffer (warn if not saved)' },
	{ 'ZD',              '<cmd>bd!<cr>',                                         desc = 'remove current buffer (ignore unsaved)' },
	{ 'ZW',              '<cmd>wqa!<cr>',                                        desc = 'close all buffers (save all files)' },
	{ 'ZA',              '<cmd>qa!<cr>',                                         desc = 'close all buffers (ignore unsaved)' },

	{ '<leader>e',       vim.diagnostic.open_float,                              desc = 'show [E]rrors and Warnings',              mode = 'n' },
	{ '<leader>#',       '<cmd>e#<cr>',                                          desc = 'alt+tab files',                           mode = 'n' },

	-- Project
	{ '<leader>p',       group = '[P]roject' },
	{ '<leader>pf',      telescope_builtin.find_files,                           desc = '[P]roject [F]iles',                       mode = 'n' },
	{ '<leader>ps',      telescope_builtin.live_grep,                            desc = '[P]roject find [S]tring',                 mode = 'n' },
	{ '<leader>pw',      telescope_builtin.grep_string,                          desc = '[P]roject find [W]ord',                   mode = 'n' },
	{ '<leader>pt',      telescope_builtin.lsp_dynamic_workspace_symbols,        desc = '[P]roject find [T]ag',                    mode = 'n' },

	-- Files
	{ '<leader>f',       group = '[F]ile' },
	{ '<leader>ff',      telescope_builtin.find_files,                           desc = '[F]ind [F]ile',                           mode = 'n' },
	{ '<leader>fo',      telescope_builtin.oldfiles,                             desc = '[F]ind [O]lder File',                     mode = 'n' },
	{ '<leader>fh',      telescope_builtin.help_tags,                            desc = '[F]ind [H]elp',                           mode = 'n' },
	{ '<leader>fm',      '<cmd>Telescope keymaps<cr>',                           desc = '[F]ind [M]appings',                       mode = 'n' },
	{ '<leader>fr',      telescope_builtin.resume,                               desc = '[F]ind [R]esume',                         mode = 'n' },
	{ '<leader>ft',      telescope_builtin.lsp_document_symbols,                 desc = '[F]ind file [T]ags',                      mode = 'n' },
	{ '<leader>fe',      '<cmd>NERDTreeFind<cr>',                                desc = '[F]ile show in [E]xplorer',               mode = 'n' },
	{ '<leader>fd',      telescope_builtin.diagnostics,                          desc = '[F]ile [D]Diagnose',                      mode = 'n' },
	{ '<leader>fg',      mappfunc.fuzzySearchInBuffer,                           desc = '[F]ile [G]rep',                           mode = 'n' },
	{ '<leader>fn',      '<cmd>NERDTreeToggle<cr>',                              desc = '[F]files ([N]erdTree)',                   mode = 'n' },

	-- Git
	{ '<leader>g',       group = '[G]it' },
	{ '<leader>gf',      telescope_builtin.git_files,                            desc = 'Search [F]iles',                          mode = 'n' },
	{ '<leader>gb',      mappfunc.gitBlameLine,                                  desc = '[B]lame line',                            mode = 'n' },
	{ '<leader>gn',      '<cmd>Gitsigns next_hunk<cr>',                          desc = '[N]ext changed Block',                    mode = 'n' },
	{ '<leader>gp',      '<cmd>Gitsigns prev_hunk<cr>',                          desc = '[P]revious changed Block',                mode = 'n' },
	{ '<leader>gd',      '<cmd>Gitsigns preview_hunk_inline<cr>',                desc = '[D]iff Changed Block',                    mode = 'n' },
	{ '<leader>gs',      '<cmd>Gitsigns stage_hunk<cr>',                         desc = '[S]tage Hunk',                            mode = 'n' },
	{ '<leader>gl',      focusTerminalBuffer("LazyGit", "lazygit"),              desc = 'Lazy[G]it',                               mode = 'n' },


	-- Make
	{ '<leader>m',       group = '[M]ake' },
	{ '<leader>mm',      focusTerminalBuffer("MakeDefault", "make"),             desc = '(default)',                               mode = 'n' },
	{ '<leader>mr',      focusTerminalBuffer("MakeRun", "make run"),             desc = '[R]un',                                   mode = 'n' },
	{ '<leader>md',      focusTerminalBuffer("MakeRun", "make dev"),             desc = '[D]ev/[D]ebug',                           mode = 'n' },
	{ '<leader>mc',      '<cmd>!make clean<cr>',                                 desc = '[c]lean',                                 mode = 'n' },

	-- Split
	{ '<leader>s',       group = "[S]plit" },
	{ '<leader>sh',      '<cmd>sp<cr>',                                          desc = '[V]ertical',                              mode = 'n' },
	{ '<leader>sv',      '<cmd>vs<cr>',                                          desc = '[H]orizontal',                            mode = 'n' },
	{ '<leader>sb',      '<C-w>=',                                               desc = '[B]alance',                               mode = 'n' },
	{ '<leader>sm',      '<C-w>_<C-w>|',                                         desc = '[M]aximize',                              mode = 'n' },

	{ '<M-Down>',        '2<C-w>-',                                              desc = "Decrease Split height",                   mode = 'n' },
	{ '<M-Up>',          '2<C-w>+',                                              desc = "Increase Split height",                   mode = 'n' },
	{ '<M-Right>',       '2<C-w>>',                                              desc = "Increase Split width",                    mode = 'n' },
	{ '<M-Left>',        '2<C-w><',                                              desc = "Decrease Split width",                    mode = 'n' },


	-- Debugger
	-- { '<leader>d',       group = "[D]ebugger" },
	-- { "<leader>db",      vim.cmd.DapToggleBreakpoint,                       desc = "[D]ebugger [B]reakpoint Toggle" },
	{ "<F6>",            mappfunc.debugger_evaluate,                             desc = "[D]ebugger Evaluate" },
	{ "<F5>",            mappfunc.start_debugger,                                desc = "[D]ebugger Start" },
	{ "<F9>",            vim.cmd.DapToggleBreakpoint,                            desc = "[D]ebugger Breakpoint" },
	{ "<F10>",           vim.cmd.DapStepOver,                                    desc = "[D]ebugger StepOver" },
	{ "<F11>",           vim.cmd.DapStepInto,                                    desc = "[D]ebugger StepInto" },
	{ "<F12>",           vim.cmd.DapStepOut,                                     desc = "[D]ebugger StepOut" },
	{ "<F8>",            mappfunc.stop_debugger,                                 desc = "[D]ebugger Stop" },

	-- Templates
	{ '§',               group = "Templates" },
	{ '§w',              templates.newTmuxWorkspace,                             desc = 'TMUX-[W]orkspace',                        mode = 'n' },

	-- Misc
	{ '<leader><space>', telescope_builtin.buffers,                              desc = '[ ] Find existing buffers',               mode = 'n' },
	-- { '<leader>n',       '<cmd>NERDTreeToggle<cr>',              desc = 'Files',                              mode = 'n' },

	-- Toggle
	{ '<leader>t',       group = "[T]toggle / [T]ab / [T]ask" },
	{ '<leader>tn',      '<cmd>tabnew<cr>',                                      desc = "[T]ab [N]ew",                             mode = 'n' },
	{ '<leader>tr',      '<cmd>TR<cr>',                                          desc = '[T]ask [R]unner',                         mode = { 'n', 'v', 'x' } },
	{ '<leader>tb',      '<cmd>BM<cr>',                                          desc = '[T]o [B]ookmarks',                        mode = 'n' },
	{ '<leader>tz',      '<cmd>ZenMode<cr>',                                     desc = '[T]oggle [Z]en-mode',                     mode = 'n' },

	{ '<leader>tl',      group = '[T]oggle [L]ight/Dark' },
	{ '<leader>tld',     '<cmd>colorscheme rose-pine-main<cr>',                  desc = '[T]oggle [D]ark' },
	{ '<leader>tll',     '<cmd>colorscheme rose-pine-dawn<cr>',                  desc = '[T]oggle [L]ight' },
	-- { '<leader>tt',      '<cmd>Twilight<cr>',                               desc = '[T]oggle [T]wilight',                     mode = 'n' },

	-- LSP
	{ '<S-h>',           function() vim.lsp.buf.hover() end,                     desc = 'Hover Documentation',                     mode = 'n' },
	{ 'gh',              function() vim.lsp.buf.hover() end,                     desc = 'Hover Documentation',                     mode = 'n' },
	{ '<S-k>',           function() vim.lsp.buf.signature_help() end,            desc = 'Signature Documentation',                 mode = 'n' },
	{ 'gs',              function() vim.lsp.buf.signature_help() end,            desc = 'Signature Documentation',                 mode = 'n' },
	{ 'gd',              telescope_builtin.lsp_definitions,                      desc = '[G]oto [D]efinition',                     mode = 'n' },
	{ 'gr',              telescope_builtin.lsp_references,                       desc = '[G]oto [R]eferences',                     mode = 'n' },
	{ 'gi',              telescope_builtin.lsp_implementations,                  desc = '[G]oto [I]mplementation',                 mode = 'n' },
	{ 'gD',              telescope_builtin.lsp_type_definitions,                 desc = '[G]oto type-[D]efinition',                mode = 'n' },

	-- Visual Mode Helpers
	{ "J",               ":m '>+1<CR>gv=gv",                                     mode = 'x',                                       noremap = true,          silent = true },
	{ "K",               ":m '<-2<CR>gv=gv",                                     mode = 'x',                                       noremap = true,          silent = true },
	{ '<leader>p',       '"_dP',                                                 mode = 'x',                                       noremap = true,          silent = true },
	{ "<C-r>",           ":s///g<Left><Left><Left>",                             mode = 'x',                                       noremap = true },
	{ "<C-l>",           ":s/^\\(\\s\\{-\\}\\)//g<Left><Left><Left><Left>",      mode = 'x',                                       noremap = true },
	{ "<C-y>",           '"+yy',                                                 mode = 'x' },

	--      keep cursor centered
	{ "n",               "nzz",                                                  mode = "v",                                       noremap = true,          silent = true },
	{ "N",               "Nzz",                                                  mode = "v",                                       noremap = true,          silent = true },
	{ "<C-d>",           "<C-d>zz",                                              mode = "v",                                       noremap = true,          silent = true },
	{ "<C-u>",           "<C-u>zz",                                              mode = "v",                                       noremap = true,          silent = true },

	-- Insert Mode Helpers
	{ "<C-j>",           function() require("blink-cmp").show() end,             mode = { "i" },                                   noremap = true,          silent = true },
	{ "<C-h>",           function() vim.lsp.buf.signature_help() end,            mode = { "i" },                                   noremap = true,          silent = true },

	-- TMUX-Navigations
	{ "<C-h>",           "<cmd>TmuxNavigateLeft<cr>",                            mode = "n",                                       noremap = true,          silent = true },
	{ "<C-j>",           "<cmd>TmuxNavigateDown<cr>",                            mode = "n",                                       noremap = true,          silent = true },
	{ "<C-k>",           "<cmd>TmuxNavigateUp<cr>",                              mode = "n",                                       noremap = true,          silent = true },
	{ "<C-l>",           "<cmd>TmuxNavigateRight<cr>",                           mode = "n",                                       noremap = true,          silent = true },

	-- Terminal Helpes
	{ '<Esc><Esc>',      '<C-\\><C-n>',                                          desc = "Exit terminal mode",                      mode = "t" },

})

--[[============================================================================
-- Native Vim Tweaks
-- -----------------------------------------------------------------------------
-- these are some rempas, that, for some reason don't work when configured any
-- other way
--============================================================================]]
--
vim.keymap.set('n', '<PageUp>', 'gt')
vim.keymap.set('n', '<PageDown>', 'gT')

vim.cmd [[

	nnoremap M m
	nnoremap m `

	map q <nop>
	nnoremap s @
	nnoremap Q q

	nnoremap <C-p> <C-i>

	inoremap <C-d> <C-k>


	tnoremap <Esc><Esc> <C-\><C-n>

]]
