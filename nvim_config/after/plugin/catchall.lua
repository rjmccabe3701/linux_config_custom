local keymap = vim.keymap
-- require('nord').setup()
vim.cmd("PackerLoad nord.nvim")

keymap.set("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "remove trailing space" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "focus pane left"})
keymap.set("n", "<C-j>", "<C-w>j", { desc = "focus pane down"})
keymap.set("n", "<C-l>", "<C-w>l", { desc = "focus pane right"})
keymap.set("n", "<C-k>", "<C-w>k", { desc = "focus pane up"})

require('gitsigns').setup {}
