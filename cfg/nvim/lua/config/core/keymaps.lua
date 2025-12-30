--------------------------
--- My Neovim Keybinds ---
--------------------------
vim.g.mapleader = " "
-- vim.g.mapleader = ","

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { silent = true })

keymap.set("v", "ii", "<ESC>", { silent = true })

-- create a new file
keymap.set("n", "<leader>jf", ":tabnew | w ")

-- indent lines
keymap.set("n", ",a", "gg=G")

-- folding code
keymap.set("v", "fc", ":fold <CR>")

-- save file
keymap.set("n", "<leader>s", ":w <CR>")

-- nvim tree toggle
-- keymap.set("n", "<leader>b", "<cmd>Neotree toggle<CR>", { silent = true })
keymap.set("n", "<leader>b", "<cmd>NvimTreeToggle<CR>", { silent = true })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true })

-- delete single character without copying into register
keymap.set({ "n", "v" }, "x", '"_x', { silent = true })

-- copy code into your clipboard
keymap.set("n", "<leader>mn", ":set clipboard=unnamedplus | echo 'clipboard enabled' <CR>", { silent = true })

keymap.set("n", "<leader>m,", ":set clipboard= | echo 'clipboard disabled' <CR>", { silent = true })

-- find a hovered word
keymap.set("n", "<leader>fw", "*", { silent = true })

-- tmux vim moves
keymap.set("n", "fl", ":<C-U>TmuxNavigateRight<cr>", { silent = true })
keymap.set("n", "fh", ":<C-U>TmuxNavigateLeft<cr>", { silent = true })
keymap.set("n", "fj", ":<C-U>TmuxNavigateDown<cr>", { silent = true })
keymap.set("n", "fk", ":<C-U>TmuxNavigateUp<cr>", { silent = true })

-- telescope
keymap.set("n", "<leader>ff", ":Telescope find_files <CR>", { silent = true })
keymap.set("n", "<leader>fg", ":Telescope live_grep <CR>", { silent = true })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
keymap.set("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })
keymap.set("n", "<leader>ft", ":Telescope <CR>", { silent = true })

-- select all
keymap.set("n", "<C-a>", "ggVG", { silent = true }) -- to select all file

keymap.set("n", "<A-k>", ":m-2<CR>==", { silent = true })
keymap.set("n", "<A-j>", ":m+<CR>==", { silent = true })

-- move entire lines of code
keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true })

keymap.set("n", "mm", ":put 1 <CR>", { silent = true })

-- nerd commenter
keymap.set({ "n", "v" }, "<C-/>", "<Plug>NERDCommenterToggle", { silent = true })
keymap.set({ "n", "v" }, "gc", "<Plug>NERDCommenterToggle", { silent = true })

keymap.set("n", "<A-2>", ":bnext <CR>==", { silent = true })
keymap.set("n", "<A-1>", ":bprevious <CR>==", { silent = true })
keymap.set("n", "<A-`>", ":bdelete <CR>==", { silent = true })
-- keymap.set("n", "t", ":bnext <CR>==", { silent = true })
-- keymap.set("n", "T", ":bprevious <CR>==", { silent = true })
-- keymap.set("n", "<A-`>", ":bdelete <CR>==", { silent = true })

keymap.set("n", "<leader>w", ":bnext <CR>==", { silent = true })
keymap.set("n", "<leader>q", ":bprevious <CR>==", { silent = true })
keymap.set("n", "<leader>x", ":bdelete <CR>==", { silent = true })

-- quotes, square "and curly brackets" completition
-- exaple text ->  "example text"
keymap.set("v", '"', 'di "<ESC>pa" <ESC>x', { silent = true })
keymap.set("v", "fff", 'di "<ESC>pa" <ESC>x', { silent = true })

-- exaple text ->  `example text`
keymap.set("v", "`", "di `<ESC>pa` <ESC>x", { silent = true })
keymap.set("v", "ffj", "di `<ESC>pa` <ESC>x", { silent = true })

-- exaple text ->  'example text'
keymap.set("v", "'", "di '<ESC>pa' <ESC>x", { silent = true })
keymap.set("v", "ffh", "di '<ESC>pa' <ESC>x", { silent = true })

-- exaple text ->  (example text)
keymap.set("v", "(", "di (<ESC>pa) <ESC>x", { silent = true })
keymap.set("v", ")", "di (<ESC>pa) <ESC>x", { silent = true })
keymap.set("v", "ffg", "di (<ESC>pa) <ESC>x", { silent = true })

-- exaple text ->  [example text]
keymap.set("v", "[", "di [<ESC>pa] <ESC>x", { silent = true })
keymap.set("v", "]", "di [<ESC>pa] <ESC>x", { silent = true })
keymap.set("v", "ffd", "di [<ESC>pa] <ESC>x", { silent = true })

-- exaple text ->  {example text}
keymap.set("v", "{", "di {<ESC>pa} <ESC>x", { silent = true })
keymap.set("v", "}", "di {<ESC>pa} <ESC>x", { silent = true })
keymap.set("v", "ffk", "di {<ESC>pa} <ESC>x", { silent = true })

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

vim.cmd([[
filetype plugin indent on

" nnoremap q: <nop>
" nnoremap Q <nop>
" map q <Nop>

augroup remember_folds
autocmd!
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent! loadview 1
augroup END

]])

-- toggle bufferline
keymap.set("n", "<leader>mm", function()
	vim.opt.showtabline = 2
end)
keymap.set("n", "<leader>nn", function()
	vim.opt.showtabline = 0
end)

--  window management
keymap.set("n", "<leader>sv", "<C-w>v", { silent = true }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { silent = true }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { silent = true }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { silent = true }) -- close current split window
-- rezize windows
keymap.set("n", "<leader>.", ":vertical resize +9 <CR>==", { silent = true })
keymap.set("n", "<leader>,", ":vertical resize -10 <CR>==", { silent = true })
keymap.set("n", "<leader>>", ":horizontal resize +3 <CR>==", { silent = true })
keymap.set("n", "<leader><", ":horizontal resize -3 <CR>==", { silent = true })
-- alternatives
keymap.set("n", "<A-i>", "<cmd>vertical resize +10 <CR>==", { silent = true })
keymap.set("n", "<A-s>", "<cmd>vertical resize -10 <CR>==", { silent = true })
keymap.set("n", "<A-u>", "<cmd>horizontal resize +10 <CR>==", { silent = true })
keymap.set("n", "<A-d>", "<cmd>horizontal resize -10 <CR>==", { silent = true })

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { silent = true }) -- toggle split window maximization

-- Definitions

keymap.set("n", "<leader>d", function()
	local found_float = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			vim.api.nvim_win_close(win, true)
			found_float = true
		end
	end

	if found_float then
		return
	end

	vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end, { desc = "Toggle Diagnostics" })

keymap.set("n", "<leader>gd", function()
	vim.diagnostic.show_position_diagnostics()
end)

keymap.set("n", "<leader>;", "<cmd>%bd|e#<cr>")

keymap.set("n", "fy", "<cmd>Telescope neoclip a<cr>", { silent = true })

-- Diagnostics
keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "List Diagnostics in Location List" })
-- keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to Previous Diagnostic" })
-- keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })
keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "Search Diagnostics" })

-- -- Harpoon
keymap.set("n", "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', { desc = "Harpoon file" })
keymap.set("n", "<leader>hl", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = "Files Harpooned" })
keymap.set("n", "t", '<cmd>lua require("harpoon.ui").nav_next()<CR>', { desc = "Harpoon file" })
keymap.set("n", "T", '<cmd>lua require("harpoon.ui").nav_prev()<CR>', { desc = "Harpoon file" })
-- Harpoon

-- format
-- keymap.set("n", "1", "<CMD> lua vim.lsp.buf.format()<CR>", { desc = "formatting code." })

keymap.set("n", "ciw", '"_ciw', { noremap = true, silent = true })
keymap.set("v", "c", '"_c', { noremap = true, silent = true })
--
keymap.set("n", "d$", '"_d$', { noremap = true, silent = true })
keymap.set("v", "d$", '"_d$', { noremap = true, silent = true })

-- vim.api.n_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })
keymap.set("n", "c", '"_c', { noremap = true, silent = true })
keymap.set("v", "c", '"_c', { noremap = true, silent = true })

local function enable_focus_mode()
	vim.opt.showtabline = 0
	vim.opt.laststatus = 0

	-- vim.opt.number = false
	-- vim.opt.relativenumber = false
end
local function disable_focus_mode()
	vim.opt.laststatus = 3

	vim.opt.showtabline = 2
	vim.opt.number = true
	vim.opt.relativenumber = true
end

keymap.set("n", "<leader>df", disable_focus_mode, { desc = "Enable numbers, relative numbers and bufferline" })
keymap.set("n", "<leader>ef", enable_focus_mode, { desc = "Disable numbers, relative numbers and bufferline" })

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keymap.set("n", "<C-f>", "/")
--
keymap.set("n", "<leader>wm", function()
	if vim.g.window_maximized then
		-- Restore
		if vim.g.original_width and vim.g.original_height then
			vim.cmd("resize " .. vim.g.original_height)
			vim.cmd("vertical resize " .. vim.g.original_width)
		end
		vim.g.window_maximized = false
	else
		-- Maximize
		vim.g.original_width = vim.fn.winwidth(0)
		vim.g.original_height = vim.fn.winheight(0)
		vim.cmd("resize 999")
		vim.cmd("vertical resize 999")
		vim.g.window_maximized = true
	end
end, { desc = "Toggle maximize window" })

vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize split sizes" })

-- Rotate windows clockwise
vim.keymap.set("n", "<leader>wrc", "<C-w>r", { desc = "Rotate windows clockwise" })

-- Rotate windows counter-clockwise
vim.keymap.set("n", "<leader>wrr", "<C-w>R", { desc = "Rotate windows counter-clockwise" })

-- Exchange windows
vim.keymap.set("n", "<leader>wrx", "<C-w>x", { desc = "Exchange windows" })

-- Move window to new tab
vim.keymap.set("n", "<leader>wrt", "<C-w>T", { desc = "Move window to new tab" })

-- Convert horizontal to vertical
vim.keymap.set("n", "<leader>wvh", "<C-w>t<C-w>H", { desc = "Convert horizontal to vertical" })

vim.keymap.set("n", "<leader>whv", "<C-w>t<C-w>K", { desc = "Convert vertical to horizontal" })
-- Convert vertical to horizontal
vim.keymap.set("n", "<leader>whv", "<C-w>t<C-w>K", { desc = "Convert vertical to horizontal" })
