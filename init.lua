-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lualine")

require("lspconfig").clangd.setup({
    -- Pass additional command line arguments to clangd
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion-decorators=0",
    },
    -- Customize capabilities or add event handlers
    on_attach = function(client, bufnr)
        -- e.g., map keybindings here
    end,
    settings = {
        clangd = {
            -- Specify standard in a .clangd file in your project root
            -- Or pass via cmd line if necessary
        },
    },
})
