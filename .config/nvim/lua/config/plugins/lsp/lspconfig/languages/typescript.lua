require("config.plugins.lsp.lspconfig.config.on_attach")

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
