require("config.languages-conf.config.on_attach")

require("lspconfig").ts_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
