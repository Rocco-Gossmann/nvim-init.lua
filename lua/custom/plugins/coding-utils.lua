-- [[==========================================================================
-- Plugins to help keep code more readable
-- ==========================================================================]]
return {
	-- [[----------------------------------------------------------------------
	-- Undo Tree
	-- ----------------------------------------------------------------------]]
	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle" },
	},

	-- [[----------------------------------------------------------------------
	-- Create DocBlocks
	-- ----------------------------------------------------------------------]]
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		version = "*"
	},

	-- [[----------------------------------------------------------------------
	-- Code-Formater
	-- ----------------------------------------------------------------------]]
	{
		"prettier/vim-prettier",
		ft = {
			'javascript', 'typescript',
			'css', 'less', 'scss',
			'json', 'graphql',
			'markdown', 'vue',
			'svelte', 'yaml', 'html'
		}
	},

	-- [[----------------------------------------------------------------------
	-- GitHub-Copilot like AI
	-- ----------------------------------------------------------------------]]
	'Exafunction/codeium.vim',


	-- [[----------------------------------------------------------------------
	-- better surround, than what I can muster
	-- ----------------------------------------------------------------------]]
	'tpope/vim-surround',

	-- supplementary to surround
	'tpope/vim-repeat',

	-- [[----------------------------------------------------------------------
	-- Highlight for
	-- TODO:
	-- HACK:
	-- NOTE:
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
	}
}
