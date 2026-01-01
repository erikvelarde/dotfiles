" took many of these colors from github.com/CosecSecCot/cosec-twilight.nvim.
set bg=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'camila'

" Define highlight groups with transparency
highlight Normal        guifg=#FEFEFE guibg=NONE
highlight NormalFloat   guifg=#FEFEFE guibg=NONE
highlight Comment       guifg=#6f7b68
highlight TSComment     guifg=#6f7b68
highlight Conceal       guibg=NONE
highlight Constant      guifg=#cccccc
"highlight CursorColumn
"highlight CursorLine
highlight DiffAdd       guifg=#FFFEDB guibg=NONE
highlight DiffChange    guifg=#FFFEDB guibg=NONE
highlight DiffDelete    guifg=#C34143 guibg=NONE
highlight DiffText      guifg=#FFFEDB guibg=NONE
highlight Directory     guifg=#C1C88D
highlight Error         guifg=#C34143 gui=undercurl
highlight ErrorMsg      guifg=#FFFEDB
"highlight FoldColumn
"highlight Folded
highlight Function      guifg=#AA9AAC
highlight Identifier    guifg=#8B9698
"highlight LineNr        guifg=#474A4D
highlight LineNrAbove   guifg=#888888 guibg=NONE
highlight LineNrBelow   guifg=#888888 guibg=NONE
highlight LineNr        guifg=#d6d2c8 guibg=NONE
highlight MatchParen    guifg=#FFFEDB guibg=NONE
highlight NonText       guifg=#303030
highlight Operator      guifg=#DEBF7C
highlight Pmenu         guifg=#918988 guibg=NONE
highlight PmenuSbar     guifg=#918988 guibg=NONE
highlight PmenuSel      guifg=#BFBBBA guibg=#404040  " Keep some background for selection
highlight PmenuThumb    guifg=#918988 guibg=NONE gui=reverse
highlight PreProc       guifg=#8B9698
highlight Question      guifg=#9b8d7f
highlight QuickFixLine  guibg=#404040  " Keep background for visibility
highlight Search        guibg=#5F5958  " Keep background for search highlighting
"highlight SignColumn
highlight Special       guifg=#cccccc
highlight SpecialChar   guifg=#C1C88D
highlight SpecialKey    guifg=#676767
highlight Statement     guifg=#cccccc
highlight StatusLine    guifg=#FFFEDB guibg=NONE
highlight String        guifg=#A2A970
highlight Structure     guifg=#AA9AAC
highlight Substitute    guifg=#1A1A1A guibg=NONE
highlight TabLine       guifg=#A09998 guibg=NONE
highlight TabLineFill   guifg=#A09998 guibg=NONE
highlight TabLineSel    guifg=#A09998 guibg=NONE
highlight Title         guifg=#FFFEDB term=none cterm=none
highlight Todo          guifg=#8B9698
highlight Type          guifg=#E3D896
highlight Underlined    gui=undercurl
highlight VertSplit     guifg=#303030
highlight Visual        guibg=#454545  " Keep background for visual selection
highlight WarningMsg    guifg=#FFFEDB
highlight Float         guifg=#6f7b68
highlight Number        guifg=#6f7b68
highlight Boolean       guifg=#6f7b68
highlight WinSeparator  guibg=NONE guifg=#888888

" Additional groups for better transparency
highlight EndOfBuffer   guifg=#303030 guibg=NONE
highlight CursorLine    guibg=NONE
highlight CursorLineNr  guifg=#d6d2c8 guibg=NONE
highlight SignColumn    guibg=NONE
highlight FoldColumn    guibg=NONE
highlight Folded        guibg=NONE

" ============================================
" TREE-SITTER HIGHLIGHT GROUPS
" ============================================

" Punctuation and syntax
highlight @punctuation.delimiter guifg=#DEBF7C  " Same as Operator
highlight @punctuation.bracket   guifg=#DEBF7C
highlight @punctuation.special   guifg=#DEBF7C

" Functions and methods
highlight @function              guifg=#AA9AAC  " Same as Function
highlight @function.call         guifg=#AA9AAC
highlight @function.builtin      guifg=#E3D896  " Same as Type
highlight @function.macro        guifg=#AA9AAC
highlight @method                guifg=#AA9AAC
highlight @method.call           guifg=#AA9AAC
highlight @constructor           guifg=#E3D896

" Variables and identifiers
highlight @variable              guifg=#FEFEFE  " Same as Normal foreground
highlight @variable.builtin      guifg=#E3D896  " Like self, this
highlight @parameter             guifg=#cccccc  " Same as Constant
highlight @parameter.reference   guifg=#cccccc
highlight @field                 guifg=#C1C88D  " Same as Directory
highlight @property              guifg=#C1C88D

" Constants and literals
highlight @constant              guifg=#cccccc  " Same as Constant
highlight @constant.builtin      guifg=#E3D896  " Like true, false, nil
highlight @constant.macro        guifg=#8B9698  " Same as PreProc
highlight @string                guifg=#A2A970  " Same as String
highlight @string.documentation  guifg=#6f7b68  " Same as Comment
highlight @string.regex          guifg=#A2A970
highlight @string.escape         guifg=#DEBF7C  " Same as Operator
highlight @character             guifg=#A2A970
highlight @character.special     guifg=#C1C88D  " Same as SpecialChar
highlight @number                guifg=#6f7b68  " Same as Number/Float/Boolean
highlight @float                 guifg=#6f7b68
highlight @boolean               guifg=#6f7b68

" Keywords and control flow
highlight @keyword               guifg=#cccccc  " Same as Statement
highlight @keyword.function      guifg=#AA9AAC  " Same as Function
highlight @keyword.operator      guifg=#DEBF7C  " Same as Operator
highlight @keyword.return        guifg=#cccccc
highlight @conditional           guifg=#cccccc
highlight @repeat                guifg=#cccccc
highlight @exception             guifg=#C34143  " Same as Error
highlight @label                 guifg=#8B9698  " Same as Identifier

" Types
highlight @type                  guifg=#E3D896  " Same as Type
highlight @type.builtin          guifg=#E3D896
highlight @type.definition       guifg=#E3D896
highlight @type.qualifier        guifg=#cccccc  " Same as Statement
highlight @attribute             guifg=#8B9698  " Same as PreProc
highlight @namespace             guifg=#8B9698  " Same as Identifier

" Comments and documentation
highlight @comment               guifg=#6f7b68  " Same as Comment
highlight @comment.documentation guifg=#6f7b68  " JSDoc, Python docstrings, etc.

" Tags and markup (HTML/XML/JSX)
highlight @tag                   guifg=#AA9AAC  " Same as Function
highlight @tag.delimiter         guifg=#DEBF7C  " Same as Operator
highlight @tag.attribute         guifg=#C1C88D  " Same as Directory

" Special
highlight @error                guifg=#C34143  " Same as Error
highlight @text.warning         guifg=#FFFEDB  " Same as WarningMsg
highlight @text.danger          guifg=#C34143

" Text and markup
highlight @text                 guifg=#FEFEFE  " Same as Normal
highlight @text.strong          guifg=#FEFEFE gui=bold
highlight @text.emphasis        guifg=#FEFEFE gui=italic
highlight @text.underline       guifg=#FEFEFE gui=underline
highlight @text.strike          guifg=#6f7b68 gui=strikethrough
highlight @text.title           guifg=#FFFEDB  " Same as Title
highlight @text.literal         guifg=#A2A970  " Same as String
highlight @text.uri             guifg=#C1C88D gui=underline  " Links
highlight @text.reference       guifg=#AA9AAC

" Markdown specific (linking with your existing markdown rule)
highlight @markup.link.label.markdown_inline cterm=NONE guifg=#AA9AAC

" ============================================
" LINK LEGACY GROUPS TO TREE-SITTER GROUPS
" (For backward compatibility)
" ============================================
highlight! link markdownLinkText @text.uri
highlight! link markdownUrl @text.uri
highlight! link markdownCode @text.literal
highlight! link markdownCodeBlock @text.literal
highlight! link markdownH1 @text.title
highlight! link markdownH2 @text.title
highlight! link markdownBold @text.strong
highlight! link markdownItalic @text.emphasis

" Diagnostic highlights (if using nvim-lspconfig)
highlight DiagnosticError guifg=#C34143
highlight DiagnosticWarn  guifg=#FFFEDB
highlight DiagnosticInfo  guifg=#7aa2f7
highlight DiagnosticHint  guifg=#73daca

" ============================================
" MARKDOWN SPECIFIC HIGHLIGHTS
" ============================================

" Markdown headings
highlight markdownH1 guifg=#FFFEDB gui=bold
highlight markdownH2 guifg=#FFFEDB gui=bold
highlight markdownH3 guifg=#FFFEDB gui=bold
highlight markdownH4 guifg=#FFFEDB gui=bold
highlight markdownH5 guifg=#FFFEDB gui=bold
highlight markdownH6 guifg=#FFFEDB gui=bold

" Markdown code blocks
highlight markdownCode guifg=#A2A970 guibg=#1a1a1a
highlight markdownCodeBlock guifg=#A2A970 guibg=#1a1a1a
highlight markdownCodeDelimiter guifg=#DEBF7C

" Markdown links
highlight markdownLinkText guifg=#C1C88D gui=underline
highlight markdownUrl guifg=#6f7b68 gui=underline
highlight markdownLinkDelimiter guifg=#DEBF7C

" Markdown lists
highlight markdownListMarker guifg=#DEBF7C
highlight markdownOrderedListMarker guifg=#DEBF7C

" Markdown bold/italic
highlight markdownBold guifg=#FEFEFE gui=bold
highlight markdownItalic guifg=#FEFEFE gui=italic
highlight markdownBoldItalic guifg=#FEFEFE gui=bold,italic

" Markdown blockquotes
highlight markdownBlockquote guifg=#6f7b68 guibg=#1a1a1a

" Markdown rules (horizontal lines)
highlight markdownRule guifg=#303030

" Markdown inline code should have background
highlight @text.literal.markdown_inline guifg=#A2A970 guibg=#1a1a1a
highlight @text.literal.markdown guifg=#A2A970 guibg=#1a1a1a

" Force darker backgrounds for markdown preview areas
autocmd FileType markdown highlight Normal guibg=#111111
autocmd FileType markdown highlight NormalFloat guibg=#111111

" Specific for markdown code blocks (what I see in your image)
autocmd FileType markdown highlight markdownCodeBlock guibg=#1a1a1a
autocmd FileType markdown highlight @text.literal guibg=#1a1a1a
