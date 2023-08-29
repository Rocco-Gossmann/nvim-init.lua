vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    use { "catppuccin/nvim", as = "catppuccin" }

    -- Better Statusline
    use { 'itchyny/lightline.vim', run = vim.cmd [[
        let g:lightline = {}
        let g:lightline.separator = { 'left': '', 'right': '' }
        let g:lightline.subseparator = { 'left': '', 'right': '' }
    ]] }

--    use { 'nathanaelkane/vim-indent-guides' }

    use { 'christoomey/vim-tmux-navigator' }

    use { 'anuvyklack/hydra.nvim' }

    use { 'jinh0/eyeliner.nvim',
        config = function()
            require'eyeliner'.setup { }
        end
    }

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
