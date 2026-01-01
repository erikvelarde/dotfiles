return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Add this BEFORE lualine setup
		vim.opt.laststatus = 3 -- Global statusline (removes padding between windows)
		vim.opt.showmode = false -- Don't show mode in command line (redundant with lualine)
		vim.opt.cmdheight = 0 -- Minimal command line (hides when not in use)

		-- OR use cmdheight = 1 if you prefer to always see command line
		-- vim.opt.cmdheight = 1

		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true, -- Keep this true (single statusline)
				refresh = { statusline = 1000 },
				-- Optional: disable padding in sections
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
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
							local mode_colors = {
								n = { fg = "#000000", bg = "#7aa2f7", gui = "bold" },
								i = { fg = "#000000", bg = "#73daca", gui = "bold" },
								v = { fg = "#000000", bg = "#bb9af7", gui = "bold" },
								c = { fg = "#000000", bg = "#e0af68", gui = "bold" },
								r = { fg = "#000000", bg = "#f7768e", gui = "bold" },
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
						path = 1,
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
