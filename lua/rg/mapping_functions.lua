local telescope_builtin = require('telescope.builtin');
local gs = package.loaded.gitsigns
local dapui = require("dapui");

local debuggerUIOpen = false

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

    start_debugger    = function()
        if (debuggerUIOpen == false) then
            dapui.open();
            debuggerUIOpen = true;
        end

        vim.cmd.DapContinue();
    end,

    stop_debugger     = function()
        if (debuggerUIOpen) then
            dapui.close();
            debuggerUIOpen = false;
        end

        vim.cmd.DapTerminate()
    end,

    debugger_evaluate = function()
        dapui.eval();
    end,

    tmuxLazyGit       = "<cmd>!tmux display-popup -w90\\% -h95\\% -E \'lazygit\'<cr>",
    tmuxLazyDocker    = "<cmd>!tmux display-popup -w90\\% -h95\\% -E \'lazydocker\'<cr>",
    tmuxLazySQL       = "<cmd>!tmux display-popup -w90\\% -h95\\% -E \'lazysql\'<cr>",

	lspRestart = function(pattern, lspnames)

		vim.api.nvim_create_autocmd("BufEnter", { 
			pattern = pattern,
			callback = function()
				vim.keymap.set({ 'n' }, '<leader>clr', '<cmd>LspRestart '..lspnames..'<cr>', { desc = '[C]ode [L]sp [R]estart' });
			end
		})

	end


}
