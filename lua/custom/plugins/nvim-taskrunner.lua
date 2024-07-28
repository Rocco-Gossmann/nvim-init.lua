local M = {
	"rocco-gossmann/nvim-taskrunner",
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
	init = function()

		require("nvim-taskrunner").setup({

			{
				label = "New Bookmark Comment",
				action = "o//78a=o BM: o78a=kA ",
			},

			{
				label = "Go return err nil",

				action = "oif err != nil {oreturn erro}o",
			},

			{
				label = "CPP: Create NEW C++ - .h + .cpp file combo",
				action = function()
					vim.ui.input({ prompt = "What's it called? " },
						function(classname)
							local tr = classname:gsub("^%s+", ""):gsub("%s+$", "");
							if #tr > 0 then
								local norm = tr:lower():gsub("%s+", "_")
								local up = norm:upper()

								vim.ui.input({
									prompt = "Where is it located? ",
									default = vim.fn.getcwd()
								}, function(loc)
									local trl = loc:gsub("^%s+", ""):gsub("%s+$", ""):gsub("/+$", "");

									-- TODO: Needs Path validation / creation

									if #trl > 0 then
										local hcmd = "i#ifndef " .. up .. "_Ho#define " .. up .. "_Ho#endif2OO";
										vim.cmd.tabnew(trl .. "/" .. norm .. ".h")
										vim.cmd.normal(hcmd .. "")

										local ccmd = "i#include \"./" .. norm .. ".h\"2o";
										vim.cmd.vs(trl .. "/" .. norm .. ".cpp")
										vim.cmd.normal(ccmd .. "")

										-- TODO: Needs Output, when invalid path is given
									end
								end)
							end
						end)
				end
			},

		});
	end,
};

return M;
