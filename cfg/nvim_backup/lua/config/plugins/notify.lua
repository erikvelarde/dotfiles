return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			stages = "fade_in_slide_out",
			background_colour = "FloatShadow",
			timeout = 500,
			top_down = false,
			max_width = 40,
			-- max_height = 30,
		})
		-- vim.notify = require("notify")
	end,
}
