return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },

	{

		"sainnhe/gruvbox-material",
		enabled = true,
		priority = 1000,
	},

	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	-- { "Shatur/neovim-ayu", priority = 1000 },
	--
	-- { "rafamadriz/neon", priority = 1000 },

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
	-- {
	--   "folke/tokyonight.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	-- },
	-- {
	--   "marko-cerovac/material.nvim",
	--   lazy = false,
	--   priority = 1000,
	-- },
	-- {
	--   "dasupradyumna/midnight.nvim",
	--   lazy = false,
	--   priority = 1000,
	-- },
	{
		-- "navarasu/onedark.nvim",
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- { "rebelot/kanagawa.nvim" },
	-- { "decaycs/decay.nvim", as = "decay" },
	-- {
	--   "HoNamDuong/hybrid.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	-- },
}
