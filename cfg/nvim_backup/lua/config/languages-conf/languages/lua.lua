-- -- configure lua server (with special settings)
-- lspconfig["sumneko_lua"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = { -- custom settings for lua
--     Lua = {
--       -- make the language server recognize "vim" global
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         -- make language server aware of runtime files
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.stdpath("config") .. "/lua"] = true,
--         },
--       },
--     },
--   },
-- })
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- require("neodev").setup({
--   -- add any options here, or leave empty to use the default settings
-- })

-- then setup your lsp server as usual
local lspconfig = require("lspconfig")

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
