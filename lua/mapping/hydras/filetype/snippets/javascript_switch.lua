local Hydra = require("hydra")

return Hydra({
    hint = [[ TS/JS Snippet => Switch
========================
   _s_ => switch() {}
   _c_ => case     _d_ => default
]],
    heads = {
        { "s", "aswitch(<esc>mza){[NXT]}<esc>`za" },
        { "c", "ocase <esc>mza: [NXT]; break;<esc>`za" },
        { "d", "odefault<esc>mza: break;<esc>`za" },
        { "<esc>", nil, {exit=true} },
        { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})
