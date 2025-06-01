vim.cmd [[

let g:zig_fmt_autosave = 0
let g:tmux_navigator_no_mappings = 1

]]

require "rg.copen"
require "rg.mapping"

local env = require ("rg.env");
env.doFileIfExists(env.confdir .. "/lua/rg/custom/init.lua");

vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { sql = "mysql" } })
vim.filetype.add({ extension = { ini = "toml" } })
vim.filetype.add({ extension = { html = "tpl" } })

env.doFileIfExists("./.nvim/init.lua");

return {}
