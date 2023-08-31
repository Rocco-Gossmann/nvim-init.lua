require("dapui").setup{ }

local dap = require('dap')
local rgenv = require("rg.env");

--==============================================================================
-- PHP
--==============================================================================
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { rgenv.confdir .. '/tools/nvim-dap-adapter-php/out/phpDebug.js' }
}

--==============================================================================
-- Lua
--==============================================================================
dap.adapters.lua = {
    type = "executable",
    command = "node",
    args = { rgenv.confdir .. '/tools/local-lua-debugger-vscode/extension/debugAdapter.js' },

    enrich_config = function(config, on_config)
        if not config["extensionPath"] then
            local c = vim.deepcopy(config)
            -- 💀 If this is missing or wrong you'll see
            -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
            c.extensionPath = rgenv.confdir .. '/tools/local-lua-debugger-vscode/'
            on_config(c)
        else
            on_config(config)
        end
    end,
}

