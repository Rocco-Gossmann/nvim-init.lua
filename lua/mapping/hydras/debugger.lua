local Hydra = require("hydra")
local dapui = require("dapui");
local dap = require("dap");

return Hydra({
    mode = { 'n' },
    body = "<S-d>",
    hint = [[ Debugger
=====================================
 _b_ => Set Breakpoint

 _s_ => Start Debugger   

 Step: 
 _7_ => in   _8_ => over   _9_ => out 
  
 _<space>_ => eval under Cursor

 _<S-d>_ => Stop/Close Debugger

]],
    heads = {
        { "b", vim.cmd.DapToggleBreakpoint },
        { "s", function()
            vim.inspect(dap);
            dapui.open();
            vim.cmd.DapContinue();
        end },
        { "<space>", function() dapui.eval() end  },

        { '7', vim.cmd.DapStepInto },
        { '8', vim.cmd.DapStepOver },
        { '9', vim.cmd.DapStepOut },

        { '<S-d>', function() dapui.close() ; vim.cmd.DapTerminate() end, {exit=true, nowait=true} },
    },
    config = {
        color="pink",
		invoke_on_body = true,
		hint = { position="bottom-right", border="rounded" }
    }
})
