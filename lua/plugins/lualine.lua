--[[
-- File name: lualine.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-24 17:17:23
-- Date modified: 2025-12-24 17:21:43
-- ------
--]]

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local wakatime = require("plugins.wakatime")

        require("lualine").setup({
            options = {
                icons_enabled = true,
                refresh = {
                    statusline = 5000,
                },
            },
            sections = {
                lualine_y = {
                    {
                        wakatime.component,
                        icon = " ",
                        color = { fg = "#ff8800" },
                    },
                },
            },
        })
    end,
}
