" encoding
set encoding=utf-8

" make
autocmd QuickFixCmdPre make w
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
set keywordprg=pman

" search
set ic
set gdefault
"set incsearch

" tabs
set expandtab
set sts=4
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent

" whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" fold
set foldmethod=syntax
let g:php_folding = 3
" linewrap
set nowrap

" navigation
"imap <F8> <ESC>:bp<cr>i
"imap <F7> <ESC>:bn<cr>i
"nmap <F8> :bp<cr>
"nmap <F7> :bn<cr>
"map <F8> :bp<cr>
"map <F7> :bn<cr>

set filetype=php

" taglist
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1
let tlist_php_settings = 'php;c:class;d:constant;f:function'

" phpdoc commenter
source ~/.vim/php-doc.vim
inoremap ,n <ESC>:call PhpDocSingle()<CR>i
nnoremap ,n :call PhpDocSingle()<CR>
vnoremap ,n :call PhpDocRange()<CR>

" comment continuation
set fo+=r

" camel under convert
"nnoremap + /\$\w\+_<CR>
"nnoremap _ f_x~

" Mappings
" find custom
map ,a :Ack 
map ,f :Find 
map ,g :Gtags 
map ,v :VSFind 
map ,s :SPFind 
map ,e :tabedit %<cr>
map ,t :TlistToggle<cr>
map ,y :TaskList<cr>
map <C-n> :cn<CR>
map <C-b> :cp<CR>
"imap ,t<F6> <ESC>:TlistToggle<cr>i
"nmap <F6> :TlistToggle<cr>
" insert
imap jj <Esc>
imap uu _
imap hh =>
imap aa @
imap kk $_TAG->


" num
"set number

" Make (syntax check)
function! PHPsynCHK()
  let winnum =winnr() " get current window number
  silent make -l %
  cw " open the error window if it contains error
  " return to the window with cursor set on the line of the first error (if any)
  execute winnum . "wincmd w"
endfunction

:setl makeprg=php
:set errorformat=%m\ in\ %f\ on\ line\ %l
" Map <CTRL>-P to check the file for syntax
:noremap <C-P> :call PHPsynCHK()<CR>

" Show invisible symbols
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars

" Session
map <c-q> :mksession! ~/.vim/session/web<cr>
map <c-s> :source ~/.vim/session/web<cr>
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Appearance
syntax on
set background=dark
colorscheme coffee
set hlsearch
"set guifont=Bitstream\ Vera\ Sans\ Mono:h14
"set guifont=Anonymous\ Pro:h14

" MacVim
if has("gui_macvim")
    set transp=1
    set anti enc=utf-8 gfn=Anonymous\ Pro:h14,Monaco:h14
    set fuoptions=maxvert,maxhorz
endif

" Directories
set directory=~/.vimbackup/


autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufNewFile,BufRead *.jst set filetype=html


" Comment leader custom handler
function! JoinWithLeader(count, leaderText)
  let l:linecount = a:count
  " default number of lines to join is 2
  if l:linecount < 2
    let l:linecount = 2
  endif
  echo l:linecount . " lines joined"
  " clear errmsg so we can determine if the search fails
  let v:errmsg = ''

  " save off the search register to restore it later because we will clobber
  " it with a substitute command
  let l:savsearch = @/

  while l:linecount > 1
    " do a J for each line (no mappings)
    normal! J
    " remove the comment leader from the current cursor position
    silent! execute 'substitute/\%#\s*\%('.a:leaderText.'\)\s*/ /'
    " check v:errmsg for status of the substitute command
    if v:errmsg=~'Pattern not found'
      " just means the line wasn't a comment - do nothing
    elseif v:errmsg!=''
      echo "Problem with leader pattern for JoinWithLeader()!"
    else
      " a successful substitute will move the cursor to line beginning,
      " so move it back
      normal! ``
    endif
    let l:linecount = l:linecount - 1
  endwhile
  " restore the @/ register
  let @/ = l:savsearch
endfunction

" Eliminate comment leader when joining comment lines
function! MapJoinWithLeaders(leaderText)
  let l:leaderText = escape(a:leaderText, '/')
  " visual mode is easy - just remove comment leaders from beginning of lines
  " before using J normally
  exec "vnoremap <silent> <buffer> J :<C-U>let savsearch=@/<Bar>'<+1,'>".
        \'s/^\s*\%('.
        \l:leaderText.
        \'\)\s*/<Space>/e<Bar>'.
        \'let @/=savsearch<Bar>unlet savsearch<CR>'.
        \'gvJ'
  " normal mode is harder because of the optional count - must use a function
  exec "nnoremap <silent> <buffer> J :<C-U>call JoinWithLeader(v:count, '".l:leaderText."')<CR>"
endfunction

" join comment lines
call MapJoinWithLeaders('"\\|//\\| \*\\| \*/')

" working directory
cd ~/t
