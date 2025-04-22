return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")

		mason.setup()
		-- actions
		---@diagnostic disable-next-line: undefined-global
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<C-c>", vim.lsp.buf.code_action, {})
		-- vim.keymap.set("n", "<leader>d", vim.diagnostic.get_namespaces(), {})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				-- "cssls",
				"emmet_ls",
				-- "tsserver",
				"pyright",
				-- "zls", -- zig
				-- "intelephense",
				"rust_analyzer",
				"angularls",
				-- "jdtls",
				-- "gopls",
				"dockerls",
				"tailwindcss",
				"marksman",
			},
			automatic_installation = true,
		})

		mason_null_ls.setup({
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"black",
				"gofumt",
				"clang-format",
				"php-cs-fixer",
				"rustfmt",
				"ast_grep",
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})
	end,
}
