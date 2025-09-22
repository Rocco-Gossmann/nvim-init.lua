return {
	'rose-pine/neovim',
	name = 'rose-pine',
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})

		vim.cmd 'colorscheme rose-pine'
		-- vim.cmd 'hi Whitespace guifg=#282828'
	end,
}


-- return  {
-- 	"polirritmico/monokai-nightasty.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("monokai-nightasty").setup({
-- 			dark_style_background = "transparent",
-- 			light_style_background = "transparent"
-- 		})
--
-- 		vim.cmd 'colorscheme monokai-nightasty'
-- 		-- vim.cmd 'hi Whitespace guifg=#606060'
-- 	end
--
-- }
