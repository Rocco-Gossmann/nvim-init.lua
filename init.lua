
require "rg.globals"
require "rg.opts"

require("rg.env").doFileIfExists("./.nvim/preinit.lua");

require "rg.plugins.ui"
require "rg.plugins.dap-ui"
require "rg.plugins.lsp"
require "rg.plugins.dbui"

require "rg.plugins.whichkey"



-- require "rg.plugins.lazy"
-- require "rg.dap"

require "rg.tweaks"

require("rg.env").doFileIfExists("./.nvim/postinit.lua");
require("rg.env").doFileIfExists("./.nvim/init.lua");

