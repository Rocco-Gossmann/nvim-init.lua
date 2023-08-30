local Hydra = require("hydra")
local dapui = require("dapui");

return Hydra({
    mode = { 'n' },
    body = "<S-d>",
    hint = [[ Debugger
=====================================
 _b_ => Set Breakpoint

 _r_ => Run Debugger   
 _c_ => Stop/Close Debugger

 Step: 
 _7_ => in   _8_ => over   _9_ => out 
  
 _<space>_ => eval under Cursor

]],
    heads = {
        { "b", vim.cmd.DapToggleBreakpoint, {exit=true, nowait=true} },
        { 'c', function() dapui.close() ; vim.cmd.DapTerminate() end, {exit=true, nowait=true} },
        { "r", function() dapui.open()  ; vim.cmd.DapContinue()  end },
        { "<space>", function() dapui.eval() end  },

        { '7', vim.cmd.DapStepInto },
        { '8', vim.cmd.DapStepOver },
        { '9', vim.cmd.DapStepOut },
    },
    config = {
        color="pink",
		invoke_on_body = true,
		hint = { position="bottom-right", border="rounded" }
    }
})
