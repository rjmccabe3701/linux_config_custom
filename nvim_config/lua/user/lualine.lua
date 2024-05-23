-- Use standard form to handle errors on 'require' of llualine
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.print("lualine plugin not found.")
  return
end

-- Use onedark theme built into lualine. Possibly customize later 
-- when I know more...
local onedark = require'lualine.themes.onedark'
lualine.setup {
  options = { theme  = onedark },
}
