return function (command, moduleName)

	vim.api.nvim_create_user_command(command, function()

		require(moduleName)

		vim.wait(1000, function()
			vim.schedule(function()
				vim.cmd(command)
			end)
			return true
		end)

	end, {})

end
