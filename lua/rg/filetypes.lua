

local mappfunc = require("rg.mapping_functions");
local rgcore = require("rg.core");

--[[============================================================================
-- Map File Extension => Filetype
--============================================================================]]
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { sql = "mysql" } })

--[[============================================================================
-- Handle certain unknown file extensions
--============================================================================]]
-- rgcore.customFileExtension({ "*.toml" }, "ini");

--[[============================================================================
-- LanguageServer restart per Filetype
--============================================================================]]
mappfunc.lspRestart({ "*.php" }, "intelephense")
mappfunc.lspRestart({ "*.js", "*.ts" }, "ts_ls")
mappfunc.lspRestart({ "*.lua" }, "lua_ls")
mappfunc.lspRestart({ "dockerfile" }, "dockerls")
mappfunc.lspRestart({ "*.yml" }, "docker_compose_language_service")

--[[============================================================================
-- BM: Keymaps, that differ per FileType
--============================================================================]]

-- loading Tempaltes
-- -----------------------------------------------------------------------------
mappfunc.filetypeKeymap({ "*.cpp", "*.c", "*.h" }, {
	{ '§h', '<esc>:lua require("rg.template").handleC_H()<cr>', mode = "n", noremap = true },
})

mappfunc.filetypeKeymap({ "*.php" }, {
	{ "§c", function() templates.handlePHP("class") end,     mode = { "n" }, desc = "PHP-Class" },
	{ "§t", function() templates.handlePHP("trait") end,     mode = { "n" }, desc = "PHP-Trait" },
	{ "§i", function() templates.handlePHP("interface") end, mode = { "n" }, desc = "PHP-Interface" },
})

-- Code-Formatting
-- -----------------------------------------------------------------------------
mappfunc.filetypeKeymap({ "*.html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" }, {
	{ '<leader>cf', '<cmd>w<cr><cmd>silent !deno fmt "%"<cr>', desc = '[C]ode [F]ormat', mode = "n" },
})

mappfunc.filetypeKeymap({ "*.lua", "*.go", "*.php" }, {
	{ '<leader>cf', vim.lsp.buf.format, desc = '[C]ode [F]ormat', mode = "nv" },
})


--[[============================================================================
-- BM: Formating and Cleanup
--============================================================================]]
-- strip trailing whitespaces before save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.php", "*.js", "*.css", "*.go", "*.sql", "*.lua", "*.tpl" },
	callback = function()
		vim.cmd.normal("Mz")
		vim.cmd("%s/\\s\\+$//ge")
		vim.cmd.normal("mz")
	end
})

-- formate before save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go", "*.hpp", "*.h", "*.cpp", "*.c", "*.tmpl" },
	callback = function()
		vim.lsp.buf.format()
	end
})

-- auto import before save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		vim.lsp.buf.code_action { context = { diagnostics = {}, only = { 'source.organizeImports' } }, apply = true }
		vim.lsp.buf.code_action { context = { diagnostics = {}, only = { 'source.fixAll' } }, apply = true }
	end,
})
