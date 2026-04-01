
require "rg.globals"
require "rg.opts"

require("rg.env").doFileIfExists("./.nvim/preinit.lua");

require "rg.plugins.lazy"

require "rg.dap"

require "rg.mappings"
require "rg.tweaks"

require("rg.env").doFileIfExists("./.nvim/postinit.lua");
require("rg.env").doFileIfExists("./.nvim/init.lua");

