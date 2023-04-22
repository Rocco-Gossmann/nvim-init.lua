vim.keymap.set('n', '<F6>', ':call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<F5>', ':call vimspector#Launch()<CR>')

vim.keymap.set('n', '<F7>', ':call vimspector#StepIInto()<CR>')
vim.keymap.set('n', '<F8>', ':call vimspector#StepIOver()<CR>')
vim.keymap.set('n', '<S-F8>', ':call vimspector#StepIOut()<CR>')
vim.keymap.set('n', '<F9>', ':call vimspector#Continue()<CR>')

vim.keymap.set('n', '<F10>', ':call vimspector#Stop()<CR>:call vimspector#Reset()<CR>')

