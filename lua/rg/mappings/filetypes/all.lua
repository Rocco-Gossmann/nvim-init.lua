return function(wk)
--[[============================================================================
-- VimSpector
--============================================================================]]
    wk.register({
        d = {
            name = "Debug",
            ['b'] = { function() vim.cmd('call vimspector#ToggleBreakpoint()') end, 'Toggle Breakpoint'},
            ['r'] = { function() vim.cmd('call vimspector#Launch()') end, 'Run Debug'},

            ['l'] = { function() vim.cmd('call vimspector#StepIInto()') end, 'Step in'},
            ['j'] = { function() vim.cmd('call vimspector#StepIOver()') end, 'Step Over'},
            ['h'] = { function() vim.cmd('call vimspector#StepIOut()') end, 'Step Out'},
            ['<CR>'] = { function() vim.cmd('call vimspector#Continue()') end, 'Continue'},

            ['s'] = { function() vim.cmd('call vimspector#Stop():call vimspector#Reset()<CR>') end, 'End and Reset'},
        }
    }, { prefix = "<leader>", mode = "n" })
end
