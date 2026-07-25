local diagnostic = require "vim.diagnostic"
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
					floating_windows = true,      -- if true, images will be rendered in floating markdown windows
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
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {

			bullet = {
				enabled = true,
				render_modes = { "n", "c" },
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

			code = {
				-- Turn on / off code block & inline code rendering.
				enabled = true,
				-- Additional modes to render code blocks.
				render_modes = false,
				-- Turn on / off sign column related rendering.
				sign = true,
				-- Whether to conceal nodes at the top and bottom of code blocks.
				conceal_delimiters = true,
				-- Turn on / off language heading related rendering.
				language = true,
				-- Determines where language icon is rendered.
				-- | center | center of code block |
				-- | right  | right of code block  |
				-- | left   | left of code block   |
				position = 'left',
				-- Whether to include the language icon above code blocks.
				language_icon = true,
				-- Whether to include the language name above code blocks.
				language_name = true,
				-- Whether to include the language info above code blocks.
				language_info = true,
				-- Amount of padding to add around the language.
				-- If a float < 1 is provided it is treated as a percentage of available window space.
				language_pad = 1,
				-- A list of language names for which rendering will be disabled.
				disable = { "markdown" },
				-- A list of language names for which background highlighting will be disabled.
				-- Likely because that language has background highlights itself.
				-- Use a boolean to make behavior apply to all languages.
				-- Borders above & below blocks will continue to be rendered.
				disable_background = { 'diff' },
				-- Width of the code block background.
				-- | block | width of the code block  |
				-- | full  | full width of the window |
				width = 'block',
				-- Amount of margin to add to the left of code blocks.
				-- If a float < 1 is provided it is treated as a percentage of available window space.
				-- Margin available space is computed after accounting for padding.
				left_margin = 0,
				-- Amount of padding to add to the left of code blocks.
				-- If a float < 1 is provided it is treated as a percentage of available window space.
				left_pad = 2,
				-- Amount of padding to add to the right of code blocks when width is 'block'.
				-- If a float < 1 is provided it is treated as a percentage of available window space.
				right_pad = 2,
				-- Minimum width to use for code blocks when width is 'block'.
				min_width = 0,
				-- Determines how the top / bottom of code block are rendered.
				-- | none  | do not render a border                               |
				-- | thick | use the same highlight as the code body              |
				-- | thin  | when lines are empty overlay the above & below icons |
				-- | hide  | conceal lines unless language name or icon is added  |
				border = 'thin',
				-- Used above code blocks to fill remaining space around language.
				language_border = '█',
				-- Added to the left of language.
				language_left = '█',
				-- Added to the right of language.
				language_right = '',
				-- Used above code blocks for thin border.
				above = '▄',
				-- Used below code blocks for thin border.
				below = '▀',

				-- Turn on / off inline code related rendering.
				inline = false,
				-- Icon to add to the left of inline code.
				inline_left = '',
				-- Icon to add to the right of inline code.
				inline_right = '',
				-- Padding to add to the left & right of inline code.
				inline_pad = 0,
				-- Priority to assign to code background highlight.
				priority = 140,
				-- Highlight for code blocks.
				highlight = 'RenderMarkdownCode',
				-- Highlight for code info section, after the language.
				highlight_info = 'RenderMarkdownCodeInfo',
				-- Highlight for language, overrides icon provider value.
				highlight_language = nil,
				-- Highlight for border, use false to add no highlight.
				highlight_border = 'RenderMarkdownCodeBorder',
				-- Highlight for language, used if icon provider does not have a value.
				highlight_fallback = 'RenderMarkdownCodeFallback',
				-- Highlight for inline code.
				highlight_inline = 'RenderMarkdownCodeInline',
				-- Determines how code blocks & inline code are rendered.
				-- | none     | { enabled = false }                           |
				-- | normal   | { language = false }                          |
				-- | language | { disable_background = true, inline = false } |
				-- | full     | uses all default values                       |
				style = 'full',
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
			"ObsidianNewFromTemplate",
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
			disable_frontmatter = not vim.g.obsidianfrontmatter,
			new_notes_location = "notes_subdir",
			notes_subdir = vim.g.obsidiannewnotesdir,
			templates = {
				folder = vim.g.obsidiantemplatesdir,
				substitutions = {
					["clipboard"] = function()
						return vim.fn.getreg("+")
					end
				}
			},
			attachments = {
				img_folder = "./~attachments"
			},
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },

			ui = { enable = false },
			diagnostic = { enabled = false },

			workspaces = vim.g.obsidianworkspaces,

		},
	},

	{
		"3rd/diagram.nvim",
		dependencies = {
			{ "3rd/image.nvim" }, -- you'd probably want to configure image.nvim manually instead of doing this
		},
		opts = {                     -- you can just pass {}, defaults below
			events = {
				render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
				clear_buffer = { "BufLeave" },
			},
			renderer_options = {
				mermaid = {
					background = nil, -- nil | "transparent" | "white" | "#hex"
					theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
					scale = 1, -- nil | 1 (default) | 2  | 3 | ...
					width = nil, -- nil | 800 | 400 | ...
					height = nil, -- nil | 600 | 300 | ...
					cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
				},
				plantuml = {
					charset = nil,
					cli_args = nil, -- nil | { "-Djava.awt.headless=true" } | ...
				},
				d2 = {
					theme_id = nil,
					dark_theme_id = nil,
					scale = nil,
					layout = nil,
					sketch = nil,
					cli_args = nil, -- nil | { "--pad", "0" } | ...
				},
				gnuplot = {
					size = nil, -- nil | "800,600" | ...
					font = nil, -- nil | "Arial,12" | ...
					theme = nil, -- nil | "light" | "dark" | custom theme string
					cli_args = nil, -- nil | { "-p" } | { "-c", "config.plt" } | ...
				},
			}
		},
	},

}
