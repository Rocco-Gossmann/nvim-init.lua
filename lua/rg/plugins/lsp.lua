vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

	"https://github.com/nvim-mini/mini.completion",

--	"https://github.com/j-hui/fidget.nvim",
});

require("mason").setup({})
require("mason-lspconfig").setup({ })
require("mason-tool-installer").setup({
	ensure_installed = {
		"markdown_oxide",
		"lua_ls"
	}
})

require("mini.completion").setup({
  window = {
    info = { height = 25, width = 80, border = "rounded" },
    signature = { height = 25, width = 80, border = "rounded" },
  },

})
-- vim.pack.add({
-- 	"https://github.com/L3MON4D3/LuaSnip",
-- 	"https://github.com/folke/lazydev.nvim",
-- 	{src = 'https://github.com/saghen/blink.cmp' }
-- }, { load = true })

-- local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)





--[[
require("blink-cmp").setup({
	keymap = {
		-- 'default' (recommended) for mappings similar to built-in completions
		--   <c-y> to accept ([y]es) the completion.
		--    This will auto-import if your LSP supports it.
		--    This will expand snippets if the LSP sent a snippet.
		-- 'super-tab' for tab to accept
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- For an understanding of why the 'default' preset is recommended,
		-- you will need to read `:help ins-completion`
		--
		-- No, but seriously. Please read `:help ins-completion`, it is really good!
		--
		-- All presets have the following mappings:
		-- <tab>/<s-tab>: move to right/left of your snippet expansion
		-- <c-space>: Open menu or open docs if already open
		-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
		-- <c-e>: Hide menu
		-- <c-k>: Toggle signature help
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		preset = "enter",

		-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
		--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 250 },
		menu = { auto_show = true },
	},

	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		per_filetype = {
			sql = { "snippets", "dadbod", "buffer" },
			mysql = { "dadbod", "buffer" },
		},
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
		},
	},

	snippets = { preset = "luasnip" },

	-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
	-- which automatically downloads a prebuilt binary when enabled.
	--
	-- By default, we use the Lua implementation instead, but you may enable
	-- the rust implementation via `'prefer_rust_with_warning'`
	--
	-- See :h blink-cmp-config-fuzzy for more information
	fuzzy = { implementation = "lua" },

	-- Shows a signature help window while you type arguments for a function
	signature = { enabled = true },
})




local cmp_servers = {
	lua_ls = {},
}

for server, config in pairs(cmp_servers) do

  -- passing config.capabilities to blink.cmp merges with the capabilities in your
  -- `opts[server].capabilities, if you've defined it
  --
  config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)

  vim.lsp.config(server, config)

end

-- ]]


-- vim.api.nvim_create_autocmd("LspAttach", {
--
-- 	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
-- 	callback = function(event)
--
--		local map = function(keys, func, desc, mode)
--			mode = mode or "n"
--			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
--		end
--
--		local function client_supports_method(client, method, bufnr)
--			if vim.fn.has("nvim-0.11") == 1 then
--				return client:supports_method(method, bufnr)
--			else
--				return client.supports_method(method, { bufnr = bufnr })
--			end
--		end
--
--		local client = vim.lsp.get_client_by_id(event.data.client_id)
--
--		if
--			client
--			and client_supports_method(
--				client,
--				vim.lsp.protocol.Methods.textDocument_documentHighlight,
--				event.buf
--			)
--		then
--			local highlight_augroup =
--				vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
--			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--				buffer = event.buf,
--				group = highlight_augroup,
--				callback = vim.lsp.buf.document_highlight,
--			})
--
--			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--				buffer = event.buf,
--				group = highlight_augroup,
--				callback = vim.lsp.buf.clear_references,
--			})
--
--			vim.api.nvim_create_autocmd("LspDetach", {
--				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
--				callback = function(event2)
--					vim.lsp.buf.clear_references()
--					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
--				end,
--			})
--		end
--
--		if
--			client
--			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
--		then
--			vim.lsp.inlay_hint.enable(true)
--			map("<leader>ti", function()
--				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
--			end, "[T]oggle Inlay [H]ints")
--		end
--
--	end,
-- })


-- vim.diagnostic.config({
--
-- 	severity_sort = true,
-- 	float = { border = "rounded", source = "if_many" },
-- 	underline = { severity = vim.diagnostic.severity.ERROR },
-- 	signs = vim.g.have_nerd_font and {
-- 		text = {
-- 			[vim.diagnostic.severity.ERROR] = "󰅚 ",
-- 			[vim.diagnostic.severity.WARN] = "󰀪 ",
-- 			[vim.diagnostic.severity.INFO] = "󰋽 ",
-- 			[vim.diagnostic.severity.HINT] = "󰌶 ",
-- 		},
-- 	} or {},
-- 	virtual_text = {
-- 		source = "if_many",
-- 		spacing = 2,
-- 		format = function(diagnostic)
-- 			local diagnostic_message = {
-- 				[vim.diagnostic.severity.ERROR] = diagnostic.message,
-- 				[vim.diagnostic.severity.WARN] = diagnostic.message,
-- 				[vim.diagnostic.severity.INFO] = diagnostic.message,
-- 				[vim.diagnostic.severity.HINT] = diagnostic.message,
-- 			}
-- 			return diagnostic_message[diagnostic.severity]
-- 		end,
-- 	},
-- })

-- local capabilities = require("blink.cmp").get_lsp_capabilities()


-- require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

-- vim.lsp.config("intelephense", {
--
-- 	init_options = {
-- 		licenceKey = "/opt/licenses/intelephense.txt",
-- 	},
--
-- 	settings = {
-- 		intelephense = {
--
-- 			environment = {
-- 				includePaths = {
-- 					"/var/lib/phpunit",
-- 				},
-- 			},
--
-- 			diagnostics = {
-- 				enable = true,
-- 				argumentCount = true,
-- 				deprecated = true,
-- 				duplicateSymbols = true,
-- 				embeddedLanguages = true,
-- 				implementationErrors = true,
-- 				languageConstraints = true,
-- 				memberAccess = false,
-- 				noMixedTypeCheck = true,
-- 				relaxedTypeCheck = true,
-- 				run = "onType",
-- 				typeErrors = true,
-- 				undefinedClassConstants = true,
-- 				undefinedConstants = true,
-- 				undefinedFunctions = true,
-- 				undefinedMethods = true,
-- 				undefinedProperties = true,
-- 				undefinedSymbols = true,
-- 				undefinedTypes = true,
-- 				undefinedVariables = true,
-- 				unexpectedTokens = true,
-- 				unusedSymbols = true,
-- 			},
--
-- 			inlayHint = {
-- 				returnTypes = true
-- 			}
--
-- 		},
-- 	},
--
-- })






















-- TODO: make these into VimEnter loads
--[[
return {

	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{ "shadowwa/smarty.vim", ft = { "smarty" } },

	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		config = function()


			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
		end,
	},

	{
		"S1M0N38/love2d.nvim",
		version = "2.*",
		opts = {},
		keys = {
			{ "<leader>v",  ft = "lua",          desc = "LÖVE" },
			{ "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
			{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
		},
	},
}

-- ]]
