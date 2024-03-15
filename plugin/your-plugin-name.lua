-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.YourPluginNameLoaded then
    return
end

_G.YourPluginNameLoaded = true

-- Useful if you want your plugin to be compatible with older (<0.7) neovim versions
if vim.fn.has("nvim-0.7") == 0 then
    vim.cmd("command! YourPluginName lua require('your-plugin-name').toggle()")
else
    vim.api.nvim_create_user_command("YourPluginName", function()
        require("your-plugin-name").toggle()
    end, {})
end
