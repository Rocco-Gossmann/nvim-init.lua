require "rg"

-- Load Custom Configurations
local os = require "os"

--      from $HOME/.config/$NVIM_APPNAME
local home = os.getenv("HOME")
local appname = os.getenv("NVIM_APPNAME")
if appname == nil then appname='nvim' end

local filename = home.."/.config/"..appname.."/.nviminit.lua";
if vim.fn.findfile(filename) ~= '' then
    dofile(filename);
end

--      from $CWD
filename = ".nviminit.lua"
if vim.fn.findfile(filename) == '' then
    print("you can customize NVIM further for this folder by creating a '" .. filename .. "' file");
else
    dofile(filename);
end
