return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#d183e8",
			grey = "#303030",
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.black },
			},

			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white, bg = colors.black },
			},
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				icons_enabled = true,
				globalstatus = true,
				always_divide_middle = false,
				refresh = {
					statusline = 250,
					tabline = 1000,
					winbar = 1000,
				},
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
					winbar = {},
				},
			},
			sections = {
				lualine_a = {
					{ "mode", icon = "" },
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = colors.violet, gui = "bold" },
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						diff_color = {
							added = { fg = colors.cyan },
							modified = { fg = colors.blue },
							removed = { fg = colors.red },
						},
					},
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
						colored = true,
						update_in_insert = false,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
							newfile = "[New]",
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
							unix = "", -- Linux/Unix
							dos = "", -- Windows
							mac = "", -- MacOS
						},
					},
					{
						"filetype",
						colored = true,
						icon_only = false,
						icon = { align = "right" },
					},
				},
				lualine_y = {
					{
						"progress",
						color = { fg = colors.white, gui = "italic" },
					},
				},
				lualine_z = {
					{
						"location",
						icon = "",
						color = { fg = colors.black, bg = colors.violet, gui = "bold" },
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
			extensions = { "fugitive", "nvim-tree", "toggleterm", "quickfix" },
		})
	end,
}
