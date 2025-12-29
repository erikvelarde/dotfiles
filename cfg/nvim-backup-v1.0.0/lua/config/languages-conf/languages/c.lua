require("lspconfig").clangd.setup({
	-- cmd = {
	--   "clangd",
	--   "--background-index",
	--   "--clang-tidy",
	--   "--header-insertion=never",
	--   "--query-driver=/usr/bin/clang*,/usr/bin/gcc*",
	--   "--compile-commands-dir=build",
	-- },
	cmd = { "clangd", "--compile-commands-dir=build" },
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
