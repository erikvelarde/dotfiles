return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"ThePrimeagen/harpoon",
	},
	config = function()
		-- import telescope plugin safely
		local telescope = require("telescope")

		-- import telescope actions safely
		local actions = require("telescope.actions")

		-- configure telescope
		telescope.setup({
			defaults = {
				-- TRANSPARENCY SETTINGS
				-- winblend = 10, -- Add this: 0-100 transparency (higher = more transparent)
				border = true,
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

				file_ignore_patterns = { "node_modules", ".git", "__pycache__", "*.class", "bin", "target" },
				path_display = { "truncate" },
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["q"] = require("telescope.actions").close,
						["d"] = require("telescope.actions").delete_buffer,
						["J"] = require("telescope.actions").preview_scrolling_down,
						["K"] = require("telescope.actions").preview_scrolling_up,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("harpoon")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files initial_mode=insert <cr>",
			{ desc = "Fuzzy find files in cwd" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope buffers sort_lastused=true initial_mode=normal theme=ivy<cr>",
			{ desc = "Show open buffers" }
		)
		keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" })
		keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" })
		keymap.set(
			"n",
			"<leader>gfc",
			"<cmd>Telescope git_bcommits<cr>",
			{ desc = "Show git commits for current buffer" }
		)
		keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Show git branches" })
		keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Show current git changes per file" })
	end,
}
