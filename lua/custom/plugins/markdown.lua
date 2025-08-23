-- [[==========================================================================
-- Plugins related to markdown files
-- ==========================================================================]]
return {
	-- [[----------------------------------------------------------------------
	-- Formatting
	-- ----------------------------------------------------------------------]]
	{
		"MeanderingProgrammer/markdown.nvim",
		lazy = true,
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
		lazy = true,
		ft = { 'markdown' }
	},

	-- [[----------------------------------------------------------------------
	-- TOC (Table of Contents)
	-- ----------------------------------------------------------------------]]
	{
		'mzlogin/vim-markdown-toc',
		lazy = true,
		ft = { 'markdown' },
	},

	-- [[----------------------------------------------------------------------
	-- Todo item handling
	-- : TaskNew
	-- : TaskStart
	-- : ....
	-- ----------------------------------------------------------------------]]
	{
		"rocco-gossmann/nvim-tasklist",
		lazy = true,
		cmd = {
			'TaskNew',
			'TaskStart',
			'TaskDone',
			'TaskCancel',
			'TaskReset',
		},

		init = function()
			require("nvim-tasklist").setup()
		end

	}
}
