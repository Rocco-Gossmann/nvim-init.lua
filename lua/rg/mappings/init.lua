vim.g.mapleader = " "

vim.keymap.set("n", "<leader>qq", ":q<cr>");
vim.keymap.set("n", "<leader>ww", ":w<cr>");
vim.keymap.set("n", "<leader>QQ", ":q!<cr>");
vim.keymap.set("n", "<leader>WW", ":w!<cr>");

vim.keymap.set("n", "<leader>gt", vim.cmd.LazyGit);
vim.keymap.set("i", "jj", "<ESC>");

-- Auto Indent
-- vim.keymap.set("n", "<leader>f",  "mzggVG=`z"); 
-- /\--- replaced by LSP formating

require "rg.mappings.telescope"
require "rg.mappings.nvim-tree"
require "rg.mappings.harpoon"
