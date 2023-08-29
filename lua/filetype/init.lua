local rgenv = require("rg.env")

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.schedule(function()

            local ft = vim.bo.filetype;

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

