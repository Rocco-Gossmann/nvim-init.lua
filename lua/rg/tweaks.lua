-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local scan = require 'plenary.scandir'
local env = require "rg.env"

-- BM: Lua Bookmark
-- <!-- BM: HTML Comment
-- // BM: Line Comment Bookmark
-- /* BM: Block Comment Bookmark */
-- /** BM: Doc Comment Bookmark */
-- # BM: Hash Bookmark
-- + BM: nonesense Bookmark

vim.api.nvim_create_user_command("BM", function()

    local buf = vim.api.nvim_get_current_buf();
    local allLines = vim.api.nvim_buf_get_lines(buf, 0, -1, false);
    local lines = {}

    if #allLines == 0 then
        return
    end

    for idx = 1, #allLines do
        local line = allLines[idx]

        local hit = line:match('//%s*BM:%s') or
        line:match('/%*%s*BM:%s') or
        line:match('/%*%*%s*BM:%s') or
        line:match('#%s*BM:%s') or
        line:match('"%s*BM:%s') or
        line:match('%-%-%s*BM:%s') or
        line:match('%-%-%s*%[%[%s*BM:%s')

        if hit then
            table.insert(lines, idx .. ": " .. line:match('.*BM:%s(.+)$'));
        end
    end

    env.basicTelescopePick(lines, function(choice)
        local ln = choice:match('(%d+):');
        vim.cmd.norm(ln.."gg<cr>");
    end, "What Bookmark? ");

end, {
});


vim.api.nvim_create_user_command("CH", function()
    local files = scan.scan_dir('.', { hidden = false, depth = 6 });
    local opts = {}

    for idx = 1, #files do
        local suffix = files[idx]:match('([^%.]+)$');
        local prefix = files[idx]:match('^(.*)%.[^%.]+$');

        if suffix == "h" then
            table.insert(opts, prefix)
        end
    end

    env.basicTelescopePick(opts, function(choice)
        local cppfile = choice .. ".cpp";
        local cfile = choice .. ".c";
        local hfile = choice .. ".h";

        if vim.fn.findfile(cppfile) ~= '' then
            vim.cmd.tabnew(cppfile);
            vim.cmd.vs(hfile);
        elseif vim.fn.findfile(cfile) ~= '' then
            vim.cmd.tabnew(cfile);
            vim.cmd.vs(hfile);
        else
            vim.cmd.tabnew(hfile);
        end
    end, "What H - File?")
end, {
});

-- Telescope Border-Fix
--=============================================================================
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()

	local vimOptBorders = vim.opt_local.winborder;
    vim.opt_local.winborder = "none"

    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,

      callback = function()

        vim.opt_local.winborder = vimOptBorders

      end,

    })

  end,
})




vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = {
					vim.fn.getcwd() .. "/lua",
					vim.fn.getcwd()
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

return {}

