--[[
-- File name: mason.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-24 17:32:29
-- Date modified: 2025-12-24 17:38:03
-- ------
--]]

return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
            },
        })
    end,
}
