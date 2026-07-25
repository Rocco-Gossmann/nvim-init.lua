-- [[ Setting options ]]
-- See `:help vim.opt`
--     `:help option-list`

-- Make line numbers default
--
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable backup and swap file creation
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Folding options
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{,}"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.opt.winborder = "bold"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = false
vim.opt.smartcase = false

-- Highlight search results
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'nosplit'

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,120"
vim.opt.nrformats:append("alpha")

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.grepprg = "rg -n -s --ignore-file .rgignore $* /dev/null"
vim.opt.conceallevel = 1
vim.opt.wrap = false

-- Decrease update time for better responsiveness
vim.opt.updatetime = 8

-- Decrease mapped sequence wait time for snappier mappings
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 4

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Smoothness optimizations
vim.opt.lazyredraw = true         -- Don't redraw while executing macros
vim.opt.ttyfast = true           -- Fast terminal connection
vim.opt.laststatus = 3           -- Global status line
vim.opt.pumheight = 10           -- Limit popup menu height
vim.opt.winminheight = 0         -- Minimum window height
vim.opt.winwidth = 10            -- Minimum window width



