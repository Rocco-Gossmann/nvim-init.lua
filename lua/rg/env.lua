local os = require "os"

local home = os.getenv("HOME")

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
		-- print("file: " .. fileName .. " not found")
		return nil;
	end
end

local confdir = home .. "/.config/" .. appname;
local statedir = home .. "/.local/state/" .. appname;
local tpldir = confdir .. "/lua/rg/templates/";

local function readTemplate(filename)
	local tplfile = tpldir .. filename
	vim.cmd.read(tplfile);
end

local function printTable(tbl, depth)

	if not tbl then return end

	depth = depth or 0;

	local indent = string.rep("  ", depth)
	for k, v in pairs(tbl) do
		if type(v) == "table" then
			printTable(v, depth + 1)
		else
			print(indent .. tostring(k) .. " = " .. tostring(v))
		end
	end
end

return {
	appname = appname,
	home = home,
	confdir = confdir,
	statedir = statedir,

	doFileIfExists = doFileIfExists,

	readTemplate = readTemplate,

	printTable = printTable
}
