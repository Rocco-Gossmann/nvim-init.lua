return function(wk)

    local dapui = require("dapui");

--[[============================================================================
-- VimSpector
--============================================================================]]
    wk.register({

        ["r<space>"] = { function() dapui.eval() end, "DAP: Eval under Cursor" },

        ['rb'] = { vim.cmd.DapToggleBreakpoint, 'Toggle Breakpoint'},
        ['rr'] = { function()
            vim.cmd.DapContinue()
            dapui.open()
        end, 'Run Debug'},

        ['rl'] = { vim.cmd.DapStepInto , 'Step in'},
        ['rj'] = { vim.cmd.DapStepOver , 'Step Over'},
        ['rh'] = { vim.cmd.DapStepOut , 'Step Out'},

        ['rc'] = { function()
            dapui.close()
            vim.cmd.DapTerminate()
        end, 'Stop Debug'},
    }, {  mode = "n" })
end
