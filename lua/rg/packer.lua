vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Theme
	-- use { 'nanotech/jellybeans.vim' }
    -- use { "catppuccin/nvim", as = "catppuccin" }
    use { "morhetz/gruvbox" }

    -- Better Statusline
    use { 'itchyny/lightline.vim', run = vim.cmd [[
            let g:lightline = {}
            let g:lightline.separator = { 'left': '', 'right': '' }
            let g:lightline.subseparator = { 'left': '', 'right': '' }   
    ]] }

    use { 'camspiers/lens.vim',
		requires = { {'camspiers/animate.vim'}, },

        run = vim.cmd [[
            let g:lens#disabled_filetypes = ['NvimTree', 'nerdtree', 'fzf']
            let g:lens#width_resize_min = 130
            let g:lens#width_resize_max = 130
            let g:lens#height_resize_min = 30 
            let g:lens#height_resize_max = 30 
        ]]
    }

	-- File managment
    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

	use { 'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use { "ThePrimeagen/harpoon",
        requires = { "nvim-lua/plenary.nvim" }
    }

    use { 'kdheepak/lazygit.nvim', run = vim.cmd [[
        let g:lazygit_floating_window_scaling_factor = 0.9
        let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] 
        let g:lazygit_floating_window_use_plenary = 0 
    ]] }


    -- Syntax Highlighting
	use{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Debuggers / Programming Utils
    use { 'puremourning/vimspector' }

    use({ "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Intellisense
	use { 'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'l3mon4d3/luasnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

end)
