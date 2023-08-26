vim.api.nvim_set_keymap("n", "<C-y>", '"+yy', {}); -- Copy to system clipboard

vim.g.mapleader=' '

vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", {}); -- Move Selected Line Down 
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", {}); -- Move Selected Line Up

vim.api.nvim_set_keymap("n", "q", "<nop>", {}); -- 
vim.api.nvim_set_keymap('n', 'M', 'm', {})  -- set marks via M
vim.api.nvim_set_keymap('n', 'm', '`', {})  -- invoke them via m
vim.api.nvim_set_keymap('n', 's', '@', {})  -- play Macros via s
vim.api.nvim_set_keymap('n', 'Q', 'q', {})  -- record macro via Q
vim.api.nvim_set_keymap('n', 'gg', 'ggzz', {}) -- keep found line in center

--[[============================================================================
-- Utils
--============================================================================]]
vim.api.nvim_set_keymap("n", "<C-y>"            , '"+yy', {});
vim.api.nvim_set_keymap("n", "<leader><C-r>"    , ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', {});
vim.api.nvim_set_keymap("n", "<leader>gt"       , ':LazyGit<CR>', {});

--[[============================================================================
-- TagBar
--============================================================================]]
vim.api.nvim_set_keymap("n", "<leader>t", ":TagbarToggle<CR>"  , {});
vim.api.nvim_set_keymap("n", "{"        , ":TagbarJumpPrev<CR>", {});
vim.api.nvim_set_keymap("n", "}"        , ":TagbarJumpNext<CR>", {});

--[[============================================================================
-- Moving around splits via ctrl + hjkl
--============================================================================]]
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})

--[[============================================================================
-- Hydras
--============================================================================]]
local Hydra = require("hydra")

-- Hydras without Leader
------------------------------------------------------------------------------
local foldingHydra = require "rg.mappings.plugins.folding"; -- z - key
local closingHydra = require "rg.mappings.plugins.closing"; -- Z - key
local quickListHydra = require "rg.mappings.plugins.quicklist"; -- b - key
local explorerHydra = require "rg.mappings.plugins.explorer"; -- Shift + E - key

-- Leader Hydra
------------------------------------------------------------------------------
Hydra({
   mode = { 'n' },
   body = "<leader>",
   hint = [[ Help
=====================================
   _z_ => Folds       _Z_ => Closing
   _b_ => Quicklist

   _<C-r>_ => Refactor word under Cursor
   <C-y> => Line to System Clipboard

=====================================
   <Leader> => 
-------------------------------------
   gt => Open Git

   t => TagBar   _v_ => LSP
   _h_ => Harpoon  _f_ => Telescope

]],
    heads = { 
        {"f", function() require "mapping.hydras.telescope":activate() end },
        {"h", function() require "mapping.hydras.harpoon":activate()   end },
        {"v", function() require "mapping.hydras.lsp":activate()       end },
        {"z", function() foldingHydra:activate()                            end },
        {"Z", function() closingHydra:activate()                            end },
        {"b", function() quickListHydra:activate()                          end },

        {"<C-r>" , ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { exit=true}  },
        {"<C-y>" , '"+yy', { exit=true} }
    },
	config = {
        color="pink",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" }
	}
})

