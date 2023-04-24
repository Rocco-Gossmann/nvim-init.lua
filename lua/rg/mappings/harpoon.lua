local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require("harpoon.term")

vim.keymap.set('n', '<leader>hm', function() mark.add_file() end)
vim.keymap.set('n', '<leader>hh', function() ui.toggle_quick_menu() end)

vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end)

vim.keymap.set('n', '<leader>ht', function() term.gotoTerminal(1) end)
