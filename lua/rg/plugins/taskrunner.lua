local function createFileInFolder(folder, filename)
	return function()
		local fullPath = folder .. "/" .. filename

		if vim.fn.findfile(fullPath) ~= "" then
			vim.cmd.tabnew(fullPath)

		else
			if vim.fn.finddir(folder) == "" then
				vim.fn.mkdir(folder)
			end

			vim.cmd.tabnew()
			require("rg.env").readTemplate(filename .. ".tpl")
			vim.cmd("w " .. fullPath)

		end
	end
end

return {

	"rocco-gossmann/nvim-taskrunner",

	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

	init = function()
		local tasks = require("rg.env").doFileIfExists("./.nvim/tasks.lua")

		if tasks == nil or not tasks then
			tasks = {
				{
					label = "add a .nvim/tasks.lua in your project",
					action = createFileInFolder("./.nvim", "tasks.lua"),
				},
			}
		end

		if vim.fn.finddir("vscode-php-debug") == "" then

			table.insert(tasks, {
				label = "install PHP-Debug-Adapter",
				action = function()
					vim.cmd("!" .. require("rg.env").confdir .. "/install-php-dap.sh");
				end
			})

		end


		table.insert(tasks, {
			label = "create .vscode/launch.json for PHP",
			action = createFileInFolder("./.vscode", "launch.json"),
		})

		require("nvim-taskrunner").setup(tasks)
	end,
}
