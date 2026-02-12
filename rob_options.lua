local is_wsl = (function()
	local output = vim.fn.systemlist("uname -r")
	return not not string.find(output[1] or "", "WSL")
end)()

vim.opt.clipboard = "unnamedplus"
if is_wsl then
	-- WSL specific settings
	-- Add any other WSL-specific configurations here
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			-- Too slow
			-- ["+"] = "clip.exe",
			-- ["*"] = "clip.exe",

			["+"] = "xclip -i -selection clipboard",
			["*"] = "xclip -i -selection primary",
		},
		paste = {
			--This is too slow
			-- ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			-- ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',

			-- This doesn't work for whatever reason
			-- ["+"] = 'xclip -o -selection clipboard | tr -d "\r"',
			-- ["*"] = 'xclip -o -selection primary | tr -d "\r"',

			-- This works, but puts ^M at the end of lines ...
			["+"] = "xclip -o -selection clipboard",
			["*"] = "xclip -o -selection primary",
		},
		cache_enabled = 0,
	}
else
	-- Non-WSL settings
	-- Your usual Neovim configuration
end

vim.opt.conceallevel = 0
vim.opt.relativenumber = false
-- LSP Server to use for Rust.
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
vim.g.lazyvim_picker = "telescope"

-- Use rust-analyzer for diagnostics
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-----------------------------------
-- Command for formating files to 80 characters
-- To use:
--  1. Select the comment block in visual mode (V then move down).
--  2. Press gq to reformat.

-- For formatting C++ comments:
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "cpp",
-- 	callback = function()
-- 		vim.opt_local.textwidth = 80
-- 		vim.opt_local.formatoptions:append("tcq")
-- 		vim.opt_local.formatoptions:remove("l") -- disables long-line preservation
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.md",
-- 	callback = function()
-- 		vim.cmd("silent normal! gggqG")
-- 	end,
-- })
-- For formatting markdown files:
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function()
-- 		vim.opt_local.textwidth = 80
-- 		vim.opt_local.formatoptions:append("tcqn")
-- 		vim.opt_local.formatoptions:remove("l") -- disables long-line preservation
-- 	end,
-- })
-- What the options do:
--t: auto-wrap text using textwidth
--c: wrap comments
--q: allow formatting with gq
--l: removed so short lines get joined
--n: Formats numbered lists (like 1., 2., etc.) correctly. This is a crucial addition for Markdown.
-----------------------------------
