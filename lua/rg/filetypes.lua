local mappfunc = require("rg.mapping_functions");
local rgcore = require("rg.core");

--=============================================================================
-- BM: Map File Extension => Filetype
--=============================================================================
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { sql = "mysql" } })

--=============================================================================
-- BM: LanguageServer Restart (<leader>clr)
--=============================================================================
mappfunc.lspRestart({ "*.php" }, "intelephense")
mappfunc.lspRestart({ "*.js", "*.ts" }, "ts_ls")
mappfunc.lspRestart({ "*.lua" }, "lua_ls")
mappfunc.lspRestart({ "dockerfile" }, "dockerls")
mappfunc.lspRestart({ "*.yml" }, "docker_compose_language_service")
mappfunc.lspRestart({ "*.cs" }, "roslyn_ls")

--=============================================================================
-- Keymaps, that differ per FileType
--=============================================================================
-- Todo-Lists for Markdown
-- -----------------------------------------------------------------------------
mappfunc.filetypeKeymap({ "*.todo", "*.md" }, {
	{ '<leader>j',  group = '[J]ob / Task' },
	{ '<leader>js', vim.cmd.TaskStart,     mode = 'n', desc = '[S]tart' },
	{ '<leader>jn', vim.cmd.TaskNew,       mode = 'n', desc = '[N]ew' },
	{ '<leader>jc', vim.cmd.TaskCancel,    mode = 'n', desc = '[C]ancel' },
	{ '<leader>jd', vim.cmd.TaskDone,      mode = 'n', desc = '[D]one' },
	{ '<leader>jr', vim.cmd.TaskReset,     mode = 'n', desc = '[R]eset' },
});
--=============================================================================
-- BM: Templates
--=============================================================================
mappfunc.filetypeKeymap({ "*.cpp", "*.c", "*.h" }, {
	{ '§h', '<esc>:lua require("rg.template").handleC_H()<cr>', mode = "n", noremap = true },
})

mappfunc.filetypeKeymap({ "*.cs" }, {
	{ '§s', '<esc>:lua require("rg.template").handleCSSummary()<cr>', mode = "n", noremap = true, desc = "add C# <Summary> - Tag" },
})


mappfunc.filetypeKeymap({ "*.php" }, {
	{ "§c", function() templates.handlePHP("class") end,     mode = { "n" }, desc = "PHP-Class" },
	{ "§t", function() templates.handlePHP("trait") end,     mode = { "n" }, desc = "PHP-Trait" },
	{ "§i", function() templates.handlePHP("interface") end, mode = { "n" }, desc = "PHP-Interface" },
})

--=============================================================================
-- BM: Manual code formatting
--=============================================================================
mappfunc.filetypeKeymap({ "*.html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" }, {
	{ '<leader>cf', '<cmd>w<cr><cmd>silent !deno fmt "%"<cr>', desc = '[C]ode [F]ormat', mode = "n" },
})

mappfunc.filetypeKeymap({ "*.md" }, {
	{ '<leader>cf', '<cmd>w<cr><cmd>silent !deno fmt --options-prose-wrap=preserve "%"<cr>', desc = '[C]ode [F]ormat', mode = "n" },
})

mappfunc.filetypeKeymap({ "*.lua", "*.go", "*.php", "*.cs" }, {
	{ '<leader>cf', function() vim.lsp.buf.format() end, desc = '[C]ode [F]ormat', mode = "nv" },
})

--=============================================================================
-- BM: Auto-Formating and PreSave-Cleanup
--=============================================================================
-- BM: strip trailing whitespaces before save
--------------------------------------------------------------------------------
if not (not (vim.g.stripTrailingWhitespacesBeforeSave)) then
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = { "*.php", "*.js", "*.css", "*.go", "*.sql", "*.lua", "*.tpl", "*.cs" },
		callback = function()
			vim.cmd.normal("Mz")
			vim.cmd("%s/\\s\\+$//ge")
			vim.cmd.normal("mz")
		end
	})
end

-- BM: Mandatory formating on save
-- ( this must be done for go or its stupid compiler throws errors)
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		vim.lsp.buf.format()
		vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
		vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
	end
})


-- BM: Optional formating on save
--------------------------------------------------------------------------------
if not (not (vim.g.enableFormatOnSave)) then
	-- formate before save
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = {  "*.hpp", "*.h", "*.cpp", "*.c", "*.tmpl", "*.cs" },
		callback = function()
			vim.lsp.buf.format()
		end
	})
end
