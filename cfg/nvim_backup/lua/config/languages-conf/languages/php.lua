-- require("lspconfig").intelephense.setup({
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
-- })
-- require("lspconfig").intelephense.setup({
--   settings = {
--     intelephense = {
--       format = {
--         enable = false,
--       },
--     },
--   },
--   on_init = function(client)
--     client.server_capabilities.documentFormattingProvider = false
--   end,
-- })
local lspconfig = require("lspconfig")
lspconfig.intelephense.setup({
	capabilities = capabilities,
	-- cmd = { "intelephense", "--stdio" },
	-- filetypes = { "php" },
	-- root_pattern = { "composer.json", ".git" },

	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,
})
