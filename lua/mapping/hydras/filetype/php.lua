
local Hydra = require("hydra")

--==============================================================================
-- Snippets => Require Hydra
--==============================================================================
local requireHydra = Hydra({

    mode={ "i" },

    hint = [[ PHP Snippets => Require 
=========================
   _d_ => from DIR 
   _r_ => from DOCUMENT_ROOT
   
   _<ESC>_
]],

    heads = {
        { 'd', "require_once __DIR__ . '/<esc>mzi';<esc>`zi" },
        { 'r', "require_once $_SERVER['DOCUMENT_ROOT'] . '/<esc>mzi';<esc>`zi" },
        { '<ESC>', nil, {exit=true, nowait=true}}
    },

    config = {
        color="blue",
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})

--==============================================================================
-- Snippets Hydra
--==============================================================================
Hydra({
    mode = { "i" },
    body = "§",
    hint = [[ PHP Snippets: 
=========================
   _f_ => function  _r_ => require 

    _<ESC>_
]],
    heads = {
        { 'f', 'function <esc>mzi() {}<esc>`zi ' },
        { 'r', function() requireHydra:activate() end, { exit=true } },
        { '<ESC>', nil, {exit=true, nowait=true}}
    },

    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})



--==============================================================================
-- Main Hydra
--==============================================================================

local dapui = require("dapui");

return Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ PHP Actions: _<esc>_
=================
   _b_ => Set Breakpoint

   _r_ => Run Debugger   _c_ => Stop/Close Debugger

   _7_ => step in    _8_ => step over    _9_ => step out
    
   _<space>_ => eval under Cursor

]],
    heads = {
        { "b", vim.cmd.DapToggleBreakpoint },
        { "r", function() 
                vim.cmd.DapContinue()
                dapui.open()
        end },
        { "<space>", function() dapui.eval() end  },

        { '7', vim.cmd.DapStepInto },
        { '8', vim.cmd.DapStepOver },
        { '9', vim.cmd.DapStepOut },

        { 'c', function()
            dapui.close()
            vim.cmd.DapTerminate()
        end, {exit = true}},

        { "h", "h" },
        { "j", "j" },
        { "k", "k" },
        { "l", "l" },

        { "<C-h>", "<C-h>" },
        { "<C-j>", "<C-j>" },
        { "<C-k>", "<C-k>" },
        { "<C-l>", "<C-l>" },

        {"<esc>", nil, {exit=true}}
    },
    config = {
        color="blue",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})
