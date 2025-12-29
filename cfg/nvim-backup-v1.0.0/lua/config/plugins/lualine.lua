return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { gui = "bold" },
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_c = {
					{
						"filename",
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = {
					{
						"encoding",
						fmt = string.upper,
						color = { gui = "bold" },
					},
					{
						"fileformat",
						symbols = {
							unix = "",
							dos = "",
							mac = "",
						},
					},
					{
						"filetype",
						icon_only = false,
						colored = true,
					},
				},
				lualine_y = { "progress" },
				lualine_z = {
					{
						"location",
						icon = "",
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
