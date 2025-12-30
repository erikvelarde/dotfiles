-- import formatters:
-- require("cfg.nvim.lua.config.languages.formatters.ast-grep")

vim.lsp.enable("ts_ls")
vim.lsp.enable("lua_ls")
-- those language which are disabled is because I am learning it right now. I don't use it in job
vim.lsp.enable("rust_analyzer", false)
vim.lsp.enable("gopls", true)
-- TODO: integrate the another programming language that I work with.
