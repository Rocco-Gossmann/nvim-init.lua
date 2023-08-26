local Hydra = require("hydra")

local hint = [[
 LSP:
===================================================
   _ws_ => Workspace Symbols    _d_ => open Float
   _ca_ => code Action         _rr_ => references
   _ff_ => format              _rn_ => rename

]];

local opt = { exit = true}

local heads = {
    {'ws'	, function() vim.lsp.buf.workspace_symbol() end, opt},
    {'d'	, function() vim.diagnostic.open_float() end, opt},
    {'ca'	, function() vim.lsp.buf.code_action() end, opt},
    {'rr'	, function() vim.lsp.buf.references() end, opt},
    {'rn'	, function() vim.lsp.buf.rename() end, opt},
    {'ff'	, function() vim.lsp.buf.format() end, opt}
}

return Hydra({
	mode = { 'n' },
	body = "<leader>v",
    hint = hint,
    heads = heads,
	config = {
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	},
	opts = {}
})

