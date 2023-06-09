return function(wk)

    local harpoonmark = require('harpoon.mark')
    local harpoonui = require('harpoon.ui')
    local tele = require('telescope.builtin')
    local cmp = require('cmp')

    wk.register({
    --[[============================================================================
    -- File Closing
    --============================================================================]]
        ['Z'] = {
            ['Z'] = { ":wq<cr>", "safe close current buffers" },
            ['W'] = { ":wa<cr>:qa<cr>", "safe close all buffers" },
            ['Q'] = { ":q!<cr>", "force close current buffer" },
            ['X'] = { ":qa!<cr>", "foce close all buffers" }
        },

        ['<leader>'] = {

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

        ['<C-n>'] = { ":NvimTreeToggle<CR>", "Explorer (NvimTree)" },
        ['<M-n>'] = { "<ESC>", "Escape" },

        ["J"] = { "mzJ`z", "Keep Cursor on Join Line" },

        ["<C-d>"] = { "<C-d>zz", "Keep Cursor centered when jumping down" },
        ["<C-u>"] = { "<C-u>zz", "Keep Cursor centered when jumping up" },

        ["n"] = { "nzz", "Keep Cursor centered when searching down" },
        ["N"] = { "Nzz", "Keep Cursor centered when searching up" },


    --[[============================================================================
    -- TagBar
    --============================================================================]]
        ['<C-t>'] = { vim.cmd.TagbarToggle, "Open Tagbar" },
        ['{'] = { vim.cmd.TagbarJumpPrev, "Tagbar: Jump Prev" },
        ['}'] = { vim.cmd.TagbarJumpNext, "Tagbar: Jump Next" },

    --[[============================================================================
    -- Telescope
    --============================================================================]]
        ['<C-f>'] = {
            name = "Find (Telescope)",
            ['<C-f>'] = { tele.find_files, "Find Files" },
            ['<C-d>'] = { function() vim.cmd[[ Telescope find_files search_dirs=['%:h'] ]] end, "Find Files in current Dir" },
            ['<C-g>'] = { tele.git_files, "Find Git Files" },
            ['<C-s>'] = { tele.live_grep, "Find Files with String" },
            ['<C-b>'] = { tele.buffers, "Find Buffer" },
            ['<C-h>'] = { tele.help_tags, "Find Help Tags" },
            ['<C-k>'] = { tele.keymaps, "Find Help Tags" },
            ['<C-u>'] = { tele.keymaps, "Usage of String" },
            ['<C-n>'] = { tele.resume, "Continue last search" }
        },

    --[[============================================================================
    -- Harpoone
    --============================================================================]]
        ["<leader>h"] = {
            name = "Harpoone",
            M = { function() harpoonmark.add_file() end, "Add file to Harpoone" },
            H = { function() harpoonmark.set_current_at(1) end, "Set file at 1" },
            J = { function() harpoonmark.set_current_at(2) end, "Set file at 2" },
            K = { function() harpoonmark.set_current_at(3) end, "Set file at 3" },
            L = { function() harpoonmark.set_current_at(4) end, "Set file at 4" },

            m = { function() harpoonui.toggle_quick_menu(4) end, "show harpoon menu" },
            h = { function() harpoonui.nav_file(1) end, "Load harpoon 1" },
            j = { function() harpoonui.nav_file(2) end, "Load harpoon 2" },
            k = { function() harpoonui.nav_file(3) end, "Load harpoon 3" },
            l = { function() harpoonui.nav_file(4) end, "Load harpoon 4" },
        },

    --[[============================================================================
    -- LSP
    --============================================================================]]
        ['gd'] = { function() vim.lsp.buf.definition() end, 'Goto Definition' },
        ['<C-h>'] = { function() vim.lsp.buf.hover({ reason = cmp.ContextReason.Auto }) end, "Show Hover" },
        ['[d'] = { function() vim.diagnostic.goto_next() end, 'Goto Next' },
        [']d'] = { function() vim.diagnostic.goto_prev() end, 'Goto Prev' },
    }, { mode = "n" })

    wk.register({
        ['<leader>y'] = { '"+y', "Yank to System Clipboard" },

        ["<leader>cr"] = { ":s/\\%V//gI<Left><Left><Left><Left>", "replace inside selected text" },

        ["J"] = { ":m '>+1<CR>gv=gv", "Move selected Line Down " },
        ["K"] = { ":m '<-2<CR>gv=gv", "Move selected Line Up " },

        [" "] = { 'c  <ESC>hmzplv`z', "Surround in space" },
        ["."] = { 'c..<ESC>hmzplv`z', "Surround in dot" },
        ["\""] = { 'c""<ESC>hmzplv`z', "Surround in quotes" },
        ["'"]  = { "c''<ESC>hmzplv`z", "Surround in single quotes" },
        ["("]  = { "c()<ESC>hmzplv`z", "Surround in braces" },
        ["["]  = { "c[]<ESC>hmzplv`z", "Surround in brackets" },
        ["{"]  = { "c{}<ESC>hmzplv`z", "Surround in squerlies" },
        ["/"]  = { "c/**/<ESC>hhhmzlpllv`z", "Surround in comment" },
    }, { mode = "v" })

    wk.register({
        ['<leader>p'] = { '"_dP', "Paste without replacing the clipboard" },
    }, { mode = "x" })

    wk.register({
        ['<C-u>'] = { function() vim.lsp.buf.completion({ reason = cmp.ContextReason.Auto }) end, "Code complete" },
        ['<C-h>'] = { function() vim.lsp.buf.signature_help() end, "Signature Help" }
    }, { mode = "i" })

end
