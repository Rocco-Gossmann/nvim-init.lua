local M = {}

function M.findTargetWithValue(resListCmd, resResultKey, resLabelKey, resName)

	local tablist = vim.fn.system(string.format('herdr %s list', resListCmd))
	local tabs = vim.json.decode(tablist)

	local target = nil
	for _, tab in ipairs(tabs.result[resResultKey]) do
		if tab[resLabelKey] == resName then
			target = tab
			break
		end
	end

	return target;

end

return M;
