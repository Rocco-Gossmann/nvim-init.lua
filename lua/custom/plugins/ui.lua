-- [[==========================================================================
-- Everything related to NeoVims UI
-- ==========================================================================]]
--
return {
	-- Allows for temporary Shortcut-changes 
	'anuvyklack/hydra.nvim',

	-- File-Explorer with Tree View  (C-n to open)
	'preservim/nerdtree',	

	-- unifys switching between NeoVim Splits and TMUX-Panes
	-- (Press C-H/J/K/L to move between them)
	'christoomey/vim-tmux-navigator',

	{
	  "folke/zen-mode.nvim",
	  opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  }
	}
}
