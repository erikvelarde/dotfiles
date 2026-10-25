local augroup = vim.api.nvim_create_augroup("AutoRead", { clear = true })

-- Silently reload buffers on external change without a prompt
vim.api.nvim_create_autocmd("FileChangedShell", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.v.fcs_choice = "reload"
  end,
})

-- Redraw screen immediately after a silent reload
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd("redraw!")
  end,
})

-- Also check on focus gain and buffer enter for instant response
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})

-- Poll every 1 second using libuv timer for reliable background checks
local timer = vim.uv.new_timer()
timer:start(1000, 1000, vim.schedule_wrap(function()
  pcall(vim.cmd, "checktime")
end))
