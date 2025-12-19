return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local setup, nvimtree = pcall(require, "nvim-tree")
		if not setup then
			return
		end

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		nvimtree.setup({
			on_attach = "default",
			respect_buf_cwd = false,
			renderer = {
				highlight_git = true,
				root_folder_label = false,
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						item = "│ ",
						none = "  ",
					},
				},
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "M",
							staged = "S",
							unmerged = "U",
							renamed = "R",
							untracked = "?",
							deleted = "D",
							ignored = "I",
						},
					},
					webdev_colors = true,
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			},
			view = {
				side = "right",
				adaptive_size = true,
				width = 30,
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
}
