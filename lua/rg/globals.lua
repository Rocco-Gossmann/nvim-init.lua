vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.g.zig_fmt_autosave = 0
vim.g.tmux_navigator_no_mappings = 1

vim.g.obsidiantemplatesdir = nil
vim.g.obsidiannewnotesdir = "./"
vim.g.obsidianfrontmatter = false
vim.g.obsidianworkspaces = {
	{
		name = "current Project",
		path = "."
	}
}

vim.g.opencodestartcommand = "lsof -ti :8099 | xargs kill -9 ; opencode --port 8099 ; exit"
