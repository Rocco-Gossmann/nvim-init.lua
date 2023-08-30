vim.opt.foldmethod="expr"

local rgenv = require("rg.env");
local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { rgenv.confdir..'/tools/nvim-dap-adapter-php/out/phpDebug.js' }
}

