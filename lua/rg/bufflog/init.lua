local logbuffer = 0
local autocmd_id = -1;

local function no_buffer_marked(_) end

local function clear_autocmd()
    vim.api.nvim_del_autocmd(autocmd_id);
end

local function send_to_logbuff(args)
    vim.api.nvim_buf_set_lines(logbuffer, -1, -1, false, { args });
end

local buflog_send_fnc = no_buffer_marked;
local buflog_unmark_fnc = no_buffer_marked;

local function mark_buffer_for_log()

    buflog_unmark_fnc();
    logbuffer = vim.api.nvim_get_current_buf();

    autocmd_id = vim.api.nvim_create_autocmd("BufDelete", {
        buffer = logbuffer,
        callback = function()
            logbuffer = 0;
            buflog_send_fnc = no_buffer_marked;
            buflog_unmark_fnc = no_buffer_marked;
        end
    })

    buflog_unmark_fnc = clear_autocmd;
    buflog_send_fnc = send_to_logbuff;

end

vim.api.nvim_create_user_command("BuffLogMark", function()     mark_buffer_for_log();      end, {})
vim.api.nvim_create_user_command("BuffLogSend", function(args) buflog_send_fnc(args.args); end, { nargs="?" })
vim.api.nvim_create_user_command("BuffLog",     function()
    vim.cmd.vs("BuffLog");
    vim.cmd.BuffLogMark();
end, {});
