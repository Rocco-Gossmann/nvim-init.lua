return function(wk)
    --[[============================================================================
    -- Generic
    --============================================================================]]
    wk.register({
        q = {
            name = "Quit",
            q = { ":q<cr>", "buffer" },
            a = { ":qa<cr>", "all buffers" }
        },
        Q = {
            name = "Force quit",
            Q = { ":q!<cr>", "buffer" },
            A = { ":qa!<cr>", "all buffers" }
        },
        w = {
            name = "Write/Save",
            w = { ":w<cr>", "buffer" },
            a = { ":wa<cr>", "all buffers" }
        },
        W = {
            name = "Overwrite/Forcew Save",
            W = { ":w!<cr>", "buffer" },
            A = { ":wa!<cr>", "all buffers" }
        },

        ["gt"] = { vim.cmd.LazyGit, "Open Git" },

        y = { '"+yy', "Yank to System Clipboard" },

    }, {
        mode = "n",
        prefix = "<leader>"
    })

    wk.register({
        ['<C-f>'] = { ":Vex<CR>", "Explorer (new column)" },
    }, { mode = "n" })

    wk.register({
        ['<leader>y'] = { '"+y', "Yank to System Clipboard" }
    }, { mode = "v" })

    wk.register({
        ['<leader>p'] = { '"_dP', "Paste without replacing the clipboard" }
    }, { mode = "x" })

    --[[============================================================================
    -- Harpoon
    --============================================================================]]
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    wk.register({
        h     = {
            name = "Harpoone",
            m = { function() mark.add_file() end, "Add file to Harpoone" },
            h = { function() ui.toggle_quick_menu() end, "View/Edit harpooned files" },
        },

        ['1'] = { function() ui.nav_file(1) end, "Load harpoon 1" },
        ['2'] = { function() ui.nav_file(2) end, "Load harpoon 2" },
        ['3'] = { function() ui.nav_file(3) end, "Load harpoon 3" },
        ['4'] = { function() ui.nav_file(4) end, "Load harpoon 4" },
        ['5'] = { function() ui.nav_file(5) end, "Load harpoon 5" },
        ['6'] = { function() ui.nav_file(6) end, "Load harpoon 6" },
        ['7'] = { function() ui.nav_file(7) end, "Load harpoon 7" },
        ['8'] = { function() ui.nav_file(8) end, "Load harpoon 8" },
        ['9'] = { function() ui.nav_file(9) end, "Load harpoon 9" },
    }, {
        mode = "n",
        prefix = "<leader>"
    })

    --[[============================================================================
    -- LSP
    --============================================================================]]
    wk.register({
        ['gd'] = { function() vim.lsp.buf.definition() end, 'Goto Definition' },
        ['K'] = { function() vim.lsp.buf.hover() end, 'Show Hover' },
        ['<leader>vws'] = { function() vim.lsp.buf.workspace_symbol() end, 'Workspace Symbol' },
        ['<leader>vd'] = { function() vim.diagnostic.open_float() end, 'Show Error in Flaot' },
        ['[d'] = { function() vim.diagnostic.goto_next() end, 'Goto Next' },
        [']d'] = { function() vim.diagnostic.goto_prev() end, 'Goto Prev' },
        ['<leader>vca'] = { function() vim.lsp.buf.code_action() end, 'Code Action' },
        ['<leader>vrr'] = { function() vim.lsp.buf.references() end, 'List References' },
        ['<leader>vrn'] = { function() vim.lsp.buf.rename() end, 'Rename' },
        ['<leader>vff'] = { function() vim.lsp.buf.format() end, 'Format' },
    }, { mode = "n" })

    local cmp = require('cmp')
    wk.register({
        ['<C-h>'] = { function() vim.lsp.buf.completion({ reason = cmp.ContextReason.Auto }) end, "Code complete" }
    }, { mode = "i" })

    --[[============================================================================
    -- Telescope
    --============================================================================]]
    local tele = require('telescope.builtin')

    wk.register({
        f = {
            name = "Find",
            f = { tele.find_files, "Find Files" },
            g = { tele.git_files, "Find Git Files" },
            s = { tele.live_grep, "Find Files with String" },
            b = { tele.buffers, "Find Buffer" },
            h = { tele.help_tags, "Find Help Tags" },
            k = { tele.keymaps, "Find Help Tags" },
            u = { tele.keymaps, "Usage of String" },
            c = { tele.resume, "Continue last search" }
        }
    }, {
        mode = "n",
        prefix = "<leader>"
    })
end
