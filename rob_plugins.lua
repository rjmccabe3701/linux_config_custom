return {

	-----------------------------------------------------------------------------
	-- Theme
	-----------------------------------------------------------------------------
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },

	-----------------------------------------------------------------------------
	-- LSP
	-----------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- You’re on nightly; inlay hints are solid now, but if you dislike them, keep this.
			inlay_hints = { enabled = false },

			servers = {
				pylsp = {},
				gopls = {},
				clangd = {},
				-- NOTE: rust-analyzer is handled by rustaceanvim / LazyVim rust extra.
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
							},
						},
					},
				},
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Editing UX
	-----------------------------------------------------------------------------
	{ "nvim-mini/mini.pairs", enabled = false },

	{
		"folke/flash.nvim",
		keys = {
			-- Disable defaults:
			{ "s", mode = { "n", "x", "o" }, false },
			{ "S", mode = { "n", "x", "o" }, false },

			-- Your explicit mapping:
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
				mode = "n",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Grep string under cursor",
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Treesitter (languages only)
	-----------------------------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"rust",
				"ron",
				"toml",
				"yaml",
			})
		end,
	},

	-----------------------------------------------------------------------------
	-- Mason (formatters/linters/debuggers/tools)
	-----------------------------------------------------------------------------
	-- LazyVim already includes mason + mason-lspconfig; you only need to extend config.
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				-- Lua
				"stylua",

				-- Shell
				"shellcheck",
				"shfmt",

				-- Web / misc
				"prettier",

				-- C/C++
				"clangd",
				"clang-format",

				-- Rust support tools
				"codelldb",
				"taplo",
			})
		end,
	},

	-----------------------------------------------------------------------------
	-- Rust: rustaceanvim (nightly-friendly, great RA integration)
	-----------------------------------------------------------------------------
	-- This is not compatible with lazyvim. To get this, install lang.rust
	-- via :LazyExtras
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^4",
	-- 	ft = { "rust" },
	-- 	config = function()
	-- 		vim.g.rustaceanvim = {
	-- 			tools = {
	-- 				hover_actions = { auto_focus = true },
	-- 			},
	-- 			server = {
	-- 				-- rustaceanvim will start rust-analyzer; prefer rustup rust-analyzer on nightly.
	-- 				-- Make sure you have: rustup component add rust-analyzer rustfmt clippy
	-- 				settings = {
	-- 					["rust-analyzer"] = {
	-- 						cargo = { allFeatures = true },
	-- 						checkOnSave = {
	-- 							command = "clippy",
	-- 						},
	-- 					},
	-- 				},
	-- 				on_attach = function(_, bufnr)
	-- 					local map = function(lhs, rhs, desc)
	-- 						vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
	-- 					end
	--
	-- 					map("<leader>rr", function()
	-- 						vim.cmd("RustLsp run")
	-- 					end, "Rust: Run")
	--
	-- 					map("<leader>rd", function()
	-- 						vim.cmd("RustLsp debug")
	-- 					end, "Rust: Debug")
	--
	-- 					-- Rustfmt on demand (useful even if you also format on save)
	-- 					map("<leader>rf", function()
	-- 						vim.cmd("RustLsp format")
	-- 					end, "Rust: Format")
	-- 				end,
	-- 			},
	-- 		}
	-- 	end,
	-- },

	-----------------------------------------------------------------------------
	-- Disable Noice (per your stability preference)
	-----------------------------------------------------------------------------
	{ "folke/noice.nvim", enabled = false },

	{
		"folke/snacks.nvim",
		opts = {
			notifier = { enabled = false },
			explorer = { enabled = false },
		},
		keys = {
			-- 1. Unbind the default Snacks explorer keymaps
			{ "<leader>e", false },
			{ "<leader>E", false },
			{ "<leader>e", false },
			{ "<leader>E", false },

			-- 2. Lowercase 'e' (Smart Toggle for Current File Directory)
			{
				"<leader>e",
				function()
					-- Check if a netrw sidebar buffer is already open anywhere
					local netrw_open = false
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].filetype == "netrw" then
							netrw_open = true
							break
						end
					end

					if netrw_open then
						vim.cmd("Lexplore") -- If open, calling Lexplore with no arguments will close it cleanly
					else
						vim.cmd("Lexplore %:p:h") -- If closed, open the active file's directory
					end
				end,
				desc = "Toggle netrw (Current File Dir)",
			},

			-- 3. Uppercase 'E' (Native Toggle for Workspace Root)
			{
				"<leader>E",
				"<cmd>Lexplore<cr>",
				desc = "Toggle netrw (Root CWD)",
			},
		},
	},
}
