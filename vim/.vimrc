filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" scrollbinding
set noscb

" leader
let mapleader = ","

" tagged env eval
let g:vimtagged_username='nkresge'
let g:vimtagged_password='pz;E~xWm~6?!c2JyY~'
map <Leader>r :TAGEval<CR>

" whitespace visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" syntastic
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_highlight = 1
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_enable_signs=1

" encoding
set encoding=utf-8

" make
autocmd QuickFixCmdPre make w
"set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
set keywordprg=pman

" search
set ic
set gdefault

" tabs
set expandtab
set sts=4
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent

" fold
set foldmethod=syntax
let g:php_folding = 3

" linewrap
set nowrap

" taglist
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1

" phpdoc commenter
source ~/.vim/php-doc.vim
inoremap <Leader>n <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader>n :call PhpDocSingle()<CR>
vnoremap <Leader>n :call PhpDocRange()<CR>

" comment continuation
set fo+=r

" Mappings
map <F2> :source ~/.vimrc<CR>:echoe "Loaded rc"<CR>
map <Leader>x :!run-unit-test.sh %<CR>
map <Leader>a :Ack 
map <Leader>f :Find 
map <Leader>g :Gtags 
map <Leader>v :VSFind 
map <Leader>s :SPFind 
map <Leader>e :tabedit %<cr>
map <Leader>y :TaskList<cr>
map <Leader>t :TlistToggle<cr>
map <Leader>p :Lodgeit<CR>
map <Leader>ca :ConqueTermTab bash <CR>
map <Leader>cs :ConqueTermTab psql -h gpmaster01.tagged.com -U gpadmin -d prod <CR>
map <Leader>cd :ConqueTermSplit ssh nkresge@192.168.11.139 ; cd /home/html/ ; phpunit cooltest/unit/tests/shared/class/tag/
map <Leader>cf :ConqueTermTab git svn rebase <CR>
map <C-n> :cn<CR>
map <C-b> :cp<CR>
imap jj <Esc>
imap uu _
imap hh => 
imap aa array(
imap kk $_TAG->
" Map <CTRL>-P to check the file for syntax
:noremap <C-P> :call PHPsynCHK()<CR>

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

" Appearance
set background=dark
colorscheme koehler

" MacVim  conditional
if has("gui_macvim")
    set transp=1
    set anti enc=utf-8 gfn=Anonymous\ Pro:h14,Monaco:h14
    set fuoptions=maxvert,maxhorz
endif

" Directories
set directory=~/.vimbackup/

"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufNewFile,BufRead *.as set filetype=actionscript

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

" Default to web project
cd ~/t

syntax on
