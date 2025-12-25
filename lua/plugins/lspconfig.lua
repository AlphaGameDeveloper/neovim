--[[
-- File name: lspconfig.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-24 17:24:59
-- Date modified: 2025-12-24 17:27:12
-- ------
--]]

return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({
            -- Pass additional command line arguments to clangd
            cmd = {
                "clangd",
                "--clang-tidy",
                "--header-insertion-decorators=0",
            },
            -- Customize capabilities or add event handlers
            -- on_attach = function(client, bufnr)
            -- e.g., map keybindings here
            -- end,
            settings = {
                clangd = {
                    -- Specify standard in a .clangd file in your project root
                    -- Or pass via cmd line if necessary
                },
            },
        })

        -- Example: Configure the pyright language server
        lspconfig.pyright.setup({})

        -- Example: Configure the tsserver language server
        lspconfig.tsserver.setup({})
    end,
}
