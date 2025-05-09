-- [[==========================================================================
-- Plugins related to markdown files
-- ==========================================================================]]
return {
	-- [[----------------------------------------------------------------------
	-- Formatting
	-- ----------------------------------------------------------------------]]
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = "render-markdown",
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons'
		}
	},

	-- [[----------------------------------------------------------------------
	-- Table-Mode (Makes Editing Tables easier)
	-- ----------------------------------------------------------------------]]
	{
		'dhruvasagar/vim-table-mode',
		ft = { 'markdown' }
	},

	-- [[----------------------------------------------------------------------
	-- TOC (Table of Contents)
	-- ----------------------------------------------------------------------]]
	{
		'mzlogin/vim-markdown-toc',
		ft = { 'markdown' },
	}
}
