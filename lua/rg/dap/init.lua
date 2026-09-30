local dap = require("dap")
local env = require("rg.env")

--==============================================================================
-- BM: PHP - DAP
--==============================================================================
dap.adapters.php = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/php-debug-adapter",
	-- args = { env.confdir .. '/lua/rg/dap/vscode-php-debug/out/phpDebug.js' }
}

--==============================================================================
-- BM: PHP - DAP
--==============================================================================
dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode/extension/extension/debugAdapter.js" },
}

--==============================================================================
-- BM: C# / DotNet / .NET
--==============================================================================
dap.adapters.coreclr = {
  type = 'executable',
  command =  vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()

		vim.cmd("silent !dotnet build > buildlog.txt");

      -- print(vim.system({"bash", "-c", "dotnet", "build", ">" , "output.txt"}):wait())

      local dir = vim.fs.joinpath(vim.fn.getcwd(), "bin", "Debug")
      local dlls = vim.fs.find(function(name) return name:match("%.dll$") end,
        { path = dir, type = "file", limit = math.huge })

      if #dlls == 0 then
        vim.notify("No DLLs found in " .. dir, vim.log.levels.WARN)
        return nil
      end

      local items = {}
      for _, p in ipairs(dlls) do
        table.insert(items, vim.fn.fnamemodify(p, ":."))
      end

      local target = vim.g.CsharpDebugTargetDLL
      if target then
        local target_path = vim.fs.joinpath(vim.fn.getcwd(), vim.fs.normalize(target))
        for i, p in ipairs(dlls) do
          if vim.fs.normalize(p) == target_path then
            -- vim.notify("Using preset DLL: " .. vim.fn.fnamemodify(p, ":."))
            return p
          end
        end
        vim.notify("Preset DLL not found in build output: " .. target, vim.log.levels.WARN)
      end

      local co = coroutine.running()
      local choice
      vim.ui.select(items, { prompt = "Select DLL: " }, function(_, idx)
        if idx then choice = dlls[idx] end
        if co then coroutine.resume(co) end
      end)

      if co then coroutine.yield() end

      if not choice then
        vim.notify("No DLL selected", vim.log.levels.WARN)
        return nil
      end
      return choice
    end,
  },
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

