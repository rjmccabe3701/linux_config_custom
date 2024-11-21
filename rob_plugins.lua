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
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<C-\\>",
        mode = { "n" },
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Grep String Under Cursor",
      },
    },
    { "ellisonleao/gruvbox.nvim" },
    { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
  },
}
