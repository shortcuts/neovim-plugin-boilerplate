local main = require("your-plugin-name.main")
local api = require("your-plugin-name.util.api")
local config = require("your-plugin-name.config")

local YourPluginName = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function YourPluginName.toggle()
    if _G.YourPluginName.config == nil then
        _G.YourPluginName.config = config.options
    end

    api.debounce("public_api_toggle", main.toggle)
end

--- Initializes the plugin, sets event listeners and internal state.
function YourPluginName.enable(scope)
    if _G.YourPluginName.config == nil then
        _G.YourPluginName.config = config.options
    end

    api.debounce(scope or "public_api_enable", main.enable, 10)
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function YourPluginName.disable()
    api.debounce("public_api_disable", main.disable)
end

-- setup YourPluginName options and merge them with user provided ones.
function YourPluginName.setup(opts)
    _G.YourPluginName.config = config.setup(opts)
end

_G.YourPluginName = YourPluginName

return _G.YourPluginName
