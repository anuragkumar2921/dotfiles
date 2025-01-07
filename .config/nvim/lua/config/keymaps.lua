-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

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
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- increment/ decrement the size of window
-- Resize window using arrow keys
keymap.set("n", "<Up>", ":resize +2<CR>", opts)
keymap.set("n", "<Down>", ":resize -2<CR>", opts)
keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)

-- Leetcode keymaps
keymap.set("", "<leader>'", ":Leet run<CR>", opts)
keymap.set("", "<leader><CR>", ":Leet submit<CR>", opts)

-- paste content to the next line
keymap.set("n", "<C-p>", "o<Esc>p", opts)

-- tabs
keymap.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap.set("n", "<leader><tab><tab>", "g<tab>", { desc = "go to Last visited Tab" })
keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "go to Next Tab" })
keymap.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "go to Previous Tab" })
