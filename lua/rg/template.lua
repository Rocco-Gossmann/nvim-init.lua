local env = require("rg.env")


local function handleC_H()
    local headername = vim.fn.input("HeaderName: ");

    if string.len(headername) > 0 then
        env.readTemplate("hpp.h")
        vim.cmd("%s/___HEADER___/"..headername.."/g")
    end
end

local function handlePHP(tmpl)
    local namespace = vim.fn.input("namespace: ");
    local classname = vim.fn.input(tmpl .. ": ");

    env.readTemplate("tmpl.php")

    vim.cmd("%s/___TYPE___/"..tmpl.."/g")

    if string.len(namespace) > 0 then
        vim.cmd("%s/___NAMESPACE___/namespace "..namespace..";/g")
    else
        vim.cmd("%s/___NAMESPACE___//g")
    end

    vim.cmd("%s/___CLASSNAME___/"..classname.."/g")

    vim.cmd("norm ggdd");
end

return {
    handleC_H = handleC_H,
    handlePHP = handlePHP
}
