return function(wk)

    local dapui = require("dapui");

--[[============================================================================
-- VimSpector
--============================================================================]]
    wk.register({
        ['e'] = {
            name = "Debug/Run",
            ["<space>"] = { function() dapui.eval() end, "DAP: Eval under Cursor" },

            ['b'] = { vim.cmd.DapToggleBreakpoint, 'Toggle Breakpoint'},
            ['r'] = { function()
                vim.cmd.DapContinue()
                dapui.open()
            end, 'Run Debug'},

            ['l'] = { vim.cmd.DapStepInto , 'Step in'},
            ['j'] = { vim.cmd.DapStepOver , 'Step Over'},
            ['h'] = { vim.cmd.DapStepOut , 'Step Out'},

            ['c'] = { function()
                dapui.close()
                vim.cmd.DapTerminate()
            end, 'Stop Debug'},

            -- may be used by other filetypes
            ['d'] = "which_key_ignore",

        }
    }, { mode = "n" })
end
