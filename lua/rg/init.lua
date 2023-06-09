require("rg.packer")
require("rg.mappings")
require("rg.dap")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.nrformats:append("alpha")

vim.cmd [[

set cursorline

" let g:ranger_open_new_tab = 1
let g:ranger_map_keys = 0
let g:zig_fmt_autosave = 0

nnoremap M m
nnoremap m `

map q <nop>
nnoremap s @
nnoremap Q q

nnoremap gg ggzz

set foldlevelstart=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

]]
