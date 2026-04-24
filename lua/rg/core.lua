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

return {
	customFileExtension = customFileExtension,
}
