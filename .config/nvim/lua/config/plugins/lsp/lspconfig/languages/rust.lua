require("config.plugins.lsp.lspconfig.config.on_attach")

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
