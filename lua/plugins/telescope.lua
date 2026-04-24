vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-telescope/telescope.nvim"
})

require('telescope').setup({

	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		},
	},

	defaults = {
		mappings = {
			n = {
				['dd'] = require('telescope.actions').delete_buffer
			},
		},
	}

})

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
