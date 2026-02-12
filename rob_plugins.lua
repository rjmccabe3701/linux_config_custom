return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				pylsp = {},
				gopls = {},
				clangd = {},
			},
		},
	},
	{
		"nvim-mini/mini.pairs",
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
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5",
	-- 	ft = { "rust" },
	-- 	config = function()
	-- 		vim.g.rustaceanvim = {
	-- 			server = {
	-- 				default_settings = {
	-- 					["rust-analyzer"] = {
	-- 						cargo = { allFeatures = true },
	-- 						checkOnSave = { command = "clippy" },
	-- 						procMacro = { enable = true },
	-- 					},
	-- 				},
	-- 				on_attach = function(_, bufnr)
	-- 					local opts = { buffer = bufnr }
	-- 					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	-- 					vim.keymap.set("n", "<leader>re", function()
	-- 						vim.cmd("RustLsp explainError")
	-- 					end, opts)
	-- 				end,
	-- 			},
	-- 		}
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"rust",
				"ron",
				"toml",
				"yaml",
			},
		},
	},
	-- {
	-- 	"Saecki/crates.nvim",
	-- 	tag = "stable",
	-- 	ft = { "toml" },
	-- 	config = function()
	-- 		require("crates").setup({
	-- 			lsp = { enabled = true, actions = true, completion = true, hover = true },
	-- 		})
	-- 	end,
	-- },
	{
		"mason.org/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"codelldb",
				"clangd",
				"clang-format",
				"prettier",
				"taplo",
			},
		},
	},
	{
		--Disable the popup gui for running ex commands.
		--I've noticed that, sometimes, the editor fails to close
		-- with noice enabled
		"folke/noice.nvim",
		enabled = false,
	},
}
