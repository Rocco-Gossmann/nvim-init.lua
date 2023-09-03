local Hydra = require("hydra")
local jsSwitchHydra = require "mapping.hydras.filetype.snippets.javascript_switch"


--==============================================================================
-- Snippets Hydra
--==============================================================================
local templatesHydra = Hydra({
    mode = { "i" },
    body = "§",
    hint = [[ JS Snippets: 
=========================
   _f_ => function
   _s_ => switch

]],
    heads = {
        { 'f', 'function <esc>mzi([NXT]) {[NXT]}<esc>`zi ' },
        { 's', function() jsSwitchHydra:activate() end , {exit=true}},
        { "<esc>", nil, {exit=true}},
        { "q", nil, {exit=true}}
    },

    config = {
        color="teal",
		invoke_on_body = true,
        nowait=true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})


local myHydra = Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ Javascript Actions:
=================
Insert mode
-----------------
   _§_ => Snippets

]],
    heads = {
        {"s", function() templatesHydra:activate() end },
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

myHydra.snippets = templatesHydra;

return myHydra
