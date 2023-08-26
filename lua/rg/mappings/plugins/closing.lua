local Hydra = require("hydra")

-- Folding Hydra
local hint = [[ 
 Close:
===================================
   _Q_ => Buffer         _X_ => All
   _Z_ => +Save Buffer   _W_ => +Save All
]]

local opt = { exit = true, nowait=true}

local heads = {
    { 'Z', ':wq<CR>', opt },
    { 'W', ':wa<CR>:qa<CR>', opt },
    { 'Q', ':q!<CR>', opt},
    { 'X', ':qa!<CR>', opt }
}

return Hydra({
	mode = { 'n' },
	body = "Z",
    hint = hint,
    heads = heads,
	config = {
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	},
	opts = {}
})
