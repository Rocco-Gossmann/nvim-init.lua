local Hydra = require("hydra")

local harpoonmark = require('harpoon.mark')
local harpoonui = require('harpoon.ui')

local hint = [[
 Harpoon:   
=====================================

   _ß_/_?_ => Add current to list

   _z_/_Z_ => Show List     

             Save:  |  Load:   
           --------------------
   Slot 1 |    _1_    |    _h_    |
   Slot 2 |    _2_    |    _j_    |
   Slot 3 |    _3_    |    _k_    |
   Slot 4 |    _4_    |    _l_    |
   Slot 5 |    _5_    |    _ö_    |
   Slot 6 |    _6_    |    _H_    |
   Slot 7 |    _7_    |    _J_    |
   Slot 8 |    _8_    |    _K_    |
   Slot 9 |    _9_    |    _L_    |
           --------------------

]];

local heads = {

    { 'ß', function() harpoonmark.add_file() end},
    { '?', function() harpoonmark.add_file() end},

    { '1', function() harpoonmark.set_current_at(1) end},
    { '2', function() harpoonmark.set_current_at(2) end},
    { '3', function() harpoonmark.set_current_at(3) end},
    { '4', function() harpoonmark.set_current_at(4) end},
    { '5', function() harpoonmark.set_current_at(5) end},
    { '6', function() harpoonmark.set_current_at(6) end},
    { '7', function() harpoonmark.set_current_at(7) end},
    { '8', function() harpoonmark.set_current_at(8) end},
    { '9', function() harpoonmark.set_current_at(9) end},

    { 'z', function() harpoonui.toggle_quick_menu(4) end},
    { 'Z', function() harpoonui.toggle_quick_menu(4) end},

    { 'h', function() harpoonui.nav_file(1) end},
    { 'j', function() harpoonui.nav_file(2) end},
    { 'k', function() harpoonui.nav_file(3) end},
    { 'l', function() harpoonui.nav_file(4) end},
    { 'ö', function() harpoonui.nav_file(5) end},
    { 'H', function() harpoonui.nav_file(6) end},
    { 'J', function() harpoonui.nav_file(7) end},
    { 'K', function() harpoonui.nav_file(8) end},
    { 'L', function() harpoonui.nav_file(9) end},

    { '<ESC>', nil, {exit=true} },
    { 'q', nil, {exit=true} }
}

return Hydra({
	mode = { 'n' },
	body = "<S-h>",
    hint = hint,
    heads = heads,
	config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" },
	},
	opts = {}
})

