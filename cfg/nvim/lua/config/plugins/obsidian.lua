return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	-- ft = "markdown", -- uncomment this, if you want to use the Obsidian command only inside mardown files
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "hub",
				path = "~/.dotfiles/notes/hub",
			},
			{
				name = "personal",
				path = "~/.dotfiles/notes/personal",
			},
			{
				name = "work",
				path = "~/.dotfiles/notes/work",
			},
		},

		-- CUSTOM FILE NAMING
		note_id_func = function(title)
			-- No title -> fallback to timestamp
			if title == nil or title == "" then
				return tostring(os.time())
			end

			-- Replace spaces with underscores
			local sanitized = title:gsub("%s+", "_")

			-- If title contains directories, keep them
			return sanitized .. "-" .. tostring(os.time())
		end,

		-- Disable default ID-based generator
		-- disable_frontmatter = true,
		-- frontmatter = {
		--   enable = true,
		-- },
	},
}
