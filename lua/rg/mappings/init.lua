vim.g.mapleader = " "

vim.keymap.set("n", "<leader>qq", ":q<cr>");
vim.keymap.set("n", "<leader>ww", ":w<cr>");
vim.keymap.set("n", "<leader>QQ", ":q!<cr>");
vim.keymap.set("n", "<leader>WW", ":w!<cr>");

vim.keymap.set("n", "<leader>gt", vim.cmd.LazyGit);
vim.keymap.set("i", "jj", "<ESC>");

-- Yank to Clipboard
vim.keymap.set("v", '<leader>y', '"+y');
vim.keymap.set("n", '<leader>y', '"+yy');

-- Paste in visual mode without resetting paste buffer content 
vim.keymap.set("x", "<leader>p", '"_dP')

-- Auto Indent
vim.keymap.set("n", "<leader>f",  "mzggVG=`z");

require "rg.mappings.telescope"
require "rg.mappings.nvim-tree"
require "rg.mappings.harpoon"
