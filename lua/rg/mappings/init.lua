vim.g.mapleader = " "

vim.keymap.set("n", "<leader>qq", ":q<cr>");
vim.keymap.set("n", "<leader>ww", ":w<cr>");
vim.keymap.set("n", "<leader>QQ", ":q!<cr>");
vim.keymap.set("n", "<leader>WW", ":w!<cr>");

-- Auto Indent
vim.keymap.set("n", "<leader>f",  "mzggVG=`z");

require "rg.mappings.telescope"
require "rg.mappings.nvim-tree"
