-- [[==========================================================================
-- Plugins to help keep code more readable
-- ==========================================================================]]
return {

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

}
