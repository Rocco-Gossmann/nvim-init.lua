require "rg"

local cwd = vim.fn.getcwd()
local filename = cwd.."/.nviminit.lua";
local file = vim.fn.findfile(filename)

if file ~= '' then
    dofile(file);
else
    print("you can customize NVIM further for this folder by creating a '" .. filename .. "' file");
end

