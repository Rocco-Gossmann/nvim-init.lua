vim.opt.nu = true
vim.opt.relativenumber=true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.wrap = false

vim.opt.colorcolumn = "80"

vim.opt.nrformats:append("alpha")

vim.opt.grepprg="rg -n -i --ignore-file .rgignore $* /dev/null"

vim.cmd [[

set cursorline

set smartindent
set autoindent

let g:zig_fmt_autosave = 0

set foldlevelstart=99
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr

let g:tmux_navigator_no_mappings = 1

]]

require "rg.mapping"

local env = require ("rg.env");
env.doFileIfExists(env.confdir .. "/lua/rg/custom/init.lua");

