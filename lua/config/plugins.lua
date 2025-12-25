--[[
-- File name: plugins.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-24 13:13:56
-- Date modified: 2025-12-24 17:25:28
-- ------
--]]
-- vim.notify(
--     "Loading plugins configuration",
--     vim.log.levels.INFO,
--     { title = "plugins.lua" }
-- )

return {
    pluginConfig = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { "wakatime/vim-wakatime" },
        { "github/copilot.vim" },
        -- import/override with your plugins
        { import = "plugins" },
    },
}
