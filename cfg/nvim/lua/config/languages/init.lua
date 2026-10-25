-- import formatters:
require("config.languages.formatters.ast_grep")
require("config.languages.formatters.php_cs_fixer")

vim.lsp.enable("ts_ls", false)
vim.lsp.enable("lua_ls", false)
-- those language which are disabled is because I am learning it right now. I don't use it in job
vim.lsp.enable("rust_analyzer", false)
-- vim.lsp.enable("phpcsfixer", false)
vim.lsp.enable("gopls", false)
vim.lsp.enable("clangd", false)
-- TODO: integrate the another programming language that I work with.
