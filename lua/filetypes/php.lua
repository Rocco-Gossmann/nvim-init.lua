return {

	load = function()

		require("filetypes.common_plugins.dap-ui")()

		require('dap').adapters.php = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/php-debug-adapter",

		}

	end,

	config = require("filetypes.common_plugins.dap-ui-mappings")

}
