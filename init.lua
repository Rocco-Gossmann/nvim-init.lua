local rgenv = require("rg.env")
local registerCommandLoad = require("rg.commandloads")

require "rg.globals"
require "rg.opts"

-- setup project specific global vars and stuff
rgenv.doFileIfExists("./.nvim/preinit.lua");

-- load common plugins / packages
require "plugins.init"

-- setup filetype plugin loader
--
-- put your definitions into ./lua/filetypes/[filetype].lua
--
-- it must return a table with
-- return {
--      load  = function() ... end,          -- do your vim.pack.add and setups in here
--
--      confg = function(bufferid) ... end,  -- register your keyboard shortcuts and other buffer related stuff here
-- }
--
require "rg.filetypeloader"

-- Plugins only loaded if command is called
-- calling "DBUI" will load the plugin, that created this command
registerCommandLoad("DBUI", "plugins.dbui");

-- final tweaks
require "rg.tweaks"

-- load project specific changes
rgenv.doFileIfExists("./.nvim/postinit.lua");
rgenv.doFileIfExists("./.nvim/init.lua");
