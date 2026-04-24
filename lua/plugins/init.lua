--- All Plugins, that are used regardless of fileType
vim.pack.add({

	-- Dependencies:
	"https://github.com/nvim-lua/plenary.nvim",

	-- Misc
	"https://github.com/preservim/nerdtree",          -- better explorer
	"https://github.com/christoomey/vim-tmux-navigator", -- integrate nvim to tmux
	"https://github.com/lewis6991/gitsigns.nvim",     -- showing git changes in gutter
	"https://github.com/folke/which-key.nvim",        -- Key-Mapping-Helper

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
	"https://github.com/tpope/vim-surround",				-- Vim-Surround
	"https://github.com/tpope/vim-repeat",
	"https://github.com/Matt-A-Bennett/vim-surround-funk",

	"https://github.com/echasnovski/mini.align",			-- use gA to align selections by character-sequence
	"https://github.com/rocco-gossmann/nvim-taskrunner",    -- save and run Macros on a Per Project basis (use :TR or <leader>tr to create a tasks.lua with your own macros)

	-- LSP
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/nvim-mini/mini.completion",

});

require "plugins.whichkey"

require "plugins.ui"
require "plugins.lsp"
require "plugins.taskrunner"
require "plugins.opencode"

-- Misc
require("mini.align").setup()
require("mini.completion").setup({
  window = {
    info = { height = 25, width = 80, border = "rounded" },
    signature = { height = 25, width = 80, border = "rounded" },
  },
})

