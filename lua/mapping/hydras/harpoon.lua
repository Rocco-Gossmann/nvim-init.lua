local Hydra = require("hydra")

local harpoonmark = require('harpoon.mark')
local harpoonui = require('harpoon.ui')

local hint = [[
 Harpoon:                     _q_ / _<ESC>_ => exit
===================================================
   _m_ => Show List       _M_ => Add current to list

   _h_ => Load Slot 1     _H_ => Save Slot 1
   _j_ => Load Slot 2     _J_ => Save Slot 2
   _k_ => Load Slot 3     _K_ => Save Slot 3
   _l_ => Load Slot 4     _L_ => Save Slot 4  

]];

local heads = {

    { 'M', function() harpoonmark.add_file() end},
    { 'H', function() harpoonmark.set_current_at(1) end},
    { 'J', function() harpoonmark.set_current_at(2) end},
    { 'K', function() harpoonmark.set_current_at(3) end},
    { 'L', function() harpoonmark.set_current_at(4) end},

    { 'm', function() harpoonui.toggle_quick_menu(4) end},
    { 'h', function() harpoonui.nav_file(1) end},
    { 'j', function() harpoonui.nav_file(2) end},
    { 'k', function() harpoonui.nav_file(3) end},
    { 'l', function() harpoonui.nav_file(4) end},

    { '<ESC>', nil, {exit=true} },
    { 'q', nil, {exit=true} }
}

return Hydra({
	mode = { 'n' },
	body = "<leader>h",
    hint = hint,
    heads = heads,
	config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	},
	opts = {}
})

