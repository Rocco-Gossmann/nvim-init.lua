local env = require("rg.env")


local function handleC_H()
    local headername = vim.fn.input("HeaderName: ");

    if string.len(headername) > 0 then
        env.readTemplate("hpp.h")
        vim.cmd("%s/___HEADER___/"..headername.."/g")
    end
end


return {
    handleC_H = handleC_H
}
