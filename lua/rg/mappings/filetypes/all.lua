return function(wk)
--[[============================================================================
-- VimSpector
--============================================================================]]
    wk.register({
        ['<f6>'] = { vim.cmd.DapToggleBreakpoint, 'Toggle Breakpoint'},
        ['<f5>'] = { function()
            vim.cmd.DapContinue()
            require("dapui").open()
        end, 'Run Debug'},

        ['<f7>'] = { vim.cmd.DapStepInto , 'Step in'},
        ['<f8>'] = { vim.cmd.DapStepOver , 'Step Over'},
        ['<f9>'] = { vim.cmd.DapStepOut , 'Step Out'},

        ['<f10>'] = { function()
            require("dapui").close()
            vim.cmd.DapTerminate()
        end, 'Stop Debug'},
    }, {  mode = "n" })
end
