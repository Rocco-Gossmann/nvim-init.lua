local function customFileExtension(pattern, filetype, onBufEnter)
	vim.api.nvim_create_autocmd("BufAdd", {

		pattern = pattern,

		callback = function(args)
			vim.cmd.set("filetype=" .. filetype)

			if (type(onBufEnter) == "function" and onBufEnter(args)) then

				vim.cmd.set("filetype=" .. filetype)

			end

		end,
	})
end

return {
	customFileExtension = customFileExtension
}
