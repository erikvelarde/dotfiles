return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- REMOVED: "rcarriga/nvim-notify" - Don't use notify at all
	},
	config = function()
		require("noice").setup({
			-- DISABLE notifications completely
			notify = {
				enabled = false, -- This is the key setting!
			},

			-- Minimal cmdline only
			cmdline = {
				enabled = true,
				view = "cmdline", -- Simple cmdline, not popup
			},

			-- Disable LSP progress messages
			lsp = {
				progress = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
				hover = {
					enabled = true,
					silent = true, -- Don't show "No information available"
				},
				message = {
					enabled = false, -- Disable LSP messages
				},
			},

			-- Disable most presets
			presets = {
				bottom_search = true, -- Classic bottom search
				command_palette = false,
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = false,
			},

			-- Route ALL notifications to nowhere
			routes = {
				{
					filter = { event = "notify" },
					opts = { skip = true }, -- Skip all notifications
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "lines",
					},
					opts = { skip = true },
				},
				-- Skip all info messages
				{
					filter = { event = "msg_show", kind = "emsg" },
					opts = { skip = true },
				},
			},
		})
	end,
}
