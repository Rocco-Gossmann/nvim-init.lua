require("mason").setup({})
require("mason-lspconfig").setup({ })
require("mason-tool-installer").setup({
	ensure_installed = {
		"markdown_oxide",
		"lua_ls",
		"deno"
	}
})


vim.diagnostic.config({

	severity_sort = true,

	float = { border = "rounded", source = "if_many" },

	underline = { severity = vim.diagnostic.severity.ERROR },

	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},

	virtual_lines = true,

	-- virtual_text = {
	-- 	source = "if_many",
	-- 	spacing = 2,
	-- 	format = function(diagnostic)
	-- 		local diagnostic_message = {
	-- 			[vim.diagnostic.severity.ERROR] = diagnostic.message,
	-- 			[vim.diagnostic.severity.WARN] = diagnostic.message,
	-- 			[vim.diagnostic.severity.INFO] = diagnostic.message,
	-- 			[vim.diagnostic.severity.HINT] = diagnostic.message,
	-- 		}
	-- 		return diagnostic_message[diagnostic.severity]
	-- 	end,
	-- },
})






















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
