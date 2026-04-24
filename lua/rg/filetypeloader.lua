local rgenv = require("rg.env")

local loadedFileTypes = {}

vim.api.nvim_create_autocmd({"VimEnter", "BufAdd"}, {

	callback = vim.schedule_wrap(function(args)

		local filetype = vim.o.filetype

		if(filetype == "") then
			return
		end

		if not (type(loadedFileTypes[filetype]) ==  "function") then

			if not (vim.fn.findfile(rgenv.confdir .. "/lua/filetypes/" .. filetype .. ".lua")) then
				return;
			end

			local ft = require("filetypes."..filetype);

			if not type(ft) == "table" then
				print("given file in " .. rgenv.confdir .. "/filetypes/" .. filetype .. ".lua does not return a Table")
				return;
			end

			loadedFileTypes[filetype] = function(_) end;

			rgenv.printTable(ft)

			if type(ft.load) == "function" then
				ft.load()
			end

			loadedFileTypes[filetype] = ft.config or loadedFileTypes[filetype];

		end

		loadedFileTypes[filetype](args.buf);


	end)

})


