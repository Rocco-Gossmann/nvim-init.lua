local Hydra = require("hydra")

-- Folding Hydra
local hint = [[ 
 Folding:
===================================
   _o_ => Open fold     _c_ => Fold

   _g_ => Fold more     _m_ => Fold All, but LV1 

   _r_ => Unfold one level 
   _R_ => Unfold All
]]

local heads = {
    { 'R', 'zR' },
    { 'r', 'zr', { exit = false } },
    { 'g', 'zm' },
    { 'o', 'zo'},
    { 'c', 'zC'},
    { 'm', 'zMzr' }
}

return Hydra({
	mode = { 'n' },
    hint = hint,
    body = "z",
    heads = heads,
	config = {
        color="blue",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	},
	opts = {}
})
