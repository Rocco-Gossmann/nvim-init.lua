return function (buf)

	local debuggerUIOpen = false

	local mappfunc = {

		start_debugger      = function()
			if (debuggerUIOpen == false) then
				require("dapui").open();
				debuggerUIOpen = true;
			end

			vim.cmd.DapContinue();
		end,

		stop_debugger       = function()
			if (debuggerUIOpen) then
				require("dapui").close();
				debuggerUIOpen = false;
			end

			vim.cmd.DapTerminate()
		end,

		debugger_evaluate   = function()
			require("dapui").eval();
		end,

	}

	require("which-key").add({

		-- Debugger
		-- { '<leader>d',       group = "[D]ebugger" },
		-- { "<leader>db",      vim.cmd.DapToggleBreakpoint,                       desc = "[D]ebugger [B]reakpoint Toggle" },
		{ "<F6>",  mappfunc.debugger_evaluate,  desc = "[D]ebugger Evaluate",    buffer = buf },
		{ "<F5>",  mappfunc.start_debugger,     desc = "[D]ebugger Start",       buffer = buf },
		{ "<F9>",  vim.cmd.DapToggleBreakpoint, desc = "[D]ebugger Breakpoint",  buffer = buf },
		{ "<F10>", vim.cmd.DapStepOver,         desc = "[D]ebugger StepOver",    buffer = buf },
		{ "<F11>", vim.cmd.DapStepInto,         desc = "[D]ebugger StepInto",    buffer = buf },
		{ "<F12>", vim.cmd.DapStepOut,          desc = "[D]ebugger StepOut",     buffer = buf },
		{ "<F8>",  mappfunc.stop_debugger,      desc = "[D]ebugger Stop",        buffer = buf },

	});


end
