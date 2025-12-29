require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})
