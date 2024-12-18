-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- buffers
if Util.has("bufferline.nvim") then
  vim.keymap.del("n", "<S-h>")
  vim.keymap.del("n", "<S-l>")
  vim.keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  vim.keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  vim.keymap.del("n", "<S-h>")
  vim.keymap.del("n", "<S-l>")
  vim.keymap.set("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  vim.keymap.set("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- vim.keymap.set({ "n", "x" }, "<C-u>", "<C-u>zz", { remap = true })
-- vim.keymap.set({ "n", "x" }, "<C-d>", "<C-d>zz", { remap = true })
-- vim.keymap.set({ "n", "x" }, "<C-f>", "<C-f>zz", { remap = true })
-- vim.keymap.set({ "n", "x" }, "<C-b>", "<C-b>zz", { remap = true })
