-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-organize imports on save for multiple languages
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_imports", { clear = true }),
  pattern = { "*.java" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    })
  end,
})
