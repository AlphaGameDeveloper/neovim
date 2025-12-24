--[[
-- File name: keymaps.lua
-- Author: Damien Boisvert
-- Date created: 2025-12-21 13:23:16
-- Date modified: 2025-12-21 21:31:22
-- ------
--]]

-- tmux-style window navigation
vim.keymap.set("n", "<leader><Left>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<leader><Down>", "<C-w>j", { desc = "Go to lower split" })
vim.keymap.set("n", "<leader><Up>", "<C-w>k", { desc = "Go to upper split" })
vim.keymap.set("n", "<leader><Right>", "<C-w>l", { desc = "Go to right split" })

-- buffer navigation w/ shift arrow
vim.keymap.set("n", "<S-Left>", "<cmd>bprevious<CR>", {
    desc = "Previous Buffer",
})

vim.keymap.set("n", "<S-Right>", "<cmd>bnext<CR>", {
    desc = "Next Buffer",
})

-- word movement w/ ctrl arrow
vim.keymap.set("n", "<C-Left>", "b", { desc = "Previous Word" })
vim.keymap.set("n", "<C-Right>", "w", { desc = "Next Word" })
vim.keymap.set("i", "<C-Left>", "b", { desc = "Previous Word" })
vim.keymap.set("i", "<C-Right>", "w", { desc = "Next Word" })

-- what the hell is up with the "exit terminal insert" keybind!?
vim.keymap.set("t", "<Esc>", "[[<C-\\><C-n>]]", { desc = "Exit terminal mode" })

-- header.nvim keybinds
local header = require("header")

vim.keymap.set("n", "<leader>hh", function()
    header.add_headers()
end)
-- see supported licenses below, method handles case-insensitively
vim.keymap.set("n", "<leader>hm", function()
    header.add_license_header("mit")
end)

-- vscode-style move line order (alt + up/down)
vim.keymap.set(
    "n",
    "<A-Up>",
    ":m .-2<CR>==",
    { desc = "Move line up", silent = true }
)
vim.keymap.set(
    "n",
    "<A-Down>",
    ":m .+1<CR>==",
    { desc = "Move line down", silent = true }
)
vim.keymap.set(
    "v",
    "<A-Up>",
    ":m '<-2<CR>gv=gv",
    { desc = "Move line up", silent = true }
)
vim.keymap.set(
    "v",
    "<A-Down>",
    ":m '>+1<CR>gv=gv",
    { desc = "Move line down", silent = true }
)
vim.keymap.set(
    "i",
    "<A-Up>",
    "<Esc>:m .-2<CR>==gi",
    { desc = "Move line up", silent = true }
)
vim.keymap.set(
    "i",
    "<A-Down>",
    "<Esc>:m .+1<CR>==gi",
    { desc = "Move line down", silent = true }
)
