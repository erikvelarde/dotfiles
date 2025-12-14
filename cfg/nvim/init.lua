require("config.core")
require("config.lazy")

-- set colorscheme
require("config.set-colorscheme")
require("config.languages-conf")

-- for spring boot live reload
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.java",
--   callback = function()
--     -- Run 'mvn compile' silently, discard output
--     vim.fn.system("mvn compile -q")
--     -- Optional: Notify on success/failure
--     if vim.v.shell_error == 0 then
--       print("✓ Compiled successfully (Spring Boot DevTools should restart)")
--     else
--       print("✗ Compilation failed (check logs)")
--     end
--   end,
-- })
