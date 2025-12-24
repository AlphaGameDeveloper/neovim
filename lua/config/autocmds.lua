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
        local relative_path =
            vim.fn.fnamemodify(vim.fn.expand("<afile>"), ":~:.")

        -- convert to Lua module path :3
        local module = relative_path
            :gsub(vim.fn.stdpath("config") .. "/lua/", "")
            :gsub("%.lua$", "")
            :gsub("/", ".")
        module = module:gsub("^%.", "")
        module = module:gsub("config.nvim.lua", "")
        module = module:gsub("~", "")
        -- replace sequential dots with single dot
        module = module:gsub("%.%.", ".")
        package.loaded[module] = nil
        require(module)

        vim.notify(
            "Reloaded configuration file: " .. module,
            vim.log.levels.INFO
        )
    end,
})

-- File Header Operations
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("fileheaders", { clear = true })

autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local header = require("header")
        if header and header.update_date_modified then
            header.update_date_modified()
        else
            vim.notify_once(
                "header.update_date_modified is not available",
                vim.log.levels.WARN
            )
        end
    end,
    group = "fileheaders",
    desc = "Update header's date modified",
})

autocmd({ "BufNewFile", "BufReadPost" }, {
    pattern = "*",
    callback = function()
        local header = require("header")
        if not header then
            vim.notify_once(
                "Could not automatically add header to new file: header module couldn't be found",
                vim.log.levels.ERROR
            )
            return
        end

        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local is_empty = #lines == 1 and lines[1] == ""

        if header.config.allow_autocmds and is_empty then
            local original_fmt = header.config.date_created_fmt
            local now = os.date(header.config.date_created_fmt, os.time())

            -- force add_headers to use the current datetime, otherwise it will show 1970-01-01
            header.config.date_created_fmt = now
            header.add_headers()

            header.config.date_created_fmt = original_fmt -- restore the original format
        end
    end,
    group = "fileheaders",
    desc = "Add copyright header to new/empty files",
})
