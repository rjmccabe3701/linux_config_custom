local keymap = vim.keymap
local hop = require("hop")

hop.setup {
   multi_windows = true,
}

keymap.set({ "n", "v", "o" }, "F", "", {
  silent = true,
  noremap = true,
  callback = function()
    hop.hint_char2()
  end,
  desc = "nvim-hop char2",
})

-- vim.keymap.del({ "n", "v", "o" }, "f")
