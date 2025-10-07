-- [[==========================================================================
-- Everything related to NeoVims UI
-- ==========================================================================]]
--
return {
	-- File-Explorer with Tree View  (<leader>n to open)
	'preservim/nerdtree',

	-- unifys switching between NeoVim Splits and TMUX-Panes
	-- (Press C-H/J/K/L to move between them)
	'christoomey/vim-tmux-navigator',

	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
				width = 196
			}
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},

	-- {
	-- 	"folke/twilight.nvim",
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- },

}
