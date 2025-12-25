return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- Force hide tabline from the start
			vim.opt.showtabline = 0

			require("barbar").setup({
				animation = true,
				auto_hide = false, -- Changed to false to prevent auto-show behavior
				tabpages = true,
				closable = true,
				clickable = true,
				exclude_ft = { "qf", "fugitive" },
				exclude_name = { "package.json" },
				focus_on_close = "left",
				hide = {
					extensions = true,
					inactive = true, -- Hide inactive buffers
					current = false, -- Show current buffer
					alternate = false, -- Show alternate buffers
					visible = true, -- Hide when visible in splits
				},
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

			-- Create augroup to ensure tabline stays hidden
			local tabline_augroup = vim.api.nvim_create_augroup("BarbarTablineControl", { clear = true })

			-- Hide tabline on various events that might trigger Barbar to show it
			vim.api.nvim_create_autocmd({
				"BufAdd",
				"BufEnter",
				"BufWinEnter",
				"TabNew",
				"TabEnter",
				"WinEnter",
				"VimResized",
				"FileType",
			}, {
				group = tabline_augroup,
				callback = function()
					vim.schedule(function()
						vim.opt.showtabline = 0
					end)
				end,
			})

			-- Also ensure tabline is hidden on startup
			vim.api.nvim_create_autocmd("VimEnter", {
				group = tabline_augroup,
				callback = function()
					vim.opt.showtabline = 0
				end,
				once = true,
			})

			-- Key mappings
			vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-2", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-1>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
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
			vim.keymap.set("n", "<A-2>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<A-1>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { noremap = true, silent = true })

			-- Optional: Add a command to toggle tabline if you ever want to see it
			vim.api.nvim_create_user_command("ToggleTabline", function()
				if vim.opt.showtabline:get() == 0 then
					vim.opt.showtabline = 2
					vim.notify("Tabline shown", vim.log.levels.INFO)
				else
					vim.opt.showtabline = 0
					vim.notify("Tabline hidden", vim.log.levels.INFO)
				end
			end, {})
		end,
	},
}
