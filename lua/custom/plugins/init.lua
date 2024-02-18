-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

	-- TMUX-Navigation
	'christoomey/vim-tmux-navigator',

	-- Markdown Preview
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


	-- Coding Tools
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


}
