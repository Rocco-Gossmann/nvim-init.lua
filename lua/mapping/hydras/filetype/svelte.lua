local Hydra = require("hydra")

local jsHydra = require "mapping.hydras.filetype.javascript"

--==============================================================================
-- Snippets Hydra
--==============================================================================
local templatesHydra = Hydra({
    mode = { "i" },
    body = "§",
    hint = [[ Svelte Snippets: 
=========================
   _j_ => Javascript

]],
    heads = {
        { "j", function() jsHydra.snippets:activate() end },
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

return Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ Svelte Actions:

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
