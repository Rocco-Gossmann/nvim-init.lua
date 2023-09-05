
local Hydra = require("hydra")

--==============================================================================
-- Snippets => Require Hydra
--==============================================================================
local requireHydra = Hydra({

    hint = [[ PHP Snippets => Require 
=========================
   _d_ => from DIR 
   _r_ => from DOCUMENT_ROOT
   
]],

    heads = {
        { 'd', "arequire_once __DIR__ . '/<esc>mza';<esc>`za" },
        { 'r', "arequire_once $_SERVER['DOCUMENT_ROOT'] . '/<esc>mza';<esc>`za" },
        { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }
    },

    config = {
        color="teal",
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
    hint = [[ PHP Snippets: 
=============================
   _f_ => function   _r_ => require 

   _ee_ => foreach  _ek_ => foreach( key ) 
]],
    heads = {
        { 'f', 'afunction <esc>mza([NXT]) {[NXT]}<esc>`zi ' },
        { 'r', function() requireHydra:activate() end, { exit=true } },
        { 'ee', 'aforeach(<esc>mza as [NXT]) {[NXT]}<esc>`za' },
        { 'ek', 'aforeach(<esc>mza as [NXT] => [NXT]) {[NXT]}<esc>`za' },
        { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})
