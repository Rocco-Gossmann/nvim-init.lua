-- [[==========================================================================
-- Everything related to NeoVims UI
-- ==========================================================================]]
--
return {
	-- File-Explorer with Tree View  (<leader>n to open)
	'preservim/nerdtree',

	-- unifys switching between NeoVim Splits and TMUX-Panes
	-- (Press C-H/J/K/L to move between them)
	'christoomey/vim-tmux-navigator',

	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
				width = 196
			}
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
		  require('neoscroll').setup({
			-- All these animations will be run at the same time
			easing_function = "circular", -- Default easing function
			-- Can be any of the following: "quadratic", "cubic", "quartic", "quintic", "exponential", "sine", "circular", "back"
			hide_cursor = false,          -- Hide cursor while scrolling
			stop_eof = true,              -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = true,     -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true,  -- The cursor will keep on scrolling even if the window cannot scroll further
			easing = "circular",
			scroll_duration = 100,        -- Time it takes to scroll (in milliseconds) - reduced for snappier feel
			pre_hook = nil,               -- Function to run before the scrolling animation starts
			post_hook = nil,              -- Function to run after the scrolling animation ends
			performance_mode = false,     -- Disable "Performance Mode" on all buffers.
		  })

		  -- Key mappings for smooth scrolling
		  local keymap = {
			["<C-u>"] = function() require('neoscroll').ctrl_u({ duration = 150 }) end,
			["<C-d>"] = function() require('neoscroll').ctrl_d({ duration = 150 }) end,
			["<C-b>"] = function() require('neoscroll').ctrl_b({ duration = 150 }) end,
			["<C-f>"] = function() require('neoscroll').ctrl_f({ duration = 150 }) end,
			["<C-y>"] = function() require('neoscroll').scroll(-0.1, { move_cursor = false, duration = 100 }) end,
			["<C-e>"] = function() require('neoscroll').scroll(0.1, { move_cursor = false, duration = 100 }) end,
			-- ["zt"]    = function() require('neoscroll').zt({ duration = 150 }) end,
			-- ["zz"]    = function() require('neoscroll').zz({ duration = 150 }) end,
			-- ["zb"]    = function() require('neoscroll').zb({ duration = 150 }) end,
		  }

		  for key, func in pairs(keymap) do
			vim.keymap.set({ 'n', 'x' }, key, func)
		  end
		end
	  }
		-- {
		-- 	"folke/twilight.nvim",
		-- 	opts = {
		-- 		-- your configuration comes here
		-- 		-- or leave it empty to use the default settings
		-- 		-- refer to the configuration section below
		-- 	},
		-- },

	}
