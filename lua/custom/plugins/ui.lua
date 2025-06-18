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
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"folke/noice.nvim",
		lazy=false,
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
		config = function()
			-- require("notify").setup({
			-- 	background_colour = "#000000";
			-- 	merge_duplicates = true
			-- })

			require("noice").setup({
			  lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
				  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				  ["vim.lsp.util.stylize_markdown"] = true,
				  ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			  },
			  -- you can enable a preset for easier configuration
			  presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			  },
			})

		end
	}

}
