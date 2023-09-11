local lsp = require('lsp-zero')

lsp.preset('recommended');
lsp.ensure_installed({ 'tsserver', 'intelephense' })

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
})

local cmp_sources = {
    { name = 'nvim_lsp', priority = 1000,
        entry_filter = function(entry)
            return require("cmp").lsp.CompletionItemKind.File ~= entry:get_kind()
        end },
    { name = 'path', priority = 950 },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lua' },
}

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
    sources = cmp_sources
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = '.',
		info = ' '
	}
})

lsp.setup()

vim.diagnostic.config({ virtual_text = true })

if require("rg.env").doFileIfExists(".nvim/lsp.lua") == nil then
    require("lsp");
end

