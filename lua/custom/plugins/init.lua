-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return { -- Awesome Keymapping and Custome modes

	'anuvyklack/hydra.nvim',

	-- Navigation
	-- -- TMUX - Integration
	'christoomey/vim-tmux-navigator',

	-- -- Harpoon 1
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	-- Coding Tools
	-- -- Markdown Preview
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


	{
		'dhruvasagar/vim-table-mode',
		ft = { 'markdown' }
	},

	-- -- Debug Adapter Protocol
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { 'mfussenegger/nvim-dap' }
	},

	-- -- MySQL Client
	{
		'kristijanhusak/vim-dadbod-ui',
		dependencies = {
			{ 'tpope/vim-dadbod',                     lazy = true },
			{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
		},
		cmd = {
			'DBUI',
			'DBUIToggle',
			'DBUIAddConnection',
			'DBUIFindBuffer',
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},


	-- -- Prettier
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

	-- -- Better Folding???
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
	},

}
