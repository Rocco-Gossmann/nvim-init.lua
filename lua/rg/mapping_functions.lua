local telescope_builtin = require('telescope.builtin');
local gs = package.loaded.gitsigns
local dapui = require("dapui");

local debuggerUIOpen = false

local function filetypeKeymap(pattern, maps)
	vim.api.nvim_create_autocmd("BufAdd", {
		pattern = pattern,
		callback = function(args)
			local newMaps = {}

			for _, v in pairs(maps) do
				v.buffer = args.buf
				table.insert(newMaps, v)
			end

			require("which-key").add(newMaps)
		end
	})
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

	tmuxMakeRun         = "<cmd>!tmux split-window -v -p25 \'make run\'<cr>",
	tmuxMakeDev         = "<cmd>!tmux new-window -d \'make dev\'<cr>",

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

	tmuxLazyGit         = "<cmd>!tmux new-window \'lazygit\'<cr>",
	tmuxLazyDocker      = "<cmd>!tmux new-window \'lazydocker\'<cr>",
	tmuxLazySQL         = "<cmd>!tmux new-window \'lazysql\'<cr>",
	tmuxRanger          = "<cmd>!tmux new-window \'ranger\'<cr>",

	lspRestart          = function(pattern, lspnames)
		filetypeKeymap(pattern, {
			{
				'<leader>clr',
				'<cmd>LspRestart ' .. lspnames .. '<cr>',
				mode = 'n',
				desc = '[C]ode [L]sp [R]estart'
			}
		})
	end,

	filetypeKeymap      = filetypeKeymap,
}
