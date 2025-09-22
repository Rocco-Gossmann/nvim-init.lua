local dap = require("dap");
local env = require("rg.env");

--==============================================================================
-- BM: PHP - DAP
--==============================================================================
dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = { env.confdir .. '/lua/rg/dap/vscode-php-debug/out/phpDebug.js' }
}

--==============================================================================
-- BM: C / C++ - DAP
--==============================================================================
dap.adapters.lldb = {
	type = 'executable',
	command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = vim.fn.getcwd() .. "/debug.run",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {}
	},
}

dap.configurations.cpp = dap.configurations.c

--==============================================================================
-- BM: GO - AutoFormat and DAP
--==============================================================================
dap.adapters.go = function(callback, config)
	if config.mode == 'remote' and config.request == 'attach' then
		callback({
			type = 'server',
			host = config.host or '127.0.0.1',
			port = config.port or '38697'
		})
	else
		callback({
			type = 'server',
			port = '${port}',
			executable = {
				command = 'dlv',
				args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
				detached = vim.fn.has("win32") == 0,
			}
		})
	end
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {

	{
		name = "Launch Package",
		type = "go",
		request = "launch",
		program = "${workspaceFolder}"
	},

	{
		type = "go",
		name = "Attach to Remote at port 38697",
		request = "attach",
		mode = "remote",
		host = "127.0.0.1",
		port = "38697"
	},

}



-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
--dap.configurations.go = {
--  {
--    type = "delve",
--    name = "Debug",
--    request = "launch",
--    program = "${file}"
--  },
--}

vim.cmd [[

let NERDTreeIgnore=["_templ.go"]

]]


--==============================================================================
-- Intelephense
--==============================================================================
if vim.lsp.intelephense then
	vim.lsp.intelephense.setup {
		settings = {
			intelephense = {
				environment = {
					includePaths = {
						"/Users/st/.local/bin/programs/phpunit"
					},
				}
			}
		}
	}
end
