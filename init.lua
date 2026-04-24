require "rg.globals"
require "rg.opts"

require("rg.env").doFileIfExists("./.nvim/preinit.lua");

-- basics
require "rg.plugins.ui"
require "rg.plugins.dap-ui"
require "rg.plugins.lsp"

-- features
require "rg.plugins.dbui"
require "rg.plugins.markdown"
require "rg.plugins.opencode"
require "rg.plugins.taskrunner"

-- keymaps
require "rg.plugins.whichkey"


-- require "rg.dap"
require "rg.tweaks"

require("rg.env").doFileIfExists("./.nvim/postinit.lua");
require("rg.env").doFileIfExists("./.nvim/init.lua");

