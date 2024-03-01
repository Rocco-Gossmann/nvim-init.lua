-- [[==========================================================================
-- Color-Theme
-- ==========================================================================]]
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	init = function()
		vim.cmd [[
				colorscheme tokyonight-night
				hi Normal guibg=transparent
			]]
	end,

	config = function()
		require("tokyonight").setup({
			transparent = true
		})
	end
}
