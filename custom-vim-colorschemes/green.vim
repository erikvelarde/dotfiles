" A green colorscheme

" Maintainer:  https://github.com/julien
" Last Change: 2024/11/14

highlight clear

if exists("syntax_on")
  syntax reset
endif
  
let g:colors_name = "green"

hi ColorColumn ctermbg=2  guibg=#448c27
hi CursorColumn ctermbg=2 guibg=#448c27
hi CurSearch ctermfg=120 gui=none guibg=#000000 guifg=#5ec435
hi Directory ctermfg=0 ctermfg=40 guifg=#72f13e
hi Error ctermfg=1 guibg=#000000 guifg=#aa3731
hi! link vimError Error
hi ErrorMsg ctermbg=0 ctermfg=1 guibg=#000000 guifg=#aa3731
hi FoldColumn ctermfg=2 guifg=#448c27
hi Folded ctermbg=40 ctermfg=0 guibg=#448c27 guifg=#000000
hi LineNr ctermfg=2 guifg=#448c27
hi MatchParen ctermfg=2 gui=none guifg=#448c27
hi ModeMsg ctermfg=40 guifg=#5ec435
hi MoreMsg ctermfg=40 guifg=#448c27
hi NonText ctermfg=2 guifg=#5ec435
hi Pmenu cterm=none ctermbg=232 ctermfg=40 gui=none guibg=#000000 guifg=#72f13e
hi PmenuThumb ctermbg=none guibg=#000000
hi PmenuSel cterm=reverse ctermbg=120 gui=reverse guibg=#000000 guifg=#72f13e
hi Question ctermfg=40 guifg=#72f13e
hi QuickFixLine ctermbg=0 ctermfg=40 guibg=#000000 guifg=#448c27
hi Search term=none ctermfg=0 ctermbg=40 guibg=#448c27 guifg=#000000
hi SignColumn ctermfg=2 guifg=#448c27
hi StatusLine cterm=none ctermfg=232 ctermbg=120 guibg=#72f13e guifg=#000000
hi StatusLineNC cterm=none ctermfg=40 ctermbg=234 guibg=#448c27 guifg=#000000
hi VertSplit cterm=none ctermfg=232 gui=none guifg=#448c27
hi Visual term=reverse ctermbg=120 ctermfg=0 guibg=#72f13e guifg=#000000
hi! link CursorLine Visual
hi! link CursorLineNr Visual

" hi Normal ctermbg=0 ctermfg=40 guibg=#000000 guifg=#448c27
" hi Normal ctermbg=0 ctermfg=40 guibg=#000000 guifg=#448c27
hi Normal ctermfg=40 guifg=#448c27
hi! link Title Normal
hi Comment ctermfg=2 guifg=#448c27
hi! link Todo Comment
hi Statement ctermfg=40 guifg=#5ec435
hi! link Constant Statement
hi! link Delimiter Statement
hi! link Function Statement
hi! link Keyword Statement
hi! link Identifier Statement
hi! link Operator Statement
hi! link PreProc Statement
hi! link Special Statement
hi! link SpecialKey Statement
hi! link String Statement
hi! link Type Statement
hi diffAdded ctermfg=2 cterm=none gui=none guifg=#5ec435
hi! link DiffAdd diffAdded
hi! link DiffChange diffAdded
hi! link DiffText diffAdded
hi diffRemoved ctermfg=1 guifg=#aa3731
hi! link DiffDelete diffRemoved
