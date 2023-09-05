local Hydra = require("hydra")
local jsSwitchHydra = require "mapping.hydras.filetype.snippets.javascript_switch"

return Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ JS Snippets: 
=========================
   _f_ => function
   _s_ => switch

]],
    heads = {
        { 'f', 'afunction <esc>mzi([NXT]) {[NXT]}<esc>`zi ' },
        { 's', function() jsSwitchHydra:activate() end },

        { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})

