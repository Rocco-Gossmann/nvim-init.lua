
vim.opt.winborder = "rounded"

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()
    vim.opt_local.winborder = "none"
    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,
      callback = function()
        vim.opt_local.winborder = "rounded"
      end,
    })
  end,
})

require "rg.opts";
require "rg.filetypes";
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
