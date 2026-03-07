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

		local noTerm = vim.fn.system('tmux list-windows -F "#W:#I" | grep "' ..  termName .. '"') == ''

		if noTerm then
			vim.fn.system(string.format('tmux new-window -n "%s" "%s"', termName, termName, startCmd))
		else
			vim.fn.system(string.format('tmux select-window -t "%s"', termName))
		end

	end
end


local function focusDBTab()

  local dbTab = nil

  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do

      local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if name:lower():find('dbui', 1, true) then
        dbTab = tab
        break
      end

    end

    if dbTab then break end

  end

  if dbTab then

    vim.api.nvim_set_current_tabpage(dbTab)

  else

    vim.cmd('tabnew')
    vim.cmd('DBUI')

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

	focusTerminalBuffer = focusTerminalBuffer,

	focusDBTab = focusDBTab

}
