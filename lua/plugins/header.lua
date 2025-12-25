--[[
-- File name: header.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-24 13:03:02
-- Date modified: 2025-12-24 13:09:01
-- ------
--]]

return {
    "attilarepka/header.nvim",
    config = function()
        require("header").setup({
            author = "Damien Boisvert",
            date_created = true,
            date_created_fmt = "%Y-%m-%d %H:%M:%S",
            date_modified = true,
            date_modified_fmt = "%Y-%m-%d %H:%M:%S",
        })
    end,
}
