return {
	-- {
	--   "mhartington/oceanic-next",
	--   lazy = false,
	--   priority = 1000,
	-- },
	-- {
	--   "bluz71/vim-nightfly-guicolors",
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   opts = {},
	-- },
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- opts = {},
	},
	{
		"dasupradyumna/midnight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Lua
			require("onedark").setup({
				style = "deep",
			})
			require("onedark").load()
		end,
	},
}
