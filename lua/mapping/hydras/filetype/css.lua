local Hydra = require("hydra")

return Hydra({
    mode = { 'n' },
    body = "q",
    hint = [[ CSS Snippets: 
=========================
   _t_ => TAG
   _c_ => .class

]],
    heads = {
        { 't', 'mza {[NXT]}<esc>`za' },
        { 'c', 'a.<esc>mza {[NXT]}<esc>`za' },

        { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }
    },
    config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
    }
})
