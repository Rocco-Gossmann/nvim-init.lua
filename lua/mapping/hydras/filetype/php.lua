
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
local templatesHydra = Hydra({
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
        nowait=true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})


--==============================================================================
-- Main Hydra
--==============================================================================
return Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ PHP Actions:
=================
 Insert Mode:
-----------------
  _§_ => Snippets

]],
    heads = {
        {"§", function() templatesHydra:activate() end },
        {"<esc>", nil, {exit=true}},
        {"q", nil, {exit=true}}
    },
    config = {
        color="pink",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})
