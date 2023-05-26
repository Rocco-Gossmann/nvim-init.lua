return function(wk)

    local dapui = require("dapui");

--[[============================================================================
-- VimSpector
--============================================================================]]
    wk.register({

        ["<f4>"] = { function() dapui.eval() end, "DAP: Eval under Cursor" },

        ['<f6>'] = { vim.cmd.DapToggleBreakpoint, 'Toggle Breakpoint'},
        ['<f5>'] = { function()
            vim.cmd.DapContinue()
            dapui.open()
        end, 'Run Debug'},

        ['<f7>'] = { vim.cmd.DapStepInto , 'Step in'},
        ['<f8>'] = { vim.cmd.DapStepOver , 'Step Over'},
        ['<f9>'] = { vim.cmd.DapStepOut , 'Step Out'},

        ['<f10>'] = { function()
            dapui.close()
            vim.cmd.DapTerminate()
        end, 'Stop Debug'},
    }, {  mode = "n" })
end
