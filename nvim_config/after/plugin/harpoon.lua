local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>a", mark.add_file,
   { desc = "harpoon add filee" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu,
   { desc = "harpoon menu" })
vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end,
   { desc = "harpoon nav 1st file" })
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end,
   { desc = "harpoon nav 2nd file" })
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end,
   { desc = "harpoon nav 3rd file" })
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end,
   { desc = "harpoon nav 4th file" })
