vim.pack.add({
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
})

vim.g.db_ui_use_nerd_fonts = 1




-- [[==========================================================================
-- Database UI
-- ==========================================================================]]
return {
	-- dependencies = {
	--
	-- 	{ ,                     lazy = true },
	--
	-- 	{ , ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
	--
	-- 	{  },
	--
	-- },
	--
	-- cmd = {
	-- 	'DBUI',
	-- 	'DBUIToggle',
	-- 	'DBUIAddConnection',
	-- 	'DBUIFindBuffer',
	-- },
	--
	-- init = function()
	--	vim.g.db_ui_use_nerd_fonts = 1
	-- end,
	--
}
