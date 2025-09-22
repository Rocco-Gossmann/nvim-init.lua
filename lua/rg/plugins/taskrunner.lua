local confPath = require("rg.env").confdir

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
			vim.cmd.normal("ggdd")
			vim.cmd("w " .. fullPath)
		end
	end
end

return {

	"rocco-gossmann/nvim-taskrunner",

	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

	init = function()

		local tasks = require("rg.env").doFileIfExists("./.nvim/tasks.lua") or {}

		if type(tasks) ~= "table" then
			tasks = {}
		end

		if vim.fn.finddir(confPath .. "/lua/rg/dap/vscode-php-debug") == "" then
			table.insert(tasks, {
				label = "install PHP-Debug-Adapter",
				action = function()
					vim.cmd("cd " .. confPath)
					vim.cmd("!" .. confPath .. "/install-php-dap.sh")
				end,
			})
		end

		table.insert(tasks, {
			label = "create / open .nvim/tasks.lua",
			action = createFileInFolder("./.nvim", "tasks.lua"),
		})

		table.insert(tasks, {
			label = "create / open .vscode/launch.json",
			action = createFileInFolder("./.vscode", "launch.json"),
		})

		require("nvim-taskrunner").setup(tasks)
	end,
}
