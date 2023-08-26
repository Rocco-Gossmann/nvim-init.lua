local os = require "os"

local home = os.getenv("HOME")

--      from $HOME/.config/$NVIM_APPNAME
local appname = os.getenv("NVIM_APPNAME")
if appname == nil then appname='nvim' end

return {
	appname = appname,
	home = home,
    confdir = home .. "/.config/" .. appname
}
