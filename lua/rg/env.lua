local os = require "os"

local home = os.getenv("HOME")

--      from $HOME/.config/$NVIM_APPNAME
local appname = os.getenv("NVIM_APPNAME")
if appname == nil then appname='nvim' end

local function doFileIfExists(fileName)
    if vim.fn.findfile(fileName) ~= '' then
        local ret = dofile(fileName);
        if ret == nil then
            return true
        else
            return ret
        end
    else
        return nil;
    end
end

local confdir = home .. "/.config/" .. appname;
local tpldir = confdir .. "/lua/rg/templates/";


local function readTemplate(filename)
    local tplfile = tpldir .. filename
    vim.cmd.read(tplfile);
end

local pick = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")

local function basicTelescopePick(optList, optHandler, prompt)
    pick.new({}, {
        prompt_title = prompt,
        finder = finders.new_table { results = optList, },
        sorter = conf.generic_sorter({}),

        entry_maker = function(opt)
            return {
                value = opt,
                display = vim.inspect(opt),
                ordinal = vim.inspect(opt)
            }
        end,

        attach_mappings = function(promptBuffer, _)
            actions.select_default:replace(function()
                -- make sure to close telescope first
                actions.close(promptBuffer)

                -- Grab, what was selected
                local choice = actions_state.get_selected_entry();

                if choice ~= nil and choice[1] ~= "" then
                    optHandler(choice[1])
                end
            end)

            -- Confirm, that we want ot change the Telescope action
            return true;
        end
    }):find({})
end


return {
    appname = appname,
    home = home,
    confdir = confdir,

    doFileIfExists = doFileIfExists,

    readTemplate = readTemplate,

    basicTelescopePick = basicTelescopePick
}
