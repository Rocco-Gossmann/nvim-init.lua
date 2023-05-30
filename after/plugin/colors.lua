--==============================================================================
-- catppuccin
--==============================================================================
--require("catppuccin").setup({
--    flavour = "macchiato", -- latte, frappe, macchiato, mocha
--    transparent_background = true,
--})
--vim.cmd.colorscheme("catppuccin")
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

--==============================================================================
-- Tokyonight
--==============================================================================
require("tokyonight").setup({
    transparent = true,
    styles = {
        comments = { italic=true },

        on_highlights = function(h, c)

            print(h .. " - " .. c);
        end
    }
})
vim.api.nvim_set_hl(0, "@keyword", { bg = "none", fg="pink" })
vim.api.nvim_set_hl(0, "Folded", {bg = "none", fg="#7faaf7" })
vim.api.nvim_set_hl(0, "Comment", {bg = "none", fg="#a0a0a0"})
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#131313" })
vim.api.nvim_set_hl(0, "CursorLine", {bg = "#131313"})
--==============================================================================
-- Common Stuff
--==============================================================================

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#131313" })
vim.api.nvim_set_hl(0, "Pmenu", {bg = "#131313" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

-- this is a comment just to test the following line
vim.api.nvim_set_hl(0, "Comment", {bg = "none", fg="#a0a0a0"})
vim.api.nvim_set_hl(0, "LineNr", {bg = "#333333", fg="#a0a0a0"})
