vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    -- use { 'nanotech/jellybeans.vim' }
    -- use { "catppuccin/nvim", as = "catppuccin" }
    use { 'folke/tokyonight.nvim' }
    use { "morhetz/gruvbox" }

    -- Better Statusline
    use { 'itchyny/lightline.vim', run = vim.cmd [[
        let g:lightline = {}
        let g:lightline.separator = { 'left': '', 'right': '' }
        let g:lightline.subseparator = { 'left': '', 'right': '' }
        let g:lightline.colorscheme='tokyonight' 
    ]] }

    -- autoresizing of panes to a workable size
    use { 'camspiers/lens.vim',
        requires = { { 'camspiers/animate.vim' }, },

        run = vim.cmd [[
            let g:lens#disabled_filetypes = ['NvimTree', 'nerdtree', 'fzf', 'tagbar']
            let g:lens#width_resize_min = 130
            let g:lens#width_resize_max = 130
            let g:lens#height_resize_min = 30
            let g:lens#height_resize_max = 30
        ]]
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }


--    use { 'ggandor/lightspeed.nvim' }
    use { 'jinh0/eyeliner.nvim',
        config = function()
            require'eyeliner'.setup { }
        end 
    }

    -- File managment
    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
--    use { 'francoiscabrol/ranger.vim',
--        requires= { { 'rbgrouleff/bclose.vim' } }
--    }

    use { 'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "ThePrimeagen/harpoon",
        requires = { "nvim-lua/plenary.nvim" }
    }

    use { 'kdheepak/lazygit.nvim', run = vim.cmd [[
        let g:lazygit_floating_window_scaling_factor = 0.9
        let g:lazygit_floating_window_border_chars = ['╭', '╮', '╰', '╯']
        let g:lazygit_floating_window_use_plenary = 0
    ]] }


    -- Syntax Highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Debuggers / Programming Utils
    use { "rcarriga/nvim-dap-ui", requires = {
        'mfussenegger/nvim-dap',
    } }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({'EmmaEwert/vim-rgbds' })

    use({ 'kkoomen/vim-doge', run=':call doge#install()' })


    -- Intellisense
    use { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'l3mon4d3/luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use { 'preservim/tagbar', run = vim.cmd [[
        let g:tagbar_left = 1 
    ]]  }
end)
