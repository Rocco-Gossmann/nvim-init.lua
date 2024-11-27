local telescope_builtin = require('telescope.builtin');
local gs = package.loaded.gitsigns
local dapui = require("dapui");
local dap = require("dap");

local debuggerRunning = false

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

    tmuxMakeRun         = "<cmd>!tmux split-window -v -p25 \'make run ; read\'<cr>",

    start_stop_debugger = function()
        if (debuggerRunning) then
            dapui.close(); vim.cmd.DapTerminate()
            debuggerRunning = false
        else
            vim.inspect(dap);
            dapui.open();
            vim.cmd.DapContinue();
            debuggerRunning = true;
        end
    end,

    debugger_evaluate = function()
        dapui.eval();
    end,

    tmuxLazyGit= "<cmd>!tmux new-window \'lazygit\'<cr>",

}
