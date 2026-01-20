local ocURL = "http://localhost:8099/"
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


vim.api.nvim_create_user_command("OCReference", function(args)

	-- env.printTable(args)
	-- print(vim.api.nvim_get_current_line())
	-- print(args.line1, args.line2, args.range)

	local lines = "";

	if args.range == 2 then

		lines = "#" .. args.line1 .. "-" .. args.line2

	end

	ocPost('tui/append-prompt', { text = "@" .. vim.fn.expand("%") .. lines })

end, { range = true })

vim.api.nvim_create_user_command("OCCopy", function()

-- Save current register content
	local old_reg = vim.fn.getreg('v')
	local old_regtype = vim.fn.getregtype('v')

	-- Yank the visual selection to register 'v'
	vim.cmd('normal! gv"vy')
	local selected_text = vim.fn.getreg('v')

	-- Remove trailing spaces from empty lines
	selected_text = selected_text:gsub("[ \t]+(\n)", "%1")

	-- Restore the original register content
	vim.fn.setreg('v', old_reg, old_regtype)

	local content = "\n" .. selected_text .. "\n";

	ocPost('tui/append-prompt', { text = content })

end, { range = true })

return {}
