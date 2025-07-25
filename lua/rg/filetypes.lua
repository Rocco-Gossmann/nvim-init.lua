local whichkey = require("which-key")
local mappfunc = require("rg.mapping_functions");

--[[============================================================================
-- Filetype Extensions
--============================================================================]]
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { sql = "mysql" } })
vim.filetype.add({ extension = { ini = "toml" } })
vim.filetype.add({ extension = { html = "tpl" } })

--[[============================================================================
-- LanguageServer restart per Filetype
--============================================================================]]
mappfunc.lspRestart({ "*.php" }, "intelephense phpactor")
mappfunc.lspRestart({ "*.js", "*.ts" }, "ts_ls")
mappfunc.lspRestart({ "dockerfile" }, "dockerls")
mappfunc.lspRestart({ "*.yml" }, "docker_compose_language_service")

--[[============================================================================
-- Keymaps, that differ per FileType
--============================================================================]]
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.todo", "*.md" },
	callback = function()
		whichkey.add({
			{ 'ts',   vim.cmd.TaskStart,  mode = 'n', desc = '[T]ask [S]tart',  silent = true },
			{ 'tn',   vim.cmd.TaskNew,    mode = 'n', desc = '[T]ask [N]ew',    silent = true },
			{ 'tc',   vim.cmd.TaskCancel, mode = 'n', desc = '[T]ask [C]ancel', silent = true },
			{ 'td',   vim.cmd.TaskDone,   mode = 'n', desc = '[T]ask [D]one',   silent = true },
			{ 'tr',   vim.cmd.TaskReset,  mode = 'n', desc = '[T]ask [R]eset',  silent = true },
		})
	end
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp", "*.c", "*.h" },
	callback = function()
		whichkey.add({
			{ '§h', '<esc>:lua require("rg.template").handleC_H()<cr>', mode = "n", noremap = true },
		})
	end
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.php" },
	callback = function()
		whichkey.add({
			{ "§c", function() templates.handlePHP("class") end,     mode = { "n" }, desc = "PHP-Class" },
			{ "§t", function() templates.handlePHP("trait") end,     mode = { "n" }, desc = "PHP-Trait" },
			{ "§i", function() templates.handlePHP("interface") end, mode = { "n" }, desc = "PHP-Interface" },
		})
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.php", "*.js", "*.css", "*.go", "*.sql", "*.lua", "*.tpl" },
	callback = function()
		vim.cmd.normal("Mz")
		vim.cmd("%s/\\s\\+$//ge")
		vim.cmd.normal("mz")
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go", "*.hpp", "*.h", "*.cpp", "*.c", "*.tmpl" },
	callback = function()
		vim.lsp.buf.format()
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
		vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
	end,
})

-- Code-Formatting
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.lua", "*.go", "*.php" },
	callback = function()
		whichkey.add({
			{ '<leader>cf', vim.lsp.buf.format, desc = '[C]ode [F]ormat', mode = "n" },
		})
	end
})

-- Code - Formating -- Markdown, Java-/Typescript, (s)css, JSON, JSX
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md", "*.html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" },
	callback = function()
		whichkey.add({
			{ '<leader>cf', '<cmd>Prettier<cr>', desc = '[C]ode [F]ormat', mode = "n" },
		})
	end
})
