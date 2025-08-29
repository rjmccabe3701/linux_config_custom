return {
	{
		"cappyzawa/trim.nvim",
		opts = {},
	},
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				exclude = {}, -- remove all exclusions
				hidden = false, -- show dotfiles
				ignored = true, -- show .gitignored files
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
							-- configurationSources = { "flake8" },
							-- plugins = {
							-- 	black = { enabled = false },
							-- 	autopep8 = { enabled = true },
							-- 	yapf = { enabled = true },
							-- 	flake8 = {
							-- 		enabled = true,
							-- 		ignore = { "E302", "E402", "F401", "F403", "F405" },
							-- 	},
							-- 	pyflakes = { enabled = false },
							-- 	pycodestyle = {
							-- 		enabled = true,
							-- 		ignore = { "E302", "E402" },
							-- 	},
							-- },
						},
					},
				},
				gopls = {}, -- Basic setup for gopls
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--completion-style=detailed",
						"--log=error",
					},
					filetypes = { "c", "cpp", "objc", "objcpp" }, -- Ensure `.proto` is not included
					root_dir = require("lspconfig.util").root_pattern(
						"compile_commands.json",
						"compile_flags.txt",
						".git"
					),
					-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = {
						clangd = {
							fallbackFlags = { "-std=c++20" }, -- Adjust based on your C++ version
							excludeFiles = { "*.proto" }, -- Helps prevent clangd errors with proto files
						},
					},
				},
				rust_analyzer = {},
			},
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
			ensure_installed = {
				"rust",
				"ron",
			},
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
