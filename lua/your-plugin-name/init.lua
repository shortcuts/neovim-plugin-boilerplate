local M = require("your-plugin-name.main")
local C = require("your-plugin-name.config")

local YourPluginName = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function YourPluginName.toggle()
    if _G.YourPluginName.config == nil then
        _G.YourPluginName.config = C.options
    end

    M.toggle("publicAPI_toggle")
end

--- Initializes the plugin, sets event listeners and internal state.
function YourPluginName.enable()
    if _G.YourPluginName.config == nil then
        _G.YourPluginName.config = C.options
    end

    M.enable("publicAPI_enable")
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function YourPluginName.disable()
    M.disable("publicAPI_disable")
end

-- setup YourPluginName options and merge them with user provided ones.
function YourPluginName.setup(opts)
    _G.YourPluginName.config = C.setup(opts)
end

_G.YourPluginName = YourPluginName

return _G.YourPluginName
