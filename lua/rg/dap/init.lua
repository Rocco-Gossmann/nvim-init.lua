local dap = require("dap")

--==============================================================================
-- BM: PHP - DAP
--==============================================================================
dap.adapters.php = {
	-- install php-debug-adapter via Mason
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/php-debug-adapter",
}





--==============================================================================
-- BM: LUA
--==============================================================================
dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode/extension/extension/debugAdapter.js" },
}

--==============================================================================
-- BM: C# / DotNet / .NET
--==============================================================================
if string.sub(vim.env.OSTYPE,1,string.len("darwin"))=="darwin" then

	-- install netcoredbg via csharp-dap install script
	dap.adapters.coreclr = {
		type = 'executable',
		command = vim.fn.stdpath("config") .. "/lua/rg/dap/netcoredbg-macOS-arm64.nvim/netcoredbg/netcoredbg",
		args = { '--interpreter=vscode' }
	}

else
	-- install netcoredbg via Mason
	dap.adapters.coreclr = {
		type = 'executable',
		command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
		args = { '--interpreter=vscode' }
	}
end


dap.configurations.cs = {

	{
		name = "NVIM: attach to Process",
		type = "coreclr",
		request = "attach",
        processId = function()

            if vim.g.CsharpDebugTargetProcessSearch == nil then
                vim.g.CsharpDebugTargetProcessSearch = ""
            end

            local dapUtils = require('dap.utils');

            local procs = dapUtils
                .get_processes( { filter = vim.g.CsharpDebugTargetProcessSearch });

            if #procs == 1 then
                return procs[1].pid

            elseif #procs > 1 then
                return dapUtils
                    .pick_process( { filter = vim.g.CsharpDebugTargetProcessSearch });

            else
                vim.notify("no running processes found");

            end

            return -1;

        end

	}

}


--==============================================================================
-- BM: C / C++ - DAP
--==============================================================================
dap.adapters.lldb = {
	type = "executable",
	command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = vim.fn.getcwd() .. "/debug.run",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.cpp = dap.configurations.c

--==============================================================================
-- BM: GO - AutoFormat and DAP
--==============================================================================
dap.adapters.go = function(callback, config)
	if config.mode == "remote" and config.request == "attach" then
		callback({
			type = "server",
			host = config.host or "127.0.0.1",
			port = config.port or "38697",
		})
	else
		callback({
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
				detached = vim.fn.has("win32") == 0,
			},
		})
	end
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {

	{
		name = "Launch Package",
		type = "go",
		request = "launch",
		program = "${workspaceFolder}",
	},

	{
		type = "go",
		name = "Attach to Remote at port 38697",
		request = "attach",
		mode = "remote",
		host = "127.0.0.1",
		port = "38697",
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

vim.cmd([[

let NERDTreeIgnore=["_templ.go"]

]])
