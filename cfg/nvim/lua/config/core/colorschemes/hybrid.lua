-- Default options:
require("hybrid").setup({
	terminal_colors = true,
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		emphasis = true,
		comments = true,
		folds = true,
	},
	strikethrough = true,
	inverse = true,
	transparent = true,
	overrides = function(highlights, colors) end,
})

vim.cmd("colorscheme hybrid")
