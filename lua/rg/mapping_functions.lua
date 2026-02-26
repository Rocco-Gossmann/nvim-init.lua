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

local function focusTerminalBuffer(termName, startCmd)
	return function()
		-- if a tab with this name is open, then focus that
		for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
			local win = vim.api.nvim_tabpage_get_win(tab)
			local buf = vim.api.nvim_win_get_buf(win)
			local name = vim.api.nvim_buf_get_name(buf)
			if name:match(termName) then
				vim.api.nvim_set_current_tabpage(tab)
				vim.fn.feedkeys("i", "i")
				return;
			end
		end

		-- if a buffer with this name already exists => create a new tab using it
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			local bufname = vim.api.nvim_buf_get_name(buf)
			if bufname:match(termName) then
				vim.cmd.tabnew()
				vim.api.nvim_win_set_buf(0, buf)
				vim.fn.feedkeys("i", "i")
				return
			end
		end

		-- if neither buffer nor tab already exist => create new tab, with new Terminal

		vim.cmd.tabnew("term://" .. startCmd);
		vim.defer_fn(function()
			vim.cmd("file " .. termName);
			vim.fn.feedkeys("i", "i")
		end, 100)
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
				desc = '[C]ode [L]sp [R]estart'
			}
		})
	end,

	filetypeKeymap      = filetypeKeymap,

	focusTerminalBuffer = focusTerminalBuffer

}
