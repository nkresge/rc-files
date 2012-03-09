set background=dark "or light
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "dw_blue"
set t_Co=256

highlight Boolean             guifg=#00ff00 ctermfg=10                            gui=none cterm=none
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Comment             guifg=#696969 ctermfg=242                           gui=none cterm=none
highlight Conditional         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Constant            guifg=#00ff00 ctermfg=10                            gui=none cterm=none
highlight Cursor              guifg=#ffffff ctermfg=15  guibg=#444444 ctermbg=238 gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255 guibg=#001100 ctermbg=22  gui=none cterm=none
highlight CursorLine          guifg=#eeeeee ctermfg=255 guibg=#001800 ctermbg=22  gui=none cterm=none
highlight Debug               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Define              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DiffAdd             guifg=#00ff00 ctermfg=10  guibg=#333333 ctermbg=236 gui=none cterm=none
highlight DiffChange          guifg=#00ff00 ctermfg=10  guibg=#333333 ctermbg=236 gui=none cterm=none
highlight DiffDelete          guifg=#00ff00 ctermfg=10  guibg=#333333 ctermbg=236 gui=none cterm=none
highlight DiffText            guifg=#ffffff ctermfg=15  guibg=#333333 ctermbg=236 gui=none cterm=none
highlight Directory           guifg=#00ff00 ctermfg=10  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight ErrorMsg            guifg=#000000 ctermfg=0   guibg=#ffffff ctermbg=15  gui=none cterm=none
highlight Exception           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Float               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight FoldColumn          guifg=#ff0000 ctermfg=196 guibg=#222222 ctermbg=235 gui=none cterm=none
highlight Folded              guifg=#ff0000 ctermfg=196 guibg=#222222 ctermbg=235 gui=none cterm=none
highlight Function            guifg=#00ff00 ctermfg=10  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Identifier          guifg=#00bb00 ctermfg=34  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Ignore              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight IncSearch           guifg=#000000 ctermfg=0   guibg=#00bb00 ctermbg=34  gui=none cterm=none
highlight Include             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Keyword             guifg=#c0c0c0 ctermfg=7                             gui=none cterm=none
highlight Label               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight LineNr              guifg=#008800 ctermfg=28  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight MatchParen          guifg=#00ff00 ctermfg=10  guibg=#222222 ctermbg=235 gui=none cterm=none
highlight ModeMsg             guifg=#00ff00 ctermfg=10  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight MoreMsg             guifg=#00ff00 ctermfg=10  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight NonText             guifg=#ffffff ctermfg=15  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Normal              guifg=#c0c0c0 ctermfg=7   guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Number              guifg=#c0c0c0 ctermfg=7                             gui=none cterm=none
highlight Operator            guifg=#696969 ctermfg=242                           gui=none cterm=none
highlight PMenu               guifg=#000000 ctermfg=0   guibg=#444444 ctermbg=238 gui=none cterm=none
highlight PMenuSbar           guifg=#000000 ctermfg=0   guibg=#000000 ctermbg=0   gui=none cterm=none
highlight PMenuSel            guifg=#000000 ctermfg=0   guibg=#008800 ctermbg=28  gui=none cterm=none
highlight PMenuThumb          guifg=#000000 ctermfg=0   guibg=#008800 ctermbg=28  gui=none cterm=none
highlight PreCondit           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight PreProc             guifg=#ffffff ctermfg=15                            gui=none cterm=none
highlight Question            guifg=#00ff00 ctermfg=10                            gui=none cterm=none
highlight Repeat              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Search              guifg=#000000 ctermfg=0   guibg=#00ff00 ctermbg=10  gui=none cterm=none
highlight SignColumn          guifg=#ffffff ctermfg=15  guibg=#111111 ctermbg=233 gui=none cterm=none
highlight Special             guifg=#ffffff ctermfg=15  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight SpecialChar         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialComment      guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialKey          guifg=#00ff00 ctermfg=10  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight SpellBad            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellCap            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellLocal          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellRare           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Statement           guifg=#00ff00 ctermfg=10                            gui=bold cterm=bold
highlight StatusLine          guifg=#000000 ctermfg=0   guibg=#008800 ctermbg=28  gui=none cterm=none
highlight StatusLineNC        guifg=#000000 ctermfg=0   guibg=#444444 ctermbg=238 gui=none cterm=none
highlight StorageClass        guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight String              guifg=#00e5ee ctermfg=14                            gui=none cterm=none
highlight Structure           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLine             guifg=#000000 ctermfg=0   guibg=#444444 ctermbg=238 gui=none cterm=none
highlight TabLineFill         guifg=#ffffff ctermfg=15  guibg=#000000 ctermbg=0   gui=underline cterm=underline
highlight TabLineSel          guifg=#000000 ctermfg=0   guibg=#00aa00 ctermbg=34  gui=none cterm=none
highlight Tag                 guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Title               guifg=#00ff00 ctermfg=10                            gui=none cterm=none
highlight Todo                guifg=#ff0000 ctermfg=196 guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Type                guifg=#ffffff ctermfg=15                            gui=none cterm=none
highlight Typedef             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Underlined          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#ffffff ctermfg=15  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight Visual              guifg=#000000 ctermfg=0   guibg=#00dd00 ctermbg=40  gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight WarningMsg          guifg=#000000 ctermfg=0   guibg=#888888 ctermbg=102 gui=none cterm=none
highlight WildMenu            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight pythonBuiltin       guifg=#c0c0c0 ctermfg=7                             gui=none cterm=none
