local S = require("your-plugin-name.state")
local D = require("your-plugin-name.util.debug")

-- internal methods
local YourPluginName = {}

-- Toggle the plugin by calling the `enable`/`disable` methods respectively.
--
--- @param scope string: internal identifier for logging purposes.
---@private
function YourPluginName.toggle(scope)
    if S.getEnabled(S) then
        return YourPluginName.disable(scope)
    end

    return YourPluginName.enable(scope)
end

--- Initializes the plugin, sets event listeners and internal state.
---
--- @param scope string: internal identifier for logging purposes.
---@private
function YourPluginName.enable(scope)
    if S.getEnabled(S) then
        D.log(scope, "Plugin is already enabled.")

        return
    end

    -- sets the plugin as `enabled`
    S.setEnabled(S)

    -- saves the state globally to `_G.YourPluginName.state`
    S.save(S)
end

--- Disables the plugin for the given tab, clear highlight groups and autocmds, closes side buffers and resets the internal state.
---
--- @param scope string: internal identifier for logging purposes.
---@private
function YourPluginName.disable(scope)
    if not S.getEnabled(S) then
        D.log(scope, "Plugin is already disabled.")

        return
    end

    -- resets the state to its initial value
    S.init(S)

    -- saves the state globally to `_G.YourPluginName.state`
    S.save(S)
end

return YourPluginName
