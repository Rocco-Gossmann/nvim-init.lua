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

local function restartTaskRunner()

		local tasks = require("rg.env").doFileIfExists("./.nvim/tasks.lua")

		if type(tasks) ~= "table" then
			tasks = {}
		end

		table.insert(tasks, {
			label = "create / open .nvim/tasks.lua",
			action = createFileInFolder("./.nvim", "tasks.lua"),
		})

		table.insert(tasks, {
			label = "create / open .nvim/init.lua",
			action = createFileInFolder("./.nvim", "init.lua"),
		})

		table.insert(tasks, {
			label = "create / open .vscode/launch.json",
			action = createFileInFolder("./.vscode", "launch.json"),
		})

		table.insert(tasks, {
			label = "move function parameters to separate lines",
			action = function()

				vim.cmd('normal cib\r\rkp0v$')
				vim.cmd("stopinsert")
				vim.cmd("s/,/&\\r/g");
				vim.cmd('normal =')

			end
		})

		table.insert(tasks, {
			label = "Restart TaskRunner",
			action = function()

				vim.api.nvim_del_user_command("TR")
				restartTaskRunner()

			end
		})

		require("nvim-taskrunner").setup(tasks)

end

return {

	"rocco-gossmann/nvim-taskrunner",

	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

	init = restartTaskRunner

}
