require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    transparent_background = true,
})

vim.cmd.colorscheme("catppuccin")

--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "black" })
--
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
-- this is a comment just to test the following line
vim.api.nvim_set_hl(0, "Comment", {bg = "none", fg="#a0a0a0"})


