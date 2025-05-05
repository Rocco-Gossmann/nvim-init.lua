vim.opt.nu = true
vim.opt.relativenumber=true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80,120"

vim.opt.nrformats:append("alpha")

vim.opt.grepprg="rg -n -i --ignore-file .rgignore $* /dev/null"

vim.opt.conceallevel = 1
vim.opt.wrap = false


vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.tabstop=4
        vim.opt.autoindent=true
        vim.opt.cursorline=true

        vim.opt.foldlevelstart=99
        vim.opt.foldmethod="indent"
        -- vim.opt.foldexpr="nvim_treesitter#foldexpr()"
    end
})


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

env.doFileIfExists("./.nvim/init.lua");
