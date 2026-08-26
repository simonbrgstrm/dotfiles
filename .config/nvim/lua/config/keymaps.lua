-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- buffer
map("n", "<leader>bh", "<cmd>bprev<CR>", { desc = "Prev buffer" })
map("n", "<leader>bl", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close buffer" })


-- Visual-mode only: <space>/ toggles comment for the selection
map("x", "<leader>/", "gc", { remap = true, desc = "Toggle comment selection" })
