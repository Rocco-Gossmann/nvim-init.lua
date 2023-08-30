local rgenv = require("rg.env")

if vim.g.rg_filetype_autocmd_id ~= nil then
    vim.api.nvim_del_autocmd(vim.g.rg_filetype_autocmd_id);
end

vim.g.rg_filetype_autocmd_id = vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
        vim.schedule(function()

            local ft = vim.bo.filetype;

            vim.cmd.BuffLogSend("Enter FTBuffer: " .. ft);

            if rgenv.doFileIfExists(rgenv.confdir .. "/lua/custom/filetype/_all.lua") == nil then
                rgenv.doFileIfExists(rgenv.confdir .. "/lua/filetype/_all.lua") end

            if rgenv.doFileIfExists(rgenv.confdir .. "/lua/custom/filetype/"..ft..".lua") then
                return
            else
                rgenv.doFileIfExists(rgenv.confdir .. "/lua/filetype/"..ft..".lua")
            end

        end)
    end
})

