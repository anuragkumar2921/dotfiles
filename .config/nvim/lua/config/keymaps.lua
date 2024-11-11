-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- keymap shortcuts
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Leetcode keymaps
keymap.set("", "<leader>'", ":Leet run<CR>", { noremap = true, silent = true })
keymap.set("", "<leader><CR>", ":Leet submit<CR>", { noremap = true, silent = true })
