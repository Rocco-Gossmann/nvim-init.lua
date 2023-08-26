local Hydra = require("hydra")

local hint = [[ 
 Explorer:        _q_ / _<ESC>_ 
==========================
     _k_    => top
   _h_   _l_  => left / right
     _j_    => bottom

       _t_ => in Tab
 _<space>_ => in place

]]

local heads = {
    { 'j', ':Sex<CR><C-w>J' },
    { 'k', ':Sex<CR>' },
    { 'h', ':Vex<CR>' },
    { 't', ':Tex<CR>' },
    { 'l', ':Vex<CR><C-w>L' },
    { '<space>', ':Exp<CR>' };
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
