local log = require("your-plugin-name.util.log")

local state = { enabled = false }


---Sets the state to its original value.
---
---@private
function state:init()
    self.enabled = false
end

---Saves the state in the global _G.YourPluginName.state object.
---
---@private
function state:save()
    log.debug("state.save", "saving state globally to _G.YourPluginName.state")

    _G.YourPluginName.state = self
end

---Whether the YourPluginName is enabled or not.
---
---@private
function state:set_enabled()
    self.enabled = true
end

---Whether the YourPluginName is enabled or not.
---
---@return boolean: the `enabled` state value.
---@private
function state:get_enabled()
    return self.enabled
end

return state
