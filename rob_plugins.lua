return {
  {
    -- https://github.com/LazyVim/LazyVim/discussions/3191
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      {
        "<leader>S",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
}
