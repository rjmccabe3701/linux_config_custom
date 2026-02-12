local function is_wsl()
	local uname = vim.fn.systemlist("uname -r")[1] or ""
	return uname:match("WSL") ~= nil
end

-- General UI/editor prefs
vim.opt.conceallevel = 0
vim.opt.relativenumber = false

-- LazyVim picker preference
vim.g.lazyvim_picker = "telescope"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.clipboard = "unnamedplus"
if is_wsl then
	-- WSL specific settings
	-- Add any other WSL-specific configurations here
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "xclip -i -selection clipboard",
			["*"] = "xclip -i -selection primary",
		},
		paste = {
			["+"] = "xclip -o -selection clipboard | sed 's/\r$//'",
			["*"] = "xclip -o -selection primary | sed 's/\r$//'",
		},
		cache_enabled = 0,
	}
else
	-- Non-WSL settings
	-- Your usual Neovim configuration
end

-- Rust diagnostics source preference (keep if you rely on LazyVim's knob; harmless otherwise).
-- rustaceanvim will still use rust-analyzer for full LSP.
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
