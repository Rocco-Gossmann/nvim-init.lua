local dap = require('dap')

local HOME = os.getenv("HOME");
local APPNAME = os.getenv("NVIM_APPNAME") or "nvim";
local TOOLSPATH = HOME.."/.config/"..APPNAME.."/tools"

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { TOOLSPATH..'/nvim-dap-adapter-php/out/phpDebug.js' }
}

