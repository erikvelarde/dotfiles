-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     "MunifTanjim/nui.nvim",
--     -- { "3rd/image.nvim", opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
--   },
--   lazy = false, -- neo-tree will lazily load itself
--   opts ={
--
--   }
--
-- }

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",

		config = function()
			local setup, nvimtree = pcall(require, "nvim-tree")
			if not setup then
				return
			end

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			vim.opt.termguicolors = true

			vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

			nvimtree.setup({
				on_attach = "default",
				respect_buf_cwd = false,
				renderer = {
					highlight_git = true,
					root_folder_label = false,
					icons = {
						glyphs = {
							folder = {
								arrow_closed = "",
								arrow_open = "",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "",
							},
						},
						webdev_colors = true,
					},
				},

				view = {
					side = "right",
					adaptive_size = true,
					width = 30,
					-- mappings = {
					--   list = { { key = "d", action = "trash" }, { key = "D", action = "remove" } },
					-- },
				},
				trash = {
					cmd = "trash",
					require_confirm = true,
				},
				actions = {
					open_file = {
						window_picker = {
							enable = true,
						},
					},
				},
				git = {
					ignore = false,
				},
			})
		end,
	},
}
