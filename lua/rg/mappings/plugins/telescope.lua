local Hydra = require("hydra")
local tele = require('telescope.builtin')

local hint = [[
 Telescope:                              _q_ / _<ESC>_ => Exit
=============================================================

   _t_ => Tags            _f_ => Files          _b_ => Buffers
   _r_ => Reference       _d_ => Files in CWD   _k_ => Keys
   _s_ => String in PWD   _g_ => Git Files      _h_ => HelpTags
   
   _n_ => Resume previous search               
]]

local heads = {
    { 't', tele.lsp_dynamic_workspace_symbols },
    { 'f', tele.find_files },
    { 'd', function() vim.cmd[[ Telescope find_files search_dirs=['%:h'] ]] end },
    { 'g', tele.git_files },
    { 's', tele.live_grep },
    { 'b', tele.buffers },
    { 'h', tele.help_tags },
    { 'k', tele.keymaps },
    { 'n', tele.resume },
    { 'r', ":Telescope lsp_workspace_symbols query=<C-r><C-w><CR>" },

    { '<ESC>', nil, {exit=true}};
    { 'q', nil, {exit=true}}
}

return Hydra({
	mode = { 'n' },
    hint = hint,
    heads = heads,
	config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	},
	opts = {}
})

