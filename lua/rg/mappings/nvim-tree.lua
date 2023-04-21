vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- put some default mappings here
    
    
    
    -- user mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', '<leader><CR>', api.tree.change_root_to_node, opts('CD'))
end

require("nvim-tree").setup({
    on_attach = my_on_attach,
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<cr>' , {})

