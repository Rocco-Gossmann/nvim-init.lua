return function(wk)

    local harpoonmark = require('harpoon.mark')
    local harpoonui = require('harpoon.ui')
    local tele = require('telescope.builtin')
    local cmp = require('cmp')

    wk.register({
        ['<leader>'] = {
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

            ["cr"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "replace word under cursor for document" },


            v = {
                name = "LSP",
                ['ws'] = { function() vim.lsp.buf.workspace_symbol() end, 'Workspace Symbol' },
                ['d'] = { function() vim.diagnostic.open_float() end, 'Show Error in Flaot' },
                ['ca'] = { function() vim.lsp.buf.code_action() end, 'Code Action' },
                ['rr'] = { function() vim.lsp.buf.references() end, 'List References' },
                ['rn'] = { function() vim.lsp.buf.rename() end, 'Rename' },
                ['ff'] = { function() vim.lsp.buf.format() end, 'Format' },
            }
        },

        ['<C-n>'] = { ":RangerCurrentDirectory<CR>", "Explorer (Ranger)" },

        ["J"] = { "mzJ`z", "Keep Cursor on Join Line" },

        ["<C-d>"] = { "<C-d>zz", "Keep Cursor centered when jumping down" },
        ["<C-u>"] = { "<C-u>zz", "Keep Cursor centered when jumping up" },

        ["n"] = { "nzz", "Keep Cursor centered when searching down" },
        ["N"] = { "Nzz", "Keep Cursor centered when searching up" },

    --[[============================================================================
    -- Telescope
    --============================================================================]]
        ['<C-f>'] = {
            name = "Find (Telescope)",
            ['<C-f>'] = { tele.find_files, "Find Files" },
            ['<C-g>'] = { tele.git_files, "Find Git Files" },
            ['<C-s>'] = { tele.live_grep, "Find Files with String" },
            ['<C-b>'] = { tele.buffers, "Find Buffer" },
            ['<C-h>'] = { tele.help_tags, "Find Help Tags" },
            ['<C-k>'] = { tele.keymaps, "Find Help Tags" },
            ['<C-u>'] = { tele.keymaps, "Usage of String" },
            ['<C-c>'] = { tele.resume, "Continue last search" }
        },

    --[[============================================================================
    -- Harpoone
    --============================================================================]]
        ["<leader>h"] = {
            name = "Harpoone",
            m = { function() harpoonmark.add_file() end, "Add file to Harpoone" },
            h = { function() harpoonmark.set_current_at(1) end, "Set file at 1" },
            j = { function() harpoonmark.set_current_at(2) end, "Set file at 2" },
            k = { function() harpoonmark.set_current_at(3) end, "Set file at 3" },
            l = { function() harpoonmark.set_current_at(4) end, "Set file at 4" },
        },
        ['<c-h>'] = { function() harpoonui.nav_file(1) end, "Load harpoon 1" },
        ['<c-j>'] = { function() harpoonui.nav_file(2) end, "Load harpoon 2" },
        ['<c-k>'] = { function() harpoonui.nav_file(3) end, "Load harpoon 3" },
        ['<c-l>'] = { function() harpoonui.nav_file(4) end, "Load harpoon 4" },
        ['<c-m>'] = { function() harpoonui.toggle_quick_menu(4) end, "Load harpoon 4" },

    --[[============================================================================
    -- LSP
    --============================================================================]]
        ['gd'] = { function() vim.lsp.buf.definition() end, 'Goto Definition' },
        ['K'] = { function() vim.lsp.buf.hover() end, 'Show Hover' },
        ['[d'] = { function() vim.diagnostic.goto_next() end, 'Goto Next' },
        [']d'] = { function() vim.diagnostic.goto_prev() end, 'Goto Prev' },

    }, { mode = "n" })

    wk.register({
        ['<leader>y'] = { '"+y', "Yank to System Clipboard" },

        ["<leader>cr"] = { ":s/\\%V//gI<Left><Left><Left><Left>", "replace inside selected text" },

        ["J"] = { ":m '>+1<CR>gv=gv", "Move selected Line Down " },
        ["K"] = { ":m '<-2<CR>gv=gv", "Move selected Line Up " },

    }, { mode = "v" })

    wk.register({
        ['<leader>p'] = { '"_dP', "Paste without replacing the clipboard" },
    }, { mode = "x" })

    
    wk.register({
        ['<C-Space>'] = { function() vim.lsp.buf.completion({ reason = cmp.ContextReason.Auto }) end, "Code complete" }
    }, { mode = "i" })

end
