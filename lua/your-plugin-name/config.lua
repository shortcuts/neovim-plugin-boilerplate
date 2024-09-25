local log = require("your-plugin-name.util.log")

local YourPluginName = {}

--- YourPluginName configuration with its default values.
---
---@type table
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
YourPluginName.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

---@private
local defaults = vim.deepcopy(YourPluginName.options)

--- Defaults YourPluginName options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |YourPluginName.options|.
---
---@private
function YourPluginName.defaults(options)
    YourPluginName.options =
        vim.deepcopy(vim.tbl_deep_extend("keep", options or {}, defaults or {}))

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(YourPluginName.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return YourPluginName.options
end

--- Define your your-plugin-name setup.
---
---@param options table Module config table. See |YourPluginName.options|.
---
---@usage `require("your-plugin-name").setup()` (add `{}` with your |YourPluginName.options| table)
function YourPluginName.setup(options)
    YourPluginName.options = YourPluginName.defaults(options or {})

    log.warn_deprecation(YourPluginName.options)

    return YourPluginName.options
end

return YourPluginName
