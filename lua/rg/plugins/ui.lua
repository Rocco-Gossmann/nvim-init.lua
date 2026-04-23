-- [[==========================================================================
-- Everything related to NeoVims UI
-- ==========================================================================]]

vim.pack.add({

	-- Dependencies:
	"https://github.com/nvim-lua/plenary.nvim",

	-- Misc
	"https://github.com/preservim/nerdtree", -- better explorer
	"https://github.com/christoomey/vim-tmux-navigator", -- integrate nvim to tmux

	-- Theme
	"https://github.com/rose-pine/neovim",
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/folke/todo-comments.nvim",

	-- Telescope
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-telescope/telescope.nvim",

	-- Extra Functions
	"https://github.com/tpope/vim-surround",
	"https://github.com/tpope/vim-repeat",
	"https://github.com/Matt-A-Bennett/vim-surround-funk",
	"https://github.com/echasnovski/mini.align"

});

-- Theme
-------------------------------------------------------------------------------
require("rose-pine").setup({
	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},
})

vim.cmd 'colorscheme rose-pine'
vim.cmd 'hi Whitespace guifg=#282828'

-- Zen-Mode
-------------------------------------------------------------------------------
require("zen-mode").setup({
	window = {
		backdrop = 1,
		width = 196
	}
})

-- NeoScroll  Better Scrolling
-------------------------------------------------------------------------------
require("neoscroll").setup({

	-- All these animations will be run at the same time
	easing_function = "circular", -- Default easing function
	-- Can be any of the following: "quadratic", "cubic", "quartic", "quintic", "exponential", "sine", "circular", "back"
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true,  -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing = "circular",
	scroll_duration = 100, -- Time it takes to scroll (in milliseconds) - reduced for snappier feel
	pre_hook = nil,   -- Function to run before the scrolling animation starts
	post_hook = nil,  -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.

})

local keymap = {
	["<C-u>"] = function() require('neoscroll').ctrl_u({ duration = 150 }) end,
	["<C-d>"] = function() require('neoscroll').ctrl_d({ duration = 150 }) end,
	["<C-b>"] = function() require('neoscroll').ctrl_b({ duration = 150 }) end,
	["<C-f>"] = function() require('neoscroll').ctrl_f({ duration = 150 }) end,
	["<C-y>"] = function() require('neoscroll').scroll(-0.1, { move_cursor = false, duration = 100 }) end,
	["<C-e>"] = function() require('neoscroll').scroll(0.1, { move_cursor = false, duration = 100 }) end,
	-- ["zt"]    = function() require('neoscroll').zt({ duration = 150 }) end,
	-- ["zz"]    = function() require('neoscroll').zz({ duration = 150 }) end,
	-- ["zb"]    = function() require('neoscroll').zb({ duration = 150 }) end,
}

for key, func in pairs(keymap) do
	vim.keymap.set({ 'n', 'x' }, key, func)
end



-- Telescope
-------------------------------------------------------------------------------
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




