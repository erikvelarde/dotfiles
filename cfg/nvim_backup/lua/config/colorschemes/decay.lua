local style = "decayce" -- or another style of course
local colors = require("decay.core").get_colors(style)

require("decay").setup({
	style = style,
	cmp = {
		block_kind = true,
	},
	nvim_tree = {
		contrast = true,
	},
	italics = {
		code = true,
		comments = true,
	},
	palette_overrides = {
		background = "#191C1C",
		contrast = "#161919",
		statusline_bg = "#222626",
		lighter = "#2f3434",
		foreground = "#B1CCC9",
		cursorline = "#2f3434",
		comments = "#3F4947",
		cursor = "#B1CCC9",
		black = "#2D3130",
		red = "#e88693",
		green = "#4FDAD1",
		yellow = "#ecd3a0",
		blue = "#97b1e2",
		magenta = "#caabe6",
		cyan = "#93cee9",
		white = "#cbced3",
		brightblack = "#2f3434",
		brightred = "#e88693",
		brightgreen = "#4FDAD1",
		brightyellow = "#ecd3a0",
		brightblue = "#97b1e2",
		brightmagenta = "#caabe6",
		brightcyan = "#98d3ee",
		brightwhite = "#B1CCC9",
		accent = "#4FDAD1",
	},
})

vim.cmd.colorscheme("decayce")
