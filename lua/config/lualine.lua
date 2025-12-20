local wakatime = require("plugins.wakatime")

vim.notify(
    "Loading lualine configuration",
    vim.log.levels.INFO,
    { title = "lualine.lua" }
)
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
