local function customFileExtension(pattern, filetype, onBufEnter)
	vim.api.nvim_create_autocmd("BufEnter", {

		pattern = pattern,

		callback = function(args)

			if type(onBufEnter) == "function" then

				if onBufEnter(args) then
					vim.cmd.set("filetype=" .. filetype)
				end

			else

				vim.cmd.set("filetype=" .. filetype)

			end

		end,
	})

end


--[[
-- why does this exist?
-- Roslyn registers different diagnosing tools in different namespaces
-- the result is, that an error in a file that shares namespaces is displayed
-- multiple times. One time for each namespace.
-- So errors in a *.razor file would show up 9 times in the diagnostics window
-- This function aims to fix that.
]]--
local default_diag_handler = vim.lsp.handlers["textDocument/diagnostic"]

local function roslynDedupeDiagnostics(err, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	if client and client.name == "roslyn" and result and result.kind == "full" and result.items then
		local prefix = ("nvim.lsp.%s.%d."):format(client.name, client.id)
		local current = prefix .. (ctx.params and ctx.params.identifier or "nil")
		local seen = {}

		-- signatures already reported by the other Roslyn provider namespaces
		for name, ns in pairs(vim.api.nvim_get_namespaces()) do
			if name ~= current and name:sub(1, #prefix) == prefix then
				for _, d in ipairs(vim.diagnostic.get(ctx.bufnr, { namespace = ns })) do
					seen[("%d:%d:%d:%d:%s:%s"):format(
						d.lnum, d.col, d.end_lnum, d.end_col, tostring(d.code), d.message
					)] = true
				end
			end
		end

		-- drop exact duplicates coming from this provider
		result.items = vim.tbl_filter(function(d)
			local key = ("%d:%d:%d:%d:%s:%s"):format(
				d.range.start.line, d.range.start.character,
				d.range["end"].line, d.range["end"].character,
				tostring(d.code), d.message
			)
			if seen[key] then return false end
			seen[key] = true
			return true
		end, result.items)
	end
	return default_diag_handler(err, result, ctx)
end


return {
	customFileExtension = customFileExtension,
	roslynDedupeDiagnostics = roslynDedupeDiagnostics
}
