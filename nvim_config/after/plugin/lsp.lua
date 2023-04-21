local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
--	"sumneko_lua",
	"clangd",
	"rust_analyzer",
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = {}
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  -- lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false }
  local keymap = vim.keymap
  local lsp = vim.lsp

  keymap.set("n", "gd", function() lsp.buf.definition() end, opts)
  keymap.set("n", "K", function() lsp.buf.hover() end, opts)
  keymap.set("n", "<leader>vws", function() lsp.buf.workspace_symbol() end, opts)
  keymap.set("n", "<leader>vd", function() lsp.diagnostic.open_float() end, opts)
  keymap.set("n", "[d", function() lsp.diagnostic.goto_next() end, opts)
  keymap.set("n", "]d", function() lsp.diagnostic.goto_prev() end, opts)
  keymap.set("n", "<leader>vca", function() lsp.buf.code_action() end, opts)
  keymap.set("n", "<leader>vrr", function() lsp.buf.references() end, opts)
  keymap.set("n", "<leader>vrn", function() lsp.buf.rename() end, opts)
  keymap.set("i", "<C-h>", function() lsp.buf.signature_help() end, opts)
end)



-- (Optional) Configure lua language server for neovim
--require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


 -- require'lspconfig'.lua_ls.setup {
 --   settings = {
 --     Lua = {
 --       runtime = {
 --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
 --         version = 'LuaJIT',
 --       },
 --       diagnostics = {
 --         -- Get the language server to recognize the `vim` global
 --         globals = {'vim'},
 --       },
 --       workspace = {
 --         -- Make the server aware of Neovim runtime files
 --         library = vim.api.nvim_get_runtime_file("", true),
 --       },
 --       -- Do not send telemetry data containing a randomized but unique identifier
 --       telemetry = {
 --         enable = false,
 --       },
 --     },
 --   },
 -- }
lsp.setup()
