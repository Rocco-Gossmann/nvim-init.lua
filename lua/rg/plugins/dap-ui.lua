-- [[==========================================================================
-- Debug-Adapter-Protocoll
-- ==========================================================================]]
return {

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { 'nvim-neotest/nvim-nio', 'mfussenegger/nvim-dap' },
		opts = {
			layouts = {
				{
					elements = {
						{ id = "scopes",      size = 0.35},
						{ id = "stacks",      size = 0.35},
						{ id = "watches",     size = 0.10},
						{ id = "breakpoints", size = 0.20},
					},
					position = "left",
					size = 60,
				},
				{
					elements = {
						{ id = "repl",    size = 1.0},
					},
					position = "bottom",
					size = 15,
				}
			}
		}
	}

}
