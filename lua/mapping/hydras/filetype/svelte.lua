local Hydra = require("hydra")

local jsHydra = require "mapping.hydras.filetype.javascript"
local cssHydra = require "mapping.hydras.filetype.css"

Hydra({
    mode = { 'v' },
    body = "q",
    hint = [[ Svelte Snippets: 
=========================
   _i_ => {#if } ... {/each}
   _e_ => {#each } ... {/each}
]],
    heads = {
        { "i", 'xa{#if <esc>mza}<esc>o<esc>myo{/if}<esc>`yp`za' },
        { "e", 'xa{#each <esc>mza as [NXT]}<esc>o<esc>myo{/each}<esc>`yp`za' },
        { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})

return Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ Svelte Snippets: 
=========================
   _j_ => Javascript
   _c_ => CSS

   v/<S-v>/<C-v> + q => Svelte Templates

]],
    heads = {
        { "j", function() jsHydra:activate() end },
        { "c", function() cssHydra:activate() end },
        { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})

