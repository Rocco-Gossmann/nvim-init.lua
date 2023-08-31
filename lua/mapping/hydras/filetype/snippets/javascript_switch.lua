local Hydra = require("hydra")

return Hydra({
    mode = { "i" },
    body = "§",
    hint = [[ TS/JS Snippet => Switch
========================
   _s_ => switch() {}
   _c_ => case     _d_ => default
]],
    heads = {
        { "s", "switch(<esc>mza){[NXT]}<esc>`za" },
        { "c", "<esc>ocase <esc>mza: [NXT]; break;<esc>`za" },
        { "d", "<esc>odefault:<esc>mza break;<esc>`za" },
        { "<esc>", nil, {exit=true} },
        { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})
