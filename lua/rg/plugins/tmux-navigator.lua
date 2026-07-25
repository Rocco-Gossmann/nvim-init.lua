return {
	-- unifys switching between NeoVim Splits and TMUX-Panes
	-- (Press C-H/J/K/L to move between them)
	'christoomey/vim-tmux-navigator',

	cond = function()
		return vim.env.TMUX_PANE ~= nil
	end,

}
