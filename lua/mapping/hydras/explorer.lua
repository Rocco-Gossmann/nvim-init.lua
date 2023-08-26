local Hydra = require("hydra")

local hint = [[ 
 Explorer:        _q_ / _<ESC>_ 
==========================
     _k_    => top
   _h_   _l_  => left / right
     _j_    => bottom

 _<space>_ => in place

]]

local heads = {
    { 'j', ':Se<CR><C-w>J' },
    { 'k', ':Se<CR>' },
    { 'h', ':Ve<CR>' },
    { 'l', ':Ve<CR><C-w>L' },
    { '<space>', ':Ex<CR>' };
    { 'q', nil, {exit=true} },
    { '<ESC>', nil, {exit=true} },
}

return Hydra({
	mode = { 'n' },
    hint = hint,
    body = "E",
    heads = heads,
	config = {
        color="teal",
		hint = { position="bottom", border="rounded" },
	},
})
