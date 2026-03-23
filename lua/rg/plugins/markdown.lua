return {

	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		ft = { "markdown" },
		opts = {
			processor = "magick_cli",
			tmux_show_only_in_active_window = true,
			max_width = 4320,
			max_height = 30720,
			max_width_window_percentage = 90,
			max_height_window_percentage = 90, -- default 50
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = true,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "inline", -- or "inline"
					floating_windows = true,     -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				html = {
					enabled = true,
					clear_in_insert_mode = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup", -- or "inline"
				},
				css = {
					enabled = true,
					clear_in_insert_mode = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup", -- or "inline"
				}
			}

		}
	},

	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},

	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {

			bullet = {
				enabled = true,
				render_modes = false,
				icons = { '●', '○', '◆', '◇' },
				ordered_icons = function(ctx)
					local value = vim.trim(ctx.value)
					local index = tonumber(value:sub(1, #value - 1))
					return ('%d.'):format(index > 1 and index or ctx.index)
				end,
				left_pad = 1,
				right_pad = 0,
				highlight = 'RenderMarkdownBullet',
				scope_highlight = {},
				scope_priority = nil,
			},

		},
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		cmd = {
			"ObsidianSearch",
			"ObsidianQuickSwitch",
			"ObsidianWorkspace",
			"ObsidianTags",
			"ObsidianPasteImg",
			"ObsidianTOC"
		},


		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			preferred_link_style = "markdown",
			disable_frontmatter = true,
			attachments = {
				img_folder = "./~attachments"
			},
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },

			ui = { enable = false },

			workspaces = vim.g.obsidianworkspaces,

		},
	},

	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			default = {
				-- file and directory options
				dir_path = "./~attachments", ---@type string | fun(): string
				extension = "png", ---@type string | fun(): string
				file_name = "%Y-%m-%d-%H-%M-%S", ---@type string | fun(): string
				use_absolute_path = false, ---@type boolean | fun(): boolean
				relative_to_current_file = true, ---@type boolean | fun(): boolean
				prompt_for_file_name = false
			},

			filetypes = {
				markdown = {
					url_encode_path = true, ---@type boolean | fun(): boolean
					template = "![$CURSOR](./$FILE_PATH)", ---@type string | fun(context: table): string
					download_images = true, ---@type boolean | fun(): boolean
				}
			}

		},
		keys = {
			-- suggested keymap
			-- { "<leader>oii", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	}

}
