return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				go = { "ast_grep" },
				python = { "black" },
				rust = { "ast_grep" },
				php = { "phpcsfixer" },
				java = { "ast_grep", "clang_format" },
				blade = { "blade_formatter" },
				dart = { "ast_grep" }, -- if you use it for flutter
				-- Add other filetypes as needed
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 3000,
				async = false,
			},
		})
	end,
}
