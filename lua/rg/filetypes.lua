local mappfunc = require("rg.mapping_functions");

--[[============================================================================
-- LanguageServer restart per Filetype
--============================================================================]]
mappfunc.lspRestart({ "*.php" }, "intelephense phpactor")
mappfunc.lspRestart({ "*.js", "*.ts" }, "ts_ls")
mappfunc.lspRestart({ "dockerfile" }, "dockerls")
mappfunc.lspRestart({ "*.yml" }, "docker_compose_language_service")

--
-- Keymaps, that differ per FileType (Due to differennt technics and binaries being used)
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.todo", "*.md" },
	callback = function()
		vim.keymap.set({ 'n' }, 'ts', vim.cmd.TaskStart, { desc = '[T]ask [S]tart', silent = true });
		vim.keymap.set({ 'n' }, 'tn', vim.cmd.TaskNew, { desc = '[T]ask [N]ew', silent = true });
		vim.keymap.set({ 'n' }, 'tc', vim.cmd.TaskCancel, { desc = '[T]ask [C]ancel', silent = true });
		vim.keymap.set({ 'n' }, 'td', vim.cmd.TaskDone, { desc = '[T]ask [D]one', silent = true });
		vim.keymap.set({ 'n' }, 'tr', vim.cmd.TaskReset, { desc = '[T]ask [R]eset', silent = true });
	end
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp", "*.c", "*.h" },
	callback = function()
		vim.cmd [[
            nnoremap §h <esc>:lua require("rg.template").handleC_H()<cr>
        ]]
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
		vim.keymap.set({ 'n' }, '<leader>cf', vim.lsp.buf.format, { desc = '[C]ode [F]ormat' });
	end
})

-- Code - Formating -- Markdown, Java-/Typescript, (s)css, JSON, JSX
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md", "*.html", "*.js", ".ts", ".css", "*.scss", "*.json", "*.jsx" },
	callback = function()
		vim.keymap.set({ 'n' }, '<leader>cf', "<cmd>Prettier<cr>", { desc = '[C]ode [F]ormat' });
	end
})
