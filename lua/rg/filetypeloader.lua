local rgenv = require("rg.env")

local loadedFileTypes = {}

vim.api.nvim_create_autocmd({ "VimEnter", "BufAdd" }, {

	callback = vim.schedule_wrap(function(args)
		local filetype = vim.o.filetype
		local emTab = {};

		if (filetype == "") then
			return
		end

		if not (type(loadedFileTypes[filetype]) == "function") then
			local ft = rgenv.doFileIfExists(".nvim/" .. filetype .. ".lua");
			local gft = rgenv.doFileIfExists(rgenv.confdir .. "/lua/filetypes/" .. filetype .. ".lua");

			loadedFileTypes[filetype] = function(_) end;

			if type((gft or emTab).load) == "function" then
				gft.load();
			end
			if type((ft or emTab).load) == "function" then
				ft.load();
			end

			ft = rgenv.extendTable(gft, ft);

			loadedFileTypes[filetype] = ft.config or loadedFileTypes[filetype];
		end

		loadedFileTypes[filetype](args.buf);
	end)

})
