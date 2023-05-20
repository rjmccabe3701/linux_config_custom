vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

if true then
end

--Move visual selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visually selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visually selected lines up" })

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines; leave cursor where it was" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down; keep cursor in middle of screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up; keep cursor in middle of screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next searched item; keep cursor in the middle of screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev searched iterm; keep cursor in the middle of screen" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "keep value in register when pasting" })


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
