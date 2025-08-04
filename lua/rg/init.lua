require "rg.opts";
require "rg.filetypes";
require "rg.copen"
require "rg.mapping"


vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()

	local vimOptBorders = vim.opt_local.winborder;
    vim.opt_local.winborder = "none"

    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,

      callback = function()

        vim.opt_local.winborder = vimOptBorders

      end,

    })

  end,
})


local env = require ("rg.env");
env.doFileIfExists(env.confdir .. "/lua/rg/custom/init.lua");


env.doFileIfExists("./.nvim/init.lua");

return {}
