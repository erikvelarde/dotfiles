return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" }, -- Nerd font triangles as section separators
				globalstatus = true,
				refresh = { statusline = 1000 },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							-- Single letter mode indicators
							local mode_letters = {
								n = "N",
								i = "I",
								v = "V",
								V = "V",
								[""] = "V",
								c = "C",
								r = "R",
								s = "S",
								t = "T",
							}
							return mode_letters[str] or str:sub(1, 1):upper()
						end,
						padding = { left = 1, right = 1 },
						color = function()
							-- Color-coded mode indicators
							local mode_colors = {
								n = { fg = "#000000", bg = "#7aa2f7", gui = "bold" }, -- Blue
								i = { fg = "#000000", bg = "#73daca", gui = "bold" }, -- Teal
								v = { fg = "#000000", bg = "#bb9af7", gui = "bold" }, -- Purple
								c = { fg = "#000000", bg = "#e0af68", gui = "bold" }, -- Yellow
								r = { fg = "#000000", bg = "#f7768e", gui = "bold" }, -- Red
							}
							return mode_colors[vim.fn.mode()] or { fg = "#ffffff", bg = "#444444", gui = "bold" }
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = "#bb9af7" },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1, -- Relative path (shows parent folder)
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
						padding = { left = 1, right = 1 },
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					{
						"location",
						icon = "",
						padding = { left = 1, right = 1 },
						fmt = function()
							return string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))
						end,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
