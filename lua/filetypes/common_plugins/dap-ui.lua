return function()

	print("loading dapui")

	vim.pack.add({
		"https://github.com/rcarriga/nvim-dap-ui",
		"https://github.com/nvim-neotest/nvim-nio",
		"https://github.com/mfussenegger/nvim-dap"
	})

	require("dapui").setup()

end
