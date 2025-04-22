return {
	-- {
	--   "iamcco/markdown-preview.nvim",
	--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	--   build = "cd app && yarn install",
	--   init = function()
	--     vim.g.mkdp_filetypes = { "markdown" }
	--   end,
	--   ft = { "markdown" },
	-- },

	"lukas-reineke/headlines.nvim",
	after = "nvim-treesitter",
	config = function()
		require("headlines").setup()
	end,
}
