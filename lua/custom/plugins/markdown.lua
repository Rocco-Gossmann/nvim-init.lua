-- [[==========================================================================
-- Plugins related to markdown files
-- ==========================================================================]]
return {
	-- [[----------------------------------------------------------------------
	-- Preview
	-- ----------------------------------------------------------------------]]
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_port = 64209
		end,
		ft = { "markdown" },
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
	{ 'mzlogin/vim-markdown-toc',
		ft = { 'markdown' },
	}
}
