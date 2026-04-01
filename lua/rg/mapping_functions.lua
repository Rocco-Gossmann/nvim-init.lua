local telescope_builtin = require('telescope.builtin');
local gs = package.loaded.gitsigns
local dapui = require("dapui");

local debuggerUIOpen = false

local function filetypeKeymap(pattern, maps)

	local callback = function(args)
		local newMaps = {}

		for _, v in pairs(maps) do
			v.buffer = args.buf
			table.insert(newMaps, v)
		end

		require("which-key").add(newMaps)
	end

	vim.api.nvim_create_autocmd("BufAdd", { pattern = pattern, callback =callback })
	vim.api.nvim_create_autocmd("VimEnter", { pattern = pattern, callback =callback })

end

local function openTerminalPopup(shellCommand)
	return function()

		local shellCommand = string.gsub(shellCommand, "%%dirname%%", vim.fn.expand("%:p:h"))
		vim.fn.system(string.format('tmux display-popup -E "%s"', shellCommand))

	end
end

local function focusTerminalBuffer(termName, startCmd)
	return function()

		local noTerm = vim.fn.system('tmux list-windows -F "#W:#I" | grep "' ..  termName .. '"') == ''

		if noTerm then

			local startCmd = string.gsub(startCmd, "%%dirname%%", vim.fn.expand("%:p:h"))
			vim.fn.system(string.format('tmux new-window -n "%s" "%s"', termName, startCmd))
		else
			vim.fn.system(string.format('tmux select-window -t "%s"', termName))
		end

	end
end

return {

	codeAction          = function()
		vim.lsp.buf.code_action {
			context = {
				only = {
					'quickfix',
					'refactor',
					'source'
				},
				diagnostics = {}
			}
		}
	end,

	fuzzySearchInBuffer = function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end,

	gitBlameLine        = function()
		gs.blame_line { full = false }
	end,

	start_debugger      = function()
		if (debuggerUIOpen == false) then
			dapui.open();
			debuggerUIOpen = true;
		end

		vim.cmd.DapContinue();
	end,

	stop_debugger       = function()
		if (debuggerUIOpen) then
			dapui.close();
			debuggerUIOpen = false;
		end

		vim.cmd.DapTerminate()
	end,

	debugger_evaluate   = function()
		dapui.eval();
	end,

	lspRestart          = function(pattern, lspnames)
		filetypeKeymap(pattern, {
			{
				'<leader>clr',
				'<cmd>LspRestart ' .. lspnames .. '<cr>',
				mode = 'n',
				desc = '[R]estart'
			}
		})
	end,

	filetypeKeymap      = filetypeKeymap,

	focusTerminalBuffer = focusTerminalBuffer,
	openTerminalPopup = openTerminalPopup

}
