local telescope_builtin = require('telescope.builtin');
local gs = package.loaded.gitsigns

return {

    codeAction = function()
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

    gitBlameLine = function()
        gs.blame_line { full = false }
    end,

    tmuxMakeRun  = "<cmd>!tmux split-pane -h \'make run ; read\'<cr>",

}
