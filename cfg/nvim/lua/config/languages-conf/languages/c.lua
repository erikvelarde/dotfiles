-- require("lspconfig").clangd.setup({
--
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
-- })
require("lspconfig").clangd.setup({
	cmd = { "clangd", "--compile-commands-dir=build" },
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
