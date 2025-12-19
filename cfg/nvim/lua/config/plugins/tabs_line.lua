return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("barbar").setup({
				animation = true,
				auto_hide = true,
				tabpages = true,
				closable = true,
				clickable = true,
				exclude_ft = { "qf", "fugitive" },
				exclude_name = { "package.json" },
				focus_on_close = "left",
				hide = { extensions = true, inactive = false },
				highlight_alternate = false,
				highlight_inactive_file_icons = false,
				highlight_visible = true,
				icons = {
					buffer_index = false,
					buffer_number = false,
					button = "",
					diagnostics = {
						[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
						[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
						[vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
						[vim.diagnostic.severity.HINT] = { enabled = true, icon = " " },
					},
					gitsigns = {
						added = { enabled = true, icon = "+" },
						changed = { enabled = true, icon = "~" },
						deleted = { enabled = true, icon = "-" },
					},
					filetype = {
						enabled = true,
						custom_colors = false,
					},
					separator = { left = "▎", right = "" },
					modified = { button = "●" },
					pinned = { button = "車", filename = true },
					alternate = { filetype = { enabled = false } },
					current = { buffer_index = false },
					inactive = { button = "×" },
					visible = { modified = { buffer_number = false } },
				},
				insert_at_end = false,
				insert_at_start = false,
				maximum_padding = 1,
				minimum_padding = 1,
				maximum_length = 30,
				minimum_length = 0,
				semantic_letters = true,
				letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
				no_name_title = nil,
			})

			vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { noremap = true, silent = true })
		end,
	},
}
