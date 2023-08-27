local rgenv = require("rg.env");

require "rg.packer"

vim.opt.nu = true
vim.opt.relativenumber = true

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

vim.opt.colorcolumn = "80"

vim.opt.nrformats:append("alpha")

vim.opt.grepprg="rg -n -i --ignore-file .rgignore $* /dev/null"

vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.foldlevelstart = 99

require "mapping"

vim.cmd [[

    set foldexpr=nvim_treesitter#foldexpr()
    set foldmethod=expr

    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

]]

-- this is a comment just to test the following line
vim.api.nvim_set_hl(0, "Comment", {bg = "none", fg="#a0a0a0"})
--vim.api.nvim_set_hl(0, "LineNr", {bg = "#333333", fg="#a0a0a0"})

if vim.fn.findfile(rgenv.confdir .. "/lua/custom/init.lua") == not '' then
    require "custom"
end

--      from $CWD
local filename = ".nviminit.lua"
if vim.fn.findfile(filename) == '' then
    print("you can customize NVIM further for this folder by creating a '" .. filename .. "' file");
else
    dofile(filename);
end

require "filetype"
