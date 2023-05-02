local dap = require('dap')

local HOME = os.getenv("HOME");
local APPNAME = os.get("NVIM_APPNAME");
local CONFPATH = HOME.."/.config/"..APPNAME.."/tools/nvim-dap-adapter-php"

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { CONFPATH..'/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000
  }
}
