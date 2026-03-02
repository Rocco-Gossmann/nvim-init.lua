local ocURL = "http://localhost:8099/"
local ocSession = ""
local paneId = nil

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

local function focusTmuxPane()


	if paneId ~= nil then

		local cmd = {'tmux', 'select-pane', '-t', paneId}
		local result = vim.system(cmd):wait()

		if result.code ~= 0 then
			paneId = nil
		else
			return
		end

	end

	if paneId == nil then

		local cmd = {'tmux', 'split-window', '-h', '-l', '38%', '-P', '-F', '#{pane_id}', 'lsof -ti :8099 | xargs kill -9 ; opencode --port 8099 ; exit'}
		local result = vim.system(cmd):wait()

		if result.code == 0 then
			paneId = result.stdout:gsub("%s+", "")
		else
			error("Failed to create tmux split: " .. (result.stderr or "Unknown error"))
		end

	end

end

vim.api.nvim_create_user_command("OCTmuxPane", focusTmuxPane, {})

vim.api.nvim_create_user_command("OCReference", function(args)

	local lines = "";

	if args.range == 2 then

		lines = "#" .. args.line1 .. "-" .. args.line2

	end

	ocPost('tui/append-prompt', { text = "@" .. vim.fn.expand("%") .. lines })

	focusTmuxPane()

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

	focusTmuxPane()

end, { range = true })

return {}
