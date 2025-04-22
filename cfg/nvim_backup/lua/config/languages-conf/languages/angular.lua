local project_library_path = "/path/to/project/lib"
local cmd =
	{ "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }

require("lspconfig").angularls.setup({
	cmd = cmd,
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = cmd
	end,
})
