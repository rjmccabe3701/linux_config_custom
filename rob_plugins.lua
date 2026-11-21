-- Keep language integration in LazyVim extras instead of duplicating server setup.
local function toggle_netrw(current_file)
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "netrw" then
      if #vim.api.nvim_tabpage_list_wins(0) > 1 then
        vim.api.nvim_win_close(win, false)
      else
        vim.cmd.enew()
      end
      return
    end
  end
  local name = vim.api.nvim_buf_get_name(0)
  local directory = current_file and name ~= "" and vim.fn.fnamemodify(name, ":h") or vim.fn.getcwd()
  vim.cmd("topleft vsplit")
  vim.cmd("Explore " .. vim.fn.fnameescape(directory))
end

return {
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.editor.telescope" },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = { bashls = {}, pylsp = { enabled = false } },
    },
  },
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      { "<leader>S", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-\\>", function() require("telescope.builtin").grep_string() end, desc = "Grep string under cursor" },
    },
  },
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "bash", "c", "cpp", "python", "lua", "toml", "yaml" } } },
  { "mason-org/mason.nvim", opts = { ensure_installed = { "shellcheck", "shfmt", "clang-format" } } },
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { c = { "clang_format" }, cpp = { "clang_format" }, sh = { "shfmt" }, bash = { "shfmt" } } },
  },
  { "folke/noice.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = { notifier = { enabled = false }, explorer = { enabled = false } },
    keys = {
      { "<leader>e", function() toggle_netrw(true) end, desc = "Toggle netrw (Current File Dir)" },
      { "<leader>E", function() toggle_netrw(false) end, desc = "Toggle netrw (CWD)" },
    },
  },
}
