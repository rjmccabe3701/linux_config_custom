-- Load the neovim/lspconfig plugin
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

require'lspconfig'.clangd.setup{}
require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
