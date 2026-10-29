-- Java LSP (jdtls). Set to false to disable it.
local enabled = true

-- Recent jdtls builds need a JDK 25 runtime to start (your projects can still target 21).
-- Arch: sudo pacman -S jdk25-openjdk
local jdtls_java_home = "/usr/lib/jvm/java-25-openjdk"
if vim.uv.fs_stat(jdtls_java_home) then
	vim.lsp.config("jdtls", { cmd_env = { JAVA_HOME = jdtls_java_home } })
end

vim.lsp.enable("jdtls", enabled)
