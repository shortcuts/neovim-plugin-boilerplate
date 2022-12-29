local YourPluginName = {}

-- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function YourPluginName.toggle()
    -- when the config is not set to the global object, we set it
    if YourPluginName.config == nil then
        YourPluginName.config = require("your-plugin-name.config").options
    end
    local main = require("your-plugin-name.main")

    -- the internal toggle method tell us if the plugin was enabled or disabled.
    -- this allows us to init/reset the global object.
    if main[1].toggle() then
        YourPluginName.internal = {
            toggle = main[1].toggle,
            enable = main[1].enable,
            disable = main[1].disable,
        }
    else
        YourPluginName.internal = {
            toggle = nil,
            enable = nil,
            disable = nil,
        }
    end

    YourPluginName.state = main[2]
end

-- starts YourPluginName and set internal functions and state.
function YourPluginName.enable()
    local main = require("your-plugin-name.main")

    main[1].enable()

    YourPluginName.state = main[2]
    YourPluginName.internal = {
        toggle = main[1].toggle,
        enable = main[1].enable,
        disable = main[1].disable,
    }
end

-- disables YourPluginName and reset internal functions and state.
function YourPluginName.disable()
    local main = require("your-plugin-name.main")

    main[1].disable()

    YourPluginName.state = main[2]
end

-- setup YourPluginName options and merge them with user provided ones.
function YourPluginName.setup(opts)
    YourPluginName.config = require("your-plugin-name.config").setup(opts)
end

_G.YourPluginName = YourPluginName

return YourPluginName
