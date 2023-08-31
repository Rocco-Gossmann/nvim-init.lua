local dap = require('dap')

dap.configurations.lua = {
    {
        type = "lua",
        request = "launch",
        name = "Debug Current File",
        program = {
            lua = "lua5.1",
            file = "${file}"
        }
    }
}
