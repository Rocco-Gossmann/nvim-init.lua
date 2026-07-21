local ocURL = "http://localhost:8099/"
local ocSession = ""
local paneId = nil

local function ocPost(data)

	if not paneId then
		print("no opencode pane found")
		return
	end

	local cmd = {'tmux', 'send-keys', '-t', paneId, data }

	local result = vim.system(cmd):wait()

	if result.code == 0 then
		print("message send");
	else
		error("Failed to create tmux split: " .. (result.stderr or "Unknown error"))
	end

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

		local cmd = {'tmux', 'split-window', '-h', '-l', '38%', '-P', '-F', '#{pane_id}', vim.g.opencodestartcommand}
		local result = vim.system(cmd):wait()

		if result.code == 0 then
			paneId = result.stdout:gsub("%s+", "")
		else
			error("Failed to create tmux split: " .. (result.stderr or "Unknown error"))
		end

	end

end

vim.api.nvim_create_user_command("OCTmuxPane", focusTmuxPane, {})

vim.api.nvim_create_user_command("OCWrite", function (args)

	ocPost(args.args);

end, { range = true })

vim.api.nvim_create_user_command("OCReference", function(args)

	local lines = "";

	if args.range > 0 then

		lines = "#" .. args.line1

		if args.line2 > args.line1 then

			lines = lines .. "-" .. args.line2

		end
	end

	ocPost("@" .. vim.fn.expand("%") .. lines )

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

	ocPost( content )

	focusTmuxPane()

end, { range = true })

return {}
