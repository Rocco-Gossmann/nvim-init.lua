local Hydra = require("hydra")

-- Folding Hydra
local hint = [[ Splits: 
===================================
   _h_ => Create Right       _l_ => Create Left
   _j_ => Create Bottom      _k_ => Create Top 

   _+_ => Grow Verticaly     _-_ => Shrink Verticaly
   _>_ => Grow Horizontaly   _<_ => Shrink Horizontaly

   _q_ / _<ESC>_
]]

local heads = {
    { 'l', ':vs<cr><c-w><S-l>', {exit=true} },
    { 'h', ':vs<cr>', {exit=true} },
    { 'j', ':sp<cr><c-w><S-j>', {exit=true} },
    { 'k', ':sp<cr>', {exit=true} },

    { '<', '<c-w><c-<>', {exit=false} },
    { '>', '<c-w><c->>', {exit=false} },
    { '+', '<c-w>+', {exit=false} },
    { '-', '<c-w>-', {exit=false} },


    { '<ESC>', nil, {exit=true, nowait=true}},
    { 'q', nil, {exit=true, nowait=true}}
}

return Hydra({
	mode = { 'n' },
	body = "<leader>w",
    hint = hint,
    heads = heads,
	config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	}
})
