vim.keymap.set('n', '<leader>db', ':call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<leader>dr', ':call vimspector#Launch()<CR>')

vim.keymap.set('n', '<leader>dl', ':call vimspector#StepIInto()<CR>')
vim.keymap.set('n', '<leader>dj', ':call vimspector#StepIOver()<CR>')
vim.keymap.set('n', '<leader>dh', ':call vimspector#StepIOut()<CR>')
vim.keymap.set('n', '<leader>d<CR>', ':call vimspector#Continue()<CR>')

vim.keymap.set('n', '<leader>d<ESC>', ':call vimspector#Stop()<CR>:call vimspector#Reset()<CR>')

