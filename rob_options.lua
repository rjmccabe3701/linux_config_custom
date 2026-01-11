local is_wsl = (function()
	local output = vim.fn.systemlist("uname -r")
	return (output[1] or ""):find("WSL") ~= nil
end)()

vim.opt.clipboard = "unnamedplus"

if is_wsl then
	-- Prefer win32yank if installed (fast + correct)
	local win32yank = vim.fn.executable("win32yank.exe") == 1

	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = win32yank and "win32yank.exe -i --crlf" or "clip.exe",
			["*"] = win32yank and "win32yank.exe -i --crlf" or "clip.exe",
		},
		paste = {
			["+"] = win32yank and "win32yank.exe -o --lf" or "powershell.exe -NoProfile -Command Get-Clipboard -Raw",
			["*"] = win32yank and "win32yank.exe -o --lf" or "powershell.exe -NoProfile -Command Get-Clipboard -Raw",
		},
		cache_enabled = 1,
	}

	-- If you end up using the PowerShell fallback, strip CR explicitly:
	if not win32yank then
		vim.g.clipboard.paste["+"] = 'powershell.exe -NoProfile -Command Get-Clipboard -Raw | tr -d "\r"'
		vim.g.clipboard.paste["*"] = 'powershell.exe -NoProfile -Command Get-Clipboard -Raw | tr -d "\r"'
	end
end

vim.opt.conceallevel = 0
vim.opt.relativenumber = false
