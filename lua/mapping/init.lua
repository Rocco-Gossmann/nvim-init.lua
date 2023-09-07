vim.g.mapleader=' '

local silnor = {noremap=true, silent=true}

--[[============================================================================
-- Repeated COmmands
--============================================================================]]
local sysClipCopy = '"+yy'
local replaceUnderCursor = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";

--[[============================================================================
-- Select + Visual Mode helpers
--============================================================================]]
vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", silnor); -- Move Selected Line Down 
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", silnor); -- Move Selected Line Up
vim.api.nvim_set_keymap("x", '<leader>p', '"_dP', silnor);

vim.api.nvim_set_keymap("x", "<C-r>", ":s///gI<Left><Left><Left><Left>", {noremap=true});                  -- Replace in selection
vim.api.nvim_set_keymap("x", "<C-l>", ":s/^\\(\\s\\{-\\}\\)//gI<Left><Left><Left><Left>", {noremap=true}); -- Replace in sleected line (preselected whitespace group)
vim.api.nvim_set_keymap("x", "<C-y>"         , sysClipCopy, silnor);

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
vim.api.nvim_set_keymap("v", "-", "c--<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "_", "c__<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "*", "c**<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "~", "c~~<ESC>hmzplv`z", silnor);
vim.api.nvim_set_keymap("v", "/", "c//<ESC>hmzplv`z", silnor);

vim.api.nvim_set_keymap("v", 'bu', "y:grep \"<C-r>\"\" ./*<cr><cr>:copen<cr>", silnor)

--[[============================================================================
-- Mapping m/M + numbers to Global Bookmarks
--============================================================================]]
vim.api.nvim_set_keymap('n', 'M1', 'mA'   , silnor)
vim.api.nvim_set_keymap('n', 'M2', 'mB'   , silnor)
vim.api.nvim_set_keymap('n', 'M3', 'mC'   , silnor)
vim.api.nvim_set_keymap('n', 'M4', 'mD'   , silnor)
vim.api.nvim_set_keymap('n', 'M5', 'mE'   , silnor)
vim.api.nvim_set_keymap('n', 'M6', 'mF'   , silnor)
vim.api.nvim_set_keymap('n', 'M7', 'mG'   , silnor)
vim.api.nvim_set_keymap('n', 'M8', 'mH'   , silnor)
vim.api.nvim_set_keymap('n', 'M9', 'mI'   , silnor)
vim.api.nvim_set_keymap('n', 'M0', 'mJ'   , silnor)

vim.api.nvim_set_keymap('n', 'm1', '`A'   , silnor)
vim.api.nvim_set_keymap('n', 'm2', '`B'   , silnor)
vim.api.nvim_set_keymap('n', 'm3', '`C'   , silnor)
vim.api.nvim_set_keymap('n', 'm4', '`D'   , silnor)
vim.api.nvim_set_keymap('n', 'm5', '`E'   , silnor)
vim.api.nvim_set_keymap('n', 'm6', '`F'   , silnor)
vim.api.nvim_set_keymap('n', 'm7', '`G'   , silnor)
vim.api.nvim_set_keymap('n', 'm8', '`H'   , silnor)
vim.api.nvim_set_keymap('n', 'm9', '`I'   , silnor)
vim.api.nvim_set_keymap('n', 'm0', '`J'   , silnor)

--[[============================================================================
-- Utils
--============================================================================]]
vim.api.nvim_set_keymap('n', 'q', '<nop>' , silnor)  -- disable default q
vim.api.nvim_set_keymap('n', 'Q', 'q'     , silnor)  -- record macro via Q
vim.api.nvim_set_keymap('n', 's', '@'     , silnor)  -- play Macros via s
vim.api.nvim_set_keymap('n', 'M', 'm'     , silnor)  -- create Marks via M
vim.api.nvim_set_keymap('n', 'm', '`'     , silnor)  -- invoke them via m

vim.api.nvim_set_keymap("n", "<C-y>"         , sysClipCopy, silnor);
vim.api.nvim_set_keymap("n", "<leader><C-r>" , replaceUnderCursor, silnor);
vim.api.nvim_set_keymap("n", "<leader>gt"    , ':LazyGit<CR>', silnor);
vim.api.nvim_set_keymap("n", "<S-j>"         , "mzJ`z", silnor); -- Keep Cursor on Join Line

vim.api.nvim_set_keymap("n", "<S-s>"         , ":DBUIToggle<cr>", silnor);


-- You can set [NXT] in side your snippes etc, and then use 2xTab to start editing the location
-- they are in
vim.api.nvim_set_keymap("n", "<Tab><Tab>", "/\\[NXT\\]<CR>v%c", {silent=true});
vim.api.nvim_set_keymap("i", "<S-Tab>", "<esc>/\\[NXT\\]<CR>v%c", {silent=true});

-- Keep Cursor centered, when jumping and searching
vim.api.nvim_set_keymap("v", "n", "nzz", silnor);
vim.api.nvim_set_keymap("v", "N", "Nzz", silnor);
vim.api.nvim_set_keymap("v", "<C-d>", "<C-d>zz", silnor);
vim.api.nvim_set_keymap("v", "<C-u>", "<C-u>zz", silnor);

--[[============================================================================
-- Lsp
--============================================================================]]
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

if vim.g.rg_mapping_autocmd_id ~= nil then
    vim.api.nvim_del_autocmd(vim.g.rg_mapping_autocmd_id);
end

vim.g.rg_mapping_autocmd_id = vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
        vim.schedule(function()

            vim.cmd.BuffLogSend("Mapping Buffer: " .. vim.bo.filetype);

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
local splitsHydra  = require "mapping.hydras.split"; -- <leader>w
local debuggerHydra  = require "mapping.hydras.debugger"; -- Shift + d


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
   _B_ => Quicklist     _E_ => Explorer
   _z_ => Folds         _Z_ => Closing
                      _D_ => Debugger

   _<C-y>_ => Line to System Clipboard


===========================================
   <Leader> => 
-------------------------------------------

   _w_ => splits

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
        {"B", function() quickListHydra:activate() end },
        {"E", function() explorerHydra:activate() end },
        {"D", function() debuggerHydra:activate() end },
        {"w", function() splitsHydra:activate() end },

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

