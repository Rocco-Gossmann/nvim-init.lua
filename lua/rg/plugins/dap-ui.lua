-- [[==========================================================================
-- Debug-Adapter-Protocoll
-- ==========================================================================]]
return {
	"rcarriga/nvim-dap-ui",
	dependencies = { 'nvim-neotest/nvim-nio', 'mfussenegger/nvim-dap' },
	config = function ()
		require("dapui").setup()
	end
}

