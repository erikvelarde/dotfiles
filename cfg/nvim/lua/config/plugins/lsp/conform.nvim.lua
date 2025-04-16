return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = false, -- don't use LSP formatting
			},
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				go = { "gofumpt" },
				python = { "black" },
				rust = { "rustfmt" },
				php = { "phpcsfixer" },
				java = { "clang_format" },
				blade = { "blade_formatter" },
				dart = { "ast_grep" }, -- if you use it for flutter
				-- Add other filetypes as needed
			},
			formatters = {
				prettier = {
					condition = function(ctx)
						return vim.fs.find({ ".eslintrc.js", ".eslintrc.cjs" }, { upward = true, path = ctx.filename })[1]
					end,
				},
			},
		})
	end,
}
