local wk = require("which-key");
local os = require("os");

vim.g.mapleader = " "

local CWD = vim.fn.getcwd()
local NVIM_APPNAME = os.getenv("NVIM_APPNAME");
local HOME = os.getenv("HOME");
if NVIM_APPNAME == nil then NVIM_APPNAME = "nvim" end;
local CONFPATH = HOME .. "/.config/" .. NVIM_APPNAME

require("rg.mappings.common")(wk)
require "rg.mappings.nvim-tree"

vim.cmd('autocmd BufEnter * lua FiletypeKeyMode()')

-- Filetype Keybinds
function FiletypeKeyMode()
    vim.cmd("cd "..CONFPATH)

    local ft = vim.bo.filetype
    local done = false;

    if vim.fn.findfile( "./lua/rg/mappings/filetypes/" .. ft .. ".lua") ~= '' then
        require ("rg.mappings.filetypes." .. ft)(wk);
        done = true;
    end

    if vim.fn.findfile( "./lua/custom/mappings/filetypes/" .. ft .. ".lua") ~= '' then
        require ("custom.mappings.filetypes." .. ft)(wk);
        done = true;
    end

    if not(done) then
        require("rg.mappings.filetypes.all")(wk);
    end

    print("mappings for '"..ft.."' loaded")

    vim.cmd("cd "..CWD)
end
