-- Personal preferences. LazyVim owns the remaining defaults.
vim.opt.conceallevel = 0
vim.opt.relativenumber = false
vim.g.lazyvim_picker = "telescope"
-- vim.g.lazyvim_python_lsp = "pyright"
-- Let Neovim detect pbcopy/pbpaste on macOS and available providers elsewhere.
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_user_command("MessagesBuffer", function()
	local messages = vim.api.nvim_exec2("messages", { output = true }).output
	vim.cmd.new()
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(messages, "\n", { plain = true }))
end, {})
