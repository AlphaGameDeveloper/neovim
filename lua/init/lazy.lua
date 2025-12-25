--[[
-- File name: lazy.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-24 17:08:07
-- Date modified: 2025-12-24 17:27:36
-- ------
--]]

require("lazy").setup({
    spec = require("config.plugins").pluginConfig,
    defaults = {
        lazy = false,
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
