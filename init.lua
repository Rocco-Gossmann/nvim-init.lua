local rgenv = require("rg.env");

require("rg.packer")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.nrformats:append("alpha")

vim.opt.grepprg="rg -n -i -g -L --ignore-file .rgignore $* /dev/null"

vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.foldlevelstart = 99

require("mapping")

vim.schedule(function()

    -- this is a comment just to test the following line
    vim.api.nvim_set_hl(0, "Comment", {bg = "none", fg="#a0a0a0"})
    vim.api.nvim_set_hl(0, "Conditional", {bg = "none", fg="#d7afff"})
    vim.api.nvim_set_hl(0, "@parameter", {bg = "none", fg="#ff87af"})
    vim.api.nvim_set_hl(0, "@tag.attribute", {bg = "none", fg="#87d7d7"})
    vim.api.nvim_set_hl(0, "@text.uri", {bg = "none", fg="#ffd7d7"})

    rgenv.doFileIfExists( rgenv.confdir .. "/lua/custom/init.lua")

    --      from $CWD
    if rgenv.doFileIfExists(".nvim/init.lua") == nil then
        if rgenv.doFileIfExists(".nviminit.lua") == nil then
            print("you can customize NVIM further for this folder by creating a '.nviminit.lua' or a '.nvim/init.lua' file");
        end
    end

end)

require "rg.bufflog"

require "filetype"
