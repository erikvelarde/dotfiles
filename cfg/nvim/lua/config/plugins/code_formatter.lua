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
				-- php = { "php" },
				php = { "php_cs_fixer" },
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
		formatters = {
			-- ["php"] = {
			-- 	command = "php",
			-- 	args = {
			-- 		vim.fn.stdpath("data") .. "/mason/packages/pretty-php/pretty-php.phar", -- Mason path
			-- 		"fix",
			-- 		"--indent-style=space",
			-- 		"$FILENAME",
			-- 		"--indent-size=4",
			-- 	},
			-- },
		}

		-- formatters = {
		--   -- Stylua with custom config
		--   stylua = {
		--     command = "stylua",
		--     args = {
		--       "--config-path",
		--       vim.fn.expand("~/.config/nvim/formatters_config/stylua.toml"), -- Global config
		--       "-",
		--     },
		--     condition = function(ctx)
		--       -- Only format if stylua exists
		--       return vim.fn.executable("stylua") == 1
		--     end,
		--   },
		-- }
	end,
}
