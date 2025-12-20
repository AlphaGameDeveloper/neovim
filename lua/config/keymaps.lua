-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

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
