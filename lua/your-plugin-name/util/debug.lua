local D = {}

-- prints a log if the local state has `debug` set to `true`.
-- @param scope string: an identifier for the scope, e.g. the method name.
-- @param str string: the string to format (same as string.format()).
-- @param args ...: the params to format the string.
function D.log(scope, str, ...)
    if _G.YourPluginName.config ~= nil and not _G.YourPluginName.config.debug then
        return
    end

    local info = debug.getinfo(2, "Sl")
    local line = ""

    if info then
        line = "L" .. info.currentline
    end

    print(
        string.format(
            "[your-plugin-name:%s %s in %s] > %s",
            os.date("%H:%M:%S"),
            line,
            scope,
            string.format(str, ...)
        )
    )
end

-- prints the given `map` if the local state has `debug` set to `true`.
-- @param table list: a list to print.
-- @param indent int: the default indent of the table, leave empty for 0.
function D.tprint(table, indent)
    if _G.YourPluginName.config ~= nil and not _G.YourPluginName.config.debug then
        return
    end

    if not indent then
        indent = 0
    end

    for k, v in pairs(table) do
        local formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            D.tprint(v, indent + 1)
        elseif type(v) == "boolean" then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
end

return D
