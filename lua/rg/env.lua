local os = require "os"

local home = os.getenv("HOME")

--      from $HOME/.config/$NVIM_APPNAME
local appname = os.getenv("NVIM_APPNAME")
if appname == nil then appname='nvim' end

local function doFileIfExists(fileName)
    if vim.fn.findfile(fileName) ~= '' then
        local ret = dofile(fileName);
        if ret == nil then
            return true
        else
            return ret
        end
    else
        return nil;
    end
end


return {
	appname = appname,
	home = home,
    confdir = home .. "/.config/" .. appname,

    doFileIfExists = doFileIfExists
}
