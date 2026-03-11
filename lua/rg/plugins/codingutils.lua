return {
	'tpope/vim-surround',
	'Matt-A-Bennett/vim-surround-funk',
	'tpope/vim-repeat',

	{
		"echasnovski/mini.align",
		version = "*",
		config = true,
	},

	-- [[----------------------------------------------------------------------
	-- Highlight for
	-- TODO:
	-- HACK:
	-- NOTE:
	-- INFO:
	-- FIX:
	-- WARNING:
	-- PERF:
	-- ----------------------------------------------------------------------]]
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {

			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},

	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		ft = { "markdown" },
		opts = {
			processor = "magick_cli",
		}
	}


}
