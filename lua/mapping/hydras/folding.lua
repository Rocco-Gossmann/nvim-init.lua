local Hydra = require("hydra")

-- Folding Hydra
local hint = [[ Folding:
================================================
   _o_ => Open fold         _c_ => Fold
   _O_ => Open  Recursive   _C_ => Fold Recursive

   _g_ => Fold more         _r_ => Fold Less
   _G_ => Fold All          _R_ => Unfold All

   _h_ => goto start of current fold
   _j_ => goto start of next fold
   _l_ => goto end of current fold
   _k_ => goto end of next fold

]]

local heads = {
    { 'R', 'zR' },
    { 'G', 'zM' },

    { 'r', 'zr', { exit = false } },
    { 'g', 'zm', { exit = false } },

    { 'o', 'zo' }, { 'O', 'zO' },
    { 'c', 'zc' }, { 'C', 'zC' },

    { 'h', '[z', { exit = false } },
    { 'l', ']z', { exit = false } },
    { 'j', 'zj', { exit = false } },
    { 'k', 'zk', { exit = false } },
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
	}
})
