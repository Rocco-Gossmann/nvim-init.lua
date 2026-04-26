local rgenv = require("rg.env")
local registerCommandLoad = require("rg.commandloads")

require "rg.globals"
require "rg.opts"

-- setup project specific global vars and stuff
rgenv.doFileIfExists("./.nvim/preinit.lua");

-- load common plugins / packages
require "plugins.init"

--[[ INFO:
===============================================================================
| setup filetype plugin loader
===============================================================================

 In this Config, You can load Plugins only if you add a Buffer with a specific FiletType

 For that:

1.) put your definitions into ./nvim/[filetype].lua of your project

  1a.) to make it avaailable to all projects put it in [NVIM_APPNAME]/lua/filetypes/[filetype].lua


2.) the include must return a table with

 return {
      load  = function() ... end,          -- do your vim.pack.add and setups in here

      confg = function(bufferid) ... end,  -- register your keyboard shortcuts and other buffer related stuff here
 }

`load` is only executed the first time you open a file of this type in your current session
`config` is executed every time you AddBuf a new Buffer to your Session (and on VimEnter)

--]]
require "rg.filetypeloader"


--[[ INFO:
===============================================================================
| Loading Plugins on Commands
===============================================================================
-- ]]
registerCommandLoad("DBUI", "plugins.dbui"); -- loads the Dadbod-UI only after
--                                              you call this Command



-- final tweaks
require "rg.tweaks"

-- load project specific changes
rgenv.doFileIfExists("./.nvim/postinit.lua");
rgenv.doFileIfExists("./.nvim/init.lua");
