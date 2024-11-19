-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- keymap shortcuts
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- navigation zz shortcuts
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste without storing it into register
keymap.set("x", "<leader>p", [["_dP]])

-- <leader><C-a> to increment the number.
-- By default, C-a is the shortcut. Since, tmux prefix is C-a, its coliding
vim.keymap.set("n", "<leader><C-a>", "<C-a>", { noremap = true, silent = true, desc = "Increment number (Ctrl-A)" })

-- increment/ decrement the size of window
-- Resize window using arrow keys
keymap.set("n", "<Up>", ":resize +2<CR>", { noremap = true, silent = true })
keymap.set("n", "<Down>", ":resize -2<CR>", { noremap = true, silent = true })
keymap.set("n", "<Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
keymap.set("n", "<Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Leetcode keymaps
keymap.set("", "<leader>'", ":Leet run<CR>", { noremap = true, silent = true })
keymap.set("", "<leader><CR>", ":Leet submit<CR>", { noremap = true, silent = true })
