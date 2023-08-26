local Hydra = require("hydra")

-- Folding Hydra
local hint = [[ 
 Folding:
===================================
   _o_ => Open fold     _c_ => Fold

   _g_ => Fold more     _m_ => Fold All, but LV1 
]]

local opt = { exit = true, nowait=true}

local heads = {
    { 'g', 'zm' },
    { 'o', 'zo', opt },
    { 'c', 'zc', opt },
    { 'm', 'zMzr' }
}

return Hydra({
	mode = { 'n' },
    hint = hint,
    body = "z",
    heads = heads,
	config = {
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	},
	opts = {}
})
