local scan = require 'plenary.scandir'
local env = require"rg.env"

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
