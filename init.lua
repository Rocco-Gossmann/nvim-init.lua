require "rg.globals"
require "rg.opts"

require "rg.plugins.lazy"

require "rg.dap"

require "rg.mappings"
require "rg.filetypes"
require "rg.tweaks"

require("rg.env").doFileIfExists("./.nvim/init.lua");

if vim.g.neovide then

	vim.api.nvim_set_current_dir(vim.env.PWD)

	vim.g.neovide_scale_factor = 1.0
	vim.o.guifont="JetBrainsMono Nerd Font Mono:h16"

	vim.g.neovide_opacity = 0.85
	vim.g.neovide_window_blurred = true

	vim.g.neovide_input_macos_option_key_is_meta = true

end
