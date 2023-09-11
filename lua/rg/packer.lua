vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Mysql / Db client
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }
    use { 'kristijanhusak/vim-dadbod-completion' }

    -- Must have for TMUX users
    use { 'christoomey/vim-tmux-navigator' }

    -- Some visual fluff
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'itchyny/lightline.vim', run = vim.cmd [[
        let g:lightline = {}
        let g:lightline.separator = { 'left': '', 'right': '' }
        let g:lightline.subseparator = { 'left': '', 'right': '' }
    ]] }


    -- Better file navigation 
    use { 'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "ThePrimeagen/harpoon",
        requires = { "nvim-lua/plenary.nvim" }
    }


    -- Awesome Keymapping and Custome modes
    use { 'anuvyklack/hydra.nvim' }


    -- Debuggers and LSPs
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { "rcarriga/nvim-dap-ui", requires = {
        'mfussenegger/nvim-dap',
    } }


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
end)
