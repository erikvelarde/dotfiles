local opt = vim.opt
vim.cmd("set background=dark")
-- vim.cmd("let g:lspsaga.use_signs = 0")

-- line numbers
opt.number = true
opt.relativenumber = true
opt.showcmd = false
-- opt.showtabline = 0

opt.undofile = true

opt.spell = false

-- tabs & indentation
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors for nightfly colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- opt.signcolumn = "number" -- show sign column so that text doesn't shift
-- vim.opt.numberwidth = 5 -- Minimum width for line numbers (default is 4)

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
opt.showcmd = true
opt.showmode = false
opt.showtabline = 0
-- opt.clipboard = "unnamedplus"
