-- Changes to loaded plugins and DAP configurations go here

-- Options are

-- =============================================================================
-- BM: C# CSharp DotNet
-- =============================================================================
--
-- -- either define a ProcessName (you don't need the full name just part of it.)
--
-- vim.g.CsharpDebugTargetProcessSearch = "your_application";

-- -- Or overide the "Attach - config, with your won
--
-- require("dap").configurations.cs = {
-- 	{
-- 		name = "launch - netcoredbg",
-- 		type = "coreclr",
-- 		request = "launch",
--
-- 		program = vim.fn.getcwd() .. "/path/to/your_application.dll"
--
-- -- or privide a function to also handle building
-- 		program = function()
-- 			vim.cmd("silent !dotnet build 1>/tmp/dotnet.build.log 2>/tmp/dotnet.build.log");
-- 			return vim.fn.getcwd() .. vim.g.CsharpDebugTargetDLL
-- 		end

-- 	},
-- }
