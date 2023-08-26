local Hydra = require("hydra")
local cmp = require('cmp')

vim.api.nvim_set_keymap("n", "<C-y>", '"+yy', {});

vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", {});
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", {});

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
-- Hydras without Leader
--============================================================================]]
local foldingHydra = require "rg.mappings.plugins.folding"; -- z - key
local closingHydra = require "rg.mappings.plugins.closing"; -- Z - key
local quickListHydra = require "rg.mappings.plugins.quicklist"; -- b - key
local explorerHydra = require "rg.mappings.plugins.explorer"; -- Shift + E - key


-- Helper Hydra
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
        {"f", function() require "rg.mappings.plugins.telescope":activate() end },
        {"h", function() require "rg.mappings.plugins.harpoon":activate()   end },
        {"v", function() require "rg.mappings.plugins.lsp":activate()       end },
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


--return function(wk)
--
--
--    wk.register({
--
--        ['<C-n>'] = { ":Vex<CR>", "Explorer" },
--        ['<M-n>'] = { "<ESC>", "Escape" },
--
--        ["J"] = { "mzJ`z", "Keep Cursor on Join Line" },
--
--        ["<C-d>"] = { "<C-d>zz", "Keep Cursor centered when jumping down" },
--        ["<C-u>"] = { "<C-u>zz", "Keep Cursor centered when jumping up" },
--
--        ["n"] = { "nzz", "Keep Cursor centered when searching down" },
--        ["N"] = { "Nzz", "Keep Cursor centered when searching up" },
--
--
--
--    --[[============================================================================
--    -- LSP
--    --============================================================================]]
--        ['gd'] = { function() vim.lsp.buf.definition() end, 'Goto Definition' },
--        ['H'] = { function() vim.lsp.buf.hover({ reason = cmp.ContextReason.Auto }) end, "Show Hover" },
--        ['[d'] = { function() vim.diagnostic.goto_next() end, 'Goto Next' },
--        [']d'] = { function() vim.diagnostic.goto_prev() end, 'Goto Prev' },
--    }, { mode = "n" })
--
--    wk.register ({
--        ['<C-y>'] = { '"+y', "Yank to System Clipboard" },
--        ["<C-r>"] = { ":s/\\%V//g<Left><Left><Left>", "replace inside selected text" },
--
--        ["J"] = { ":m '>+1<CR>gv=gv", "Move selected Line Down " },
--        ["K"] = { ":m '<-2<CR>gv=gv", "Move selected Line Up " },
--
--        ["<space>"] = { 'c  <ESC>hmzplv`z', "Surround with space" },
--        ["."] = { 'c..<ESC>hmzplv`z', "Surround in dot" },
--        ["\""] = { 'c""<ESC>hmzplv`z', "Surround in quotes" },
--        ["'"]  = { "c''<ESC>hmzplv`z", "Surround in single quotes" },
--        ["("]  = { "c()<ESC>hmzplv`z", "Surround in braces" },
--        ["["]  = { "c[]<ESC>hmzplv`z", "Surround in brackets" },
--        ["{"]  = { "c{}<ESC>hmzplv`z", "Surround in squerlies" },
--        ['bu'] = { "y:grep \"<C-r>\"\" ./*<cr><cr>:copen<cr>", "Selection to Quickfix-List" }
--    }, { mode = "v" })
--
--    wk.register({
--        ['<leader>p'] = { '"_dP', "Paste without replacing the clipboard" },
--    }, { mode = "x" })
--
--    wk.register({
--        ['<C-j>'] = { function() vim.lsp.buf.completion({ reason = cmp.ContextReason.Auto }) end, "Code complete" },
--        ['<C-h>'] = { function() vim.lsp.buf.signature_help() end, "Signature Help" },
--
--        ['§'] = {
--            name = "snippets"
--        }
--
--    }, { mode = "i" })
--
--end
