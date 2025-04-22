require("onedarkpro").setup({
	style = "dark",
	styles = {
		types = "NONE",
		methods = "NONE",
		numbers = "NONE",
		strings = "italic",
		comments = "italic",
		keywords = "bold,italic",
		constants = "NONE",
		functions = "italic",
		operators = "NONE",
		variables = "NONE",
		parameters = "NONE",
		conditionals = "italic",
		virtual_text = "NONE",
	},
})
-- require("onedark").load()

vim.cmd("colorscheme onedark_dark")
