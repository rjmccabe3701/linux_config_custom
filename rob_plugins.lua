return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				-- pylsp = {
				-- settings = {
				-- 	pylsp = {
				-- 		-- configurationSources = {},
				-- 		-- plugins = {},
				-- 		plugins = {
				-- 			pyright = { enabled = true },
				-- 			ruff = { enabled = false },
				-- 			autopep8 = { enabled = false },
				-- 			black = { enabled = false },
				-- 			yapf = { enabled = false },
				-- 			flake8 = { enabled = false },
				-- 			mypy = { enabled = false },
				-- 			pyflakes = { enabled = false },
				-- 			pycodestyle = { enabled = false },
				-- 			jedi = { enabled = true },
				-- 			mccabe = { enabled = false },
				-- 			rope = { enabled = false },
				-- 		},
				-- 	},
				-- },
				--
				pylsp = {},
				gopls = {}, -- Basic setup for gopls
				clangd = {}, -- Basic setup for clangd
			},
			setup = {
				pylsp = function(_, opts)
					opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
						pylsp = {
							configurationSources = {},
							plugins = {
								pyright = { enabled = false },
								ruff = { enabled = false },
								autopep8 = { enabled = false },
								black = { enabled = false },
								yapf = { enabled = false },
								flake8 = { enabled = false },
								mypy = { enabled = false },
								pyflakes = { enabled = false },
								pycodestyle = { enabled = false },
								jedi = { enabled = false },
								jedi_completion = { enabled = false },
								jedi_hover = { enabled = false },
								jedi_references = { enabled = false },
								jedi_signature_help = { enabled = false },
								jedi_symbols = { enabled = false },
								mccabe = { enabled = false },
								rope = { enabled = false },
							},
						},
					})
					-- opts.settings = opts.settings or {}
					-- opts.settings.pylsp = opts.settings.pylsp or {}
					-- opts.settings.pylsp.configurationSources = {}
					-- opts.settings.pylsp.plugins = {
					-- 	pyright = { enabled = false },
					-- 	ruff = { enabled = false },
					-- 	autopep8 = { enabled = false },
					-- 	black = { enabled = false },
					-- 	yapf = { enabled = false },
					-- 	flake8 = { enabled = false },
					-- 	mypy = { enabled = false },
					-- 	pyflakes = { enabled = false },
					-- 	pycodestyle = { enabled = false },
					-- 	jedi = { enabled = false },
					-- 	jedi_completion = { enabled = false },
					-- 	jedi_hover = { enabled = false },
					-- 	jedi_references = { enabled = false },
					-- 	jedi_signature_help = { enabled = false },
					-- 	jedi_symbols = { enabled = false },
					-- 	-- jedi = { enabled = true },
					-- 	-- jedi_completion = { enabled = true },
					-- 	-- jedi_hover = { enabled = true },
					-- 	-- jedi_references = { enabled = true },
					-- 	-- jedi_signature_help = { enabled = true },
					-- 	-- jedi_symbols = { enabled = true },
					-- 	mccabe = { enabled = false },
					-- 	rope = { enabled = false },
					-- }
					-- -- return false
					-- -- return true -- Indicate that we've handled the setup for pylsp
				end,
			},
		},
		-- Adding this turned off LSP entirely ...
		-- config = function()
		-- 	require("lspconfig").pylsp.setup({
		-- 		on_attach = function(client, _)
		-- 			client.server_capabilities.documentFormattingProvider = false
		-- 			client.server_capabilities.documentRangeFormattingProvider = false
		-- 		end,
		-- 	})
		-- end,
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
	-- {
	-- 	-- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-austomizing-lsp-keymaps
	-- 	-- This doesn't work correctly. I wanted to fix the goto Defition
	-- 	-- so that it doesn't jump to a new tab if the file containing the def
	-- 	-- is open there. Revisit!
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = function()
	-- 		-- local keys = require("lazyvim.plugins.lsp.keymaps").get()
	-- 		-- keys[#keys + 1] = {
	-- 		-- 	"gd",
	-- 		-- 	function()
	-- 		-- 		return vim.lsp.buf.definition({ reuse_win = false })
	-- 		-- 	end,
	-- 		-- 	desc = "Rob Goto Defition",
	-- 		-- }
	-- 	end,
	-- },
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"rust",
				"ron",
			},
		},
	},
	{
		"Saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
		-- opts = {
		-- 	crates = {
		-- 		enabled = true,
		-- 	},
		-- 	lsp = {
		-- 		enabled = true,
		-- 		actions = true,
		-- 		completion = true,
		-- 		hover = true,
		-- 	},
		-- },
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"codelldb",
				"clangd",
				"clang-format",
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		enabled = false,
	},
	{
		--Disable the popup gui for running ex commands.
		--I've noticed that, sometimes, the editor fails to close
		-- with noice enabled
		"folke/noice.nvim",
		enabled = false,
	},
}
