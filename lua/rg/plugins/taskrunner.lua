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

local function alignSeparator(separator)
	return function()
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		local aligned = require("mini.align").align_strings(lines, { split_pattern = separator })
		vim.api.nvim_buf_set_lines(0, 0, -1, false, aligned)
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
		label = "create / open .nvim/postinit.lua",
		action = createFileInFolder("./.nvim", "postinit.lua"),
	})

	table.insert(tasks, {
		label = "create / open .nvim/preinit.lua",
		action = createFileInFolder("./.nvim", "preinit.lua"),
	})

	table.insert(tasks, {
		label = "create / open .vscode/launch.json",
		action = createFileInFolder("./.vscode", "launch.json"),
	})

	table.insert(tasks, {
		label = "move function parameters to separate lines",
		action = function()
			vim.cmd("normal cib\r\rkp0v$")
			vim.cmd("stopinsert")
			vim.cmd("s/,/&\\r/g")
			vim.cmd("normal =")
		end,
	})

	table.insert(tasks, {
		label = "Restart TaskRunner",
		action = function()
			vim.api.nvim_del_user_command("TR")
			restartTaskRunner()
		end,
	})

	if vim.bo.filetype == "php" then
		table.insert(tasks, {
			label = "Align Array",
			action = alignSeparator("=>")
		})

		table.insert(tasks, {
			label = "Align comments",
			action = alignSeparator("//")
		})
	end

	if vim.bo.filetype == "markdown" then
		table.insert(tasks, {
			label = "Edit 'Peek' Window-CSS",
			action = function()

				vim.cmd.tabnew(require("rg.env").home .. "/.local/share/nvim/lazy/peek.nvim/public/style.css");

			end
		})
	end

	require("nvim-taskrunner").setup(tasks)
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = restartTaskRunner,
})

return {

	"rocco-gossmann/nvim-taskrunner",

	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

	init = restartTaskRunner,
}
