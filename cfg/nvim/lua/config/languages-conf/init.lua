local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--
require("config.languages-conf.languages.typescript")
-- require("config.languages-conf.languages.go")
require("config.languages-conf.languages.python")
require("config.languages-conf.languages.web-development")
require("config.languages-conf.languages.lua")
require("config.languages-conf.languages.docker")
require("config.languages-conf.languages.rust")
-- require("config.languages-conf.languages.php")
require("config.languages-conf.languages.java")
require("config.languages-conf.languages.markdown")
require("config.languages-conf.languages.tailwindcss")
-- require("config.languages-conf.languages.c_sharp")
-- require("config.languages-conf.languages.sql")
require("config.languages-conf.languages.bash")
