local Hydra = require("hydra")

return Hydra({
   mode = { 'n' },
   body = "q",
   hint = [[ Common Filetype:   _q_ / _<ESC>_
==============================

]],
    heads = {
        { "<ESC>", nil, {exit=true, nowait=true}},
        { "q", nil, {exit=true, nowait=true}}
    },
	config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
        buffer = vim.api.nvim_get_current_buf()
	}
})

