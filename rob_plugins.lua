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
	},
	{ "ellisonleao/gruvbox.nvim" },
	{ "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
	{
		-- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
		-- This doesn't work correctly. I wanted to fix the goto Defition
		-- so that it doesn't jump to a new tab if the file containing the def
		-- is open there. Revisit!
		"neovim/nvim-lspconfig",
		opts = function()
			-- local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- keys[#keys + 1] = {
			-- 	"gd",
			-- 	function()
			-- 		return vim.lsp.buf.definition({ reuse_win = false })
			-- 	end,
			-- 	desc = "Rob Goto Defition",
			-- }
		end,
	},
}
