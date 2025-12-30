print("Lsp config loaded!")
vim.lsp.enable("ts_ls")
vim.lsp.enable("lua_ls")
-- those language which are disabled is because I am learning it right now. I don't use it in job
vim.lsp.enable("rust_analyzer", false)
vim.lsp.enable("gopls", false)
-- TODO: integrate the another programming language that I work with.
