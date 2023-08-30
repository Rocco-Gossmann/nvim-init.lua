local Hydra = require("hydra")

-- Folding Hydra
local hint = [[ 
 Close:
===================================
   _Q_ => Buffer         _X_ => All
   _Z_ => +Save Buffer   _W_ => +Save All

   _D_ => Delete current Buffer
]]

local heads = {
    { 'Z', ':wq<CR>'},
    { 'W', ':wa<CR>:qa<CR>'},
    { 'Q', ':q!<CR>'},
    { 'X', ':qa!<CR>'},
    { 'D', ':bd!<CR>'}
}

return Hydra({
	mode = { 'n' },
	body = "Z",
    hint = hint,
    heads = heads,
	config = {
        color="blue",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	}
})
