vim.g.mapleader=' '

local silnor = {noremap=true, silent=true}

--[[============================================================================
-- Select + Visual Mode helpers
--============================================================================]]
vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", silnor); -- Move Selected Line Down 
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", silnor); -- Move Selected Line Up
vim.api.nvim_set_keymap("x", '<leader>p', '"_dP', silnor);

--[[============================================================================
-- Insert-Mode Hints
--============================================================================]]
vim.api.nvim_set_keymap("i", '<C-j>', '<cmd>lua vim.lsp.buf.completion({ reason = require("cmp").ContextReason.Auto })<CR>', silnor);
vim.api.nvim_set_keymap("i", '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silnor);

--[[============================================================================
-- Surround with
--============================================================================]]
vim.api.nvim_set_keymap("v", "<space>", 'c  <ESC>hmzplv`z', silnor);
vim.api.nvim_set_keymap("v", ".", 'c..<ESC>hmzplv`z', silnor);
vim.api.nvim_set_keymap("v", "\"", 'c""<ESC>hmzplv`z', silnor);
vim.api.nvim_set_keymap("v", "'", "c''<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "(", "c()<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "[", "c[]<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "{", "c{}<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", 'bu', "y:grep \"<C-r>\"\" ./*<cr><cr>:copen<cr>", silnor)

vim.api.nvim_set_keymap('n', 'q', '<nop>' , silnor)  -- disable default q
vim.api.nvim_set_keymap('n', 'Q', 'q'     , silnor)  -- record macro via Q
vim.api.nvim_set_keymap('n', 's', '@'     , silnor)  -- play Macros via s
vim.api.nvim_set_keymap('n', 'M', 'm'     , silnor)  -- create Marks via M
vim.api.nvim_set_keymap('n', 'm', '`'     , silnor)  -- invoke them via m

--[[============================================================================
-- Utils
--============================================================================]]
local sysClipCopy = '"+yy'
local replaceUnderCursor = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";

vim.api.nvim_set_keymap("n", "<C-y>"         , sysClipCopy, silnor);
vim.api.nvim_set_keymap("n", "<leader><C-r>" , replaceUnderCursor, silnor);
vim.api.nvim_set_keymap("n", "<leader>gt"    , ':LazyGit<CR>', silnor);
vim.api.nvim_set_keymap("n", "<S-j>"         , "mzJ`z", silnor); -- Keep Cursor on Join Line

-- Keep Cursor centered, when jumping and searching
vim.api.nvim_set_keymap("v", "n", "nzz", silnor);
vim.api.nvim_set_keymap("v", "N", "Nzz", silnor);
vim.api.nvim_set_keymap("v", "<C-d>", "<C-d>zz", silnor);
vim.api.nvim_set_keymap("v", "<C-u>", "<C-u>zz", silnor);

--[[============================================================================
-- Lsp
--============================================================================]]
vim.api.nvim_set_keymap("v", 'gd', 'lua vim.lsp.buf.definition()<CR>', silnor);
vim.api.nvim_set_keymap("v", 'H',  'lua vim.lsp.buf.hover({ reason = cmp.ContextReason.Auto }) <CR>', silnor);
--vim.api.nvim_set_keymap("v", '[d', function() vim.diagnostic.goto_next() end, silnor);
--vim.api.nvim_set_keymap("v", ']d', function() vim.diagnostic.goto_prev() end, silnor);

--[[============================================================================
-- Moving around splits via ctrl + hjkl
--============================================================================]]
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', silnor)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', silnor)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', silnor)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', silnor)

--[[============================================================================
-- Hydras
--============================================================================]]
local Hydra = require("hydra")
local rgenv = require("rg.env")

-- Filetype Specific Hydra Invoced By ?q  or what ever you decide its body is
------------------------------------------------------------------------------
local fileTypeHydra = nil;
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.schedule(function()

            fileTypeHydra = rgenv.doFileIfExists(rgenv.confdir .. "/lua/custom/mapping/hydras/filetype/"..vim.bo.filetype..".lua");

            if fileTypeHydra == nil then
                fileTypeHydra = rgenv.doFileIfExists(rgenv.confdir .. "/lua/custom/mapping/hydras/filetype/common.lua");
            end

            if fileTypeHydra == nil then
                fileTypeHydra = rgenv.doFileIfExists(rgenv.confdir .. "/lua/mapping/hydras/filetype/"..vim.bo.filetype..".lua")
            end

            if fileTypeHydra == nil then
                fileTypeHydra = rgenv.doFileIfExists(rgenv.confdir .. "/lua/mapping/hydras/common.lua");
            end
        end)
    end
})


-- Hydras without Leader
------------------------------------------------------------------------------
local foldingHydra = require "mapping.hydras.folding"; -- z - key
local closingHydra = require "mapping.hydras.closing"; -- Z - key
local quickListHydra = require "mapping.hydras.quicklist"; -- b - key
local explorerHydra = require "mapping.hydras.explorer"; -- Shift + E - key

local telescopeHydra = require "mapping.hydras.telescope"; -- <leader>f
local harpoonHydra = require "mapping.hydras.harpoon"; -- <leader>h
local lspHydra     = require "mapping.hydras.lsp"; -- <leader>v 

-- Leader Hydra
------------------------------------------------------------------------------
Hydra({
   mode = { 'n' },
   body = "?",
   hint = [[ 
 Help                                _<ESC>_
===========================================
   _z_ => Folds         _Z_ => Closing
   _b_ => Quicklist     _E_ => Explorer

   _<C-y>_ => Line to System Clipboard

===========================================
   <Leader> => 
-------------------------------------------
--
   _<C-r>_ => Refactor word under Cursor

   gt => Open Git

   t => TagBar        _v_ => LSP
   _h_ => Harpoon       _f_ => Telescope

   _q_ => FileType - Actions
]],
    heads = {
        {"f", function() telescopeHydra:activate() end },
        {"h", function() harpoonHydra:activate()   end },
        {"v", function() lspHydra:activate()       end },
        {"z", function() foldingHydra:activate()   end },
        {"Z", function() closingHydra:activate()   end },
        {"b", function() quickListHydra:activate() end },
        {"E", function() explorerHydra:activate() end },

        {"<C-r>" , replaceUnderCursor, { exit=true}  },
        {"<C-y>" , sysClipCopy, { exit=true} },

        {"q", function()
            if fileTypeHydra == nil then
                print("no filetype based Hydra yet");
            else
                fileTypeHydra:activate()
            end
        end},

        {"<ESC>", nil, {exit=true, nowait=true}},
    },
	config = {
        color="teal",
		invoke_on_body = true,
		hint = { position="middle", border="rounded" }
	}
})
