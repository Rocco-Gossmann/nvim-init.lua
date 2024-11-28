local M = {
	"rocco-gossmann/nvim-taskrunner",
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
	init = function()

		require("nvim-taskrunner").setup( require("rg.custom.tasks") )

	end,
};

return M;
