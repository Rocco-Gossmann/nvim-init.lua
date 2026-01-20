local ocURL = "http://localhost:8080/"
local ocSession = ""

local function ocPost(url, data)

	local cmd = {'curl', '--silent', '-X', 'POST', ocURL..url}

	if data ~= nil then

		local json_data = vim.json.encode(
			data,
			{ escape_slash = false }
		)

		table.insert(cmd, '-H')
		table.insert(cmd, 'Content-Type: application/json')
		table.insert(cmd, '--data-raw')
		table.insert(cmd, json_data)

	end

	local result = vim.system(cmd):wait()

	if result.code ~= 0 then
		error("HTTP request failed: " .. (result.stderr or "Unknown error"))
	end

	return vim.json.decode(result.stdout)

end

vim.api.nvim_create_user_command("OCNewSession", function(args)


	local response = ocPost('session');

	--[[

	title = New session - 2026-01-18T12:17:00.544Z
	slug = crisp-knight
		updated = 1768738620544
		created = 1768738620544
	projectID = 4c4096cf30acace7bf3cf5a0a4b6c5346a0d5a59
	version = 1.1.23
	directory = /Users/st/.config/nvim
	id = ses_42ef67b7fffetPF633RN6HGG61

	--]]

	ocSession = response.id;

	ocPost('tui/select-session', { sessionID = ocSession });

	print(ocSession);

	--
end, {})


vim.api.nvim_create_user_command("OCCopy", function(args)

	-- env.printTable(args)
	-- print(vim.api.nvim_get_current_line())
	-- print(args.line1, args.line2, args.range)

	local lines = "";

	if args.range == 2 then

		lines = "#L" .. args.line1 .. "-" .. args.line2

	end

	local content = "\n---<code>\n" .. table.concat(vim.api.nvim_buf_get_lines(0, args.line1-1, args.line2, true), "\n") .. "\n</code>";

	ocPost('tui/append-prompt', { text = "@" .. vim.fn.expand("%") .. lines .. "\n\n" })

end, { range = true })

return {}
