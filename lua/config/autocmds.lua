-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.fn.stdpath("config") .. "/lua/config/*.lua",
    callback = function()
        local relative_path = vim.fn.fnamemodify(vim.fn.expand("<afile>"), ":~:.")

        -- convert to Lua module path :3
        local module = relative_path:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
        module = module:gsub("^%.", "")
        module = module:gsub("config.nvim.lua", "")
        package.loaded[module] = nil
        require(module)

        vim.notify("Reloaded configuration file: " .. module, vim.log.levels.INFO)
    end,
})
