return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	config = function()
		vim.g.tmux_navigator_no_mappings = 1

		vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Go to left pane" })
		vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Go to down pane" })
		vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Go to up pane" })
		vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Go to right pane" })
	end,
}
