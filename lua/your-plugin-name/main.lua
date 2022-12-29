local D = require("your-plugin-name.util.debug")
local M = require("your-plugin-name.util.map")

-- internal methods
local YourPluginName = {}

-- state
local S = {
    -- Boolean determining if the plugin is enabled or not.
    enabled = false,
}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function YourPluginName.toggle()
    if S.enabled then
        YourPluginName.disable()

        return false
    end

    YourPluginName.enable()

    return true
end

--- A method to enable your plugin.
function YourPluginName.enable()
    if S.enabled then
        return
    end

    S.enabled = true
end

--- A method to disable your plugin.
function YourPluginName.disable()
    if not S.enabled then
        return
    end

    -- reset the state
    S = {
        enabled = false,
    }
end

return { YourPluginName, S }
