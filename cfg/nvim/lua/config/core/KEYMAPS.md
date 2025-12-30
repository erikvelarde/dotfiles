# Neovim Keymaps

## Insert Mode
| Key | Action | Description |
|-----|--------|-------------|
| `jk` | `<ESC>` | Exit insert mode |

## Visual Mode
| Key | Action | Description |
|-----|--------|-------------|
| `ii` | `<ESC>` | Exit visual mode |
| `fc` | `:fold <CR>` | Fold selected code |
| `<A-J>` | `:m '>+1<CR>gv=gv` | Move selected lines down |
| `<A-K>` | `:m '<-2<CR>gv=gv` | Move selected lines up |
| `"` | `di "<ESC>pa" <ESC>x` | Wrap selection with double quotes |
| `fff` | `di "<ESC>pa" <ESC>x` | Wrap selection with double quotes (alternative) |
| `` ` `` | `` di `<ESC>pa` <ESC>x `` | Wrap selection with backticks |
| `ffj` | `` di `<ESC>pa` <ESC>x `` | Wrap selection with backticks (alternative) |
| `'` | `di '<ESC>pa' <ESC>x` | Wrap selection with single quotes |
| `ffh` | `di '<ESC>pa' <ESC>x` | Wrap selection with single quotes (alternative) |
| `(` | `di (<ESC>pa) <ESC>x` | Wrap selection with parentheses |
| `)` | `di (<ESC>pa) <ESC>x` | Wrap selection with parentheses (alternative) |
| `ffg` | `di (<ESC>pa) <ESC>x` | Wrap selection with parentheses (alternative) |
| `[` | `di [<ESC>pa] <ESC>x` | Wrap selection with square brackets |
| `]` | `di [<ESC>pa] <ESC>x` | Wrap selection with square brackets (alternative) |
| `ffd` | `di [<ESC>pa] <ESC>x` | Wrap selection with square brackets (alternative) |
| `{` | `di {<ESC>pa} <ESC>x` | Wrap selection with curly braces |
| `}` | `di {<ESC>pa} <ESC>x` | Wrap selection with curly braces (alternative) |
| `ffk` | `di {<ESC>pa} <ESC>x` | Wrap selection with curly braces (alternative) |

## Normal Mode
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>jf` | `:tabnew \| w ` | Create a new file (incomplete) |
| `,a` | `gg=G` | Indent entire file |
| `<leader>s` | `:w <CR>` | Save file |
| `<leader>b` | `<cmd>NvimTreeToggle<CR>` | Toggle NvimTree file explorer |
| `<leader>nh` | `:nohl<CR>` | Clear search highlights |
| `<leader>mn` | `:set clipboard=unnamedplus \| echo 'clipboard enabled' <CR>` | Enable system clipboard |
| `<leader>m,` | `:set clipboard= \| echo 'clipboard disabled' <CR>` | Disable system clipboard |
| `<leader>fw` | `*` | Find word under cursor |
| `fl` | `:<C-U>TmuxNavigateRight<cr>` | Navigate to right tmux pane |
| `fh` | `:<C-U>TmuxNavigateLeft<cr>` | Navigate to left tmux pane |
| `fj` | `:<C-U>TmuxNavigateDown<cr>` | Navigate to down tmux pane |
| `fk` | `:<C-U>TmuxNavigateUp<cr>` | Navigate to up tmux pane |
| `<leader>ff` | `:Telescope find_files <CR>` | Find files with Telescope |
| `<leader>fg` | `:Telescope live_grep <CR>` | Live grep with Telescope |
| `<leader>fb` | `:Telescope buffers<CR>` | Browse buffers with Telescope |
| `<leader>fc` | `:Telescope current_buffer_fuzzy_find<CR>` | Fuzzy find in current buffer |
| `<leader>ft` | `:Telescope <CR>` | Open Telescope (incomplete) |
| `<C-a>` | `ggVG` | Select all text in file |
| `<A-k>` | `:m-2<CR>==` | Move line up |
| `<A-j>` | `:m+<CR>==` | Move line down |
| `mm` | `:put 1 <CR>` | Put from register 1 |
| `<C-/>` | `<Plug>NERDCommenterToggle` | Toggle comment (NERDCommenter) |
| `gc` | `<Plug>NERDCommenterToggle` | Toggle comment (NERDCommenter alternative) |
| `<A-2>` | `:bnext <CR>==` | Next buffer |
| `<A-1>` | `:bprevious <CR>==` | Previous buffer |
| `<A-\`>\` | `:bdelete <CR>==` | Delete buffer |
| `<leader>w` | `:bnext <CR>==` | Next buffer (alternative) |
| `<leader>q` | `:bprevious <CR>==` | Previous buffer (alternative) |
| `<leader>x` | `:bdelete <CR>==` | Delete buffer (alternative) |
| `<leader>rs` | `:LspRestart<CR>` | Restart LSP server |
| `<leader>mm` | Function: `vim.opt.showtabline = 2` | Show bufferline |
| `<leader>nn` | Function: `vim.opt.showtabline = 0` | Hide bufferline |
| `<leader>sv` | `<C-w>v` | Split window vertically |
| `<leader>sh` | `<C-w>s` | Split window horizontally |
| `<leader>se` | `<C-w>=` | Make splits equal size |
| `<leader>sx` | `:close<CR>` | Close current split window |
| `<leader>.` | `:vertical resize +9 <CR>==` | Increase vertical split width |
| `<leader>,` | `:vertical resize -10 <CR>==` | Decrease vertical split width |
| `<leader>>` | `:horizontal resize +3 <CR>==` | Increase horizontal split height |
| `<leader><` | `:horizontal resize -3 <CR>==` | Decrease horizontal split height |
| `<A-i>` | `<cmd>vertical resize +10 <CR>==` | Increase vertical split width (alternative) |
| `<A-s>` | `<cmd>vertical resize -10 <CR>==` | Decrease vertical split width (alternative) |
| `<A-u>` | `<cmd>horizontal resize +10 <CR>==` | Increase horizontal split height (alternative) |
| `<A-d>` | `<cmd>horizontal resize -10 <CR>==` | Decrease horizontal split height (alternative) |
| `+` | `<C-a>` | Increment number |
| `-` | `<C-x>` | Decrement number |
| `<leader>d` | Function: Toggle diagnostics float | Toggle diagnostics float window |
| `<leader>gd` | Function: `vim.diagnostic.show_position_diagnostics()` | Show position diagnostics |
| `<leader>;` | `<cmd>%bd\|e#<cr>` | Close all buffers except current |
| `fy` | `<cmd>Telescope neoclip a<cr>` | Open neoclip (clipboard manager) |
| `<leader>ld` | Function: `vim.diagnostic.setloclist` | List diagnostics in location list |
| `<leader>sd` | `<cmd>Telescope diagnostics<CR>` | Search diagnostics with Telescope |
| `<leader>ha` | `<cmd>lua require("harpoon.mark").add_file()<CR>` | Add file to Harpoon |
| `<leader>hl` | `<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>` | Show Harpoon menu |
| `t` | `<cmd>lua require("harpoon.ui").nav_next()<CR>` | Navigate to next Harpoon file |
| `T` | `<cmd>lua require("harpoon.ui").nav_prev()<CR>` | Navigate to previous Harpoon file |
| `<leader>df` | Function: `disable_focus_mode()` | Enable UI elements (numbers, bufferline) |
| `<leader>ef` | Function: `enable_focus_mode()` | Disable UI elements for focus mode |
| `<C-d>` | `<C-d>zz` | Scroll down half page and center |
| `<C-u>` | `<C-u>zz` | Scroll up half page and center |
| `<leader>wm` | Function: Toggle window maximize | Maximize/restore window |
| `<leader>=` | `<C-w>=` | Equalize split sizes |
| `<leader>wrc` | `<C-w>r` | Rotate windows clockwise |
| `<leader>wrr` | `<C-w>R` | Rotate windows counter-clockwise |
| `<leader>wrx` | `<C-w>x` | Exchange windows |
| `<leader>wrt` | `<C-w>T` | Move window to new tab |
| `<leader>wvh` | `<C-w>t<C-w>H` | Convert horizontal split to vertical |
| `<leader>whv` | `<C-w>t<C-w>K` | Convert vertical split to horizontal |

## Normal & Visual Modes
| Key | Action | Description |
|-----|--------|-------------|
| `x` | `"_x` | Delete character without copying |
| `ciw` | `"_ciw` | Change inner word without copying |
| `c` | `"_c` | Change without copying |
| `d$` | `"_d$` | Delete to end of line without copying |
