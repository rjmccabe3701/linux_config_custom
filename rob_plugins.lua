return {
	{ "cappyzawa/trim.nvim", opts = {} },
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				exclude = {},
				hidden = false,
				ignored = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				pylsp = {
					settings = {
						pylsp = {
							configurationSources = { "ruff" },
							plugins = {
								black = { enabled = false },
								autopep8 = { enabled = true },
								yapf = { enabled = true },
								flake8 = {
									enabled = true,
									ignore = { "E302", "E402", "F401", "F403", "F405" },
								},
								pyflakes = { enabled = false },
								ruff = { enabled = false },
								pycodestyle = {
									enabled = true,
									ignore = { "E302", "E402" },
								},
							},
						},
					},
				},
				gopls = {},
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--completion-style=detailed",
						"--log=error",
						"--header-insertion=never",
					},
					filetypes = { "c", "cpp", "objc", "objcpp" },
					root_markers = {
						".clangd",
						".clang-tidy",
						".clang-format",
						"compile_commands.json",
						"compile_flags.txt",
						"configure.ac", -- AutoTools
						".git",
					},
					settings = {
						clangd = {
							fallbackFlags = { "-std=c++20" },
							excludeFiles = { "*.proto" },
						},
					},
				},
				rust_analyzer = {},
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
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
		opts = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>cR", function()
						vim.cmd.RustLsp("codeAction")
					end, { desc = "Code Action", buffer = bufnr })
					vim.keymap.set("n", "<leader>dr", function()
						vim.cmd.RustLsp("debuggables")
					end, { desc = "Rust Debuggables", buffer = bufnr })
				end,
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = { enable = true },
						},
						procMacro = { enable = true },
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "rust", "ron" },
		},
	},
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = { crates = { enabled = true } },
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"codelldb",
				"clangd",
				"clang-format",
				"prettier",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {}, -- You can customize views, messages, etc. here
		dependencies = {
			"MunifTanjim/nui.nvim", -- Required for UI rendering
			"rcarriga/nvim-notify", -- Optional: for notification popups
		},
	},
	{
		"stevearc/conform.nvim",
		opts = function()
			return {
				formatters_by_ft = {
					lua = { "stylua" },
					cpp = { "clang_format" },
					c = { "clang_format" },
					-- markdown = { "prettierd", "prettier" },
					markdown = { "prettier" },
				},
				-- format_on_save = { timeout_ms = 500, lsp_fallback = true },
				formatters = {
					clang_format = {
						command = vim.fn.stdpath("data") .. "/mason/bin/clang-format",
						args = { "--style=file" },
					},
					prettier = {
						command = "prettier",
						args = {
							"--stdin-filepath",
							"$FILENAME",
							"--prose-wrap",
							"always",
							"--print-width",
							"80",
							"--tab-width",
							"2",
							"--use-tabs",
							"false",
						},
					},
					-- prettierd = {
					-- 	command = "prettierd",
					-- 	args = { "$FILENAME" },
					-- },
				},
			}
		end,
	},
}
