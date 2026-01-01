require("vesper").setup({
	transparent = true, -- Boolean: Sets the background to transparent
	italics = {
		comments = false, -- Boolean: Italicizes comments
		keywords = false, -- Boolean: Italicizes keywords
		functions = false, -- Boolean: Italicizes functions
		strings = false, -- Boolean: Italicizes strings
		variables = false, -- Boolean: Italicizes variables
	},
	overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
	palette_overrides = {},
})

require("vesper").colorscheme()
-- vim.cmd.colorscheme("vesper")
--
require("lualine").setup({
	highlights = require("vesper").bufferline.highlights,
})
