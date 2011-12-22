"
" vimtagged.vim
" =============
"
" vim tools for Tagged engineers
"
" requirements
" ============
"
" Your vim must be built with Python support.
"
" how to install
" ==============
"
" Place this file in .vim/plugin.
"
" You also need to add the following to your .vimrc, or somewhere "source"d by your .vimrc
"
"   let g:vimtagged_username='USERNAME'
"   let g:vimtagged_password='PASSWORD'
"
" USERNAME and PASSWORD are your LDAP credentials.
"
" TAGEval
" =======
"
" This script exposes the command :TAGEval. When invoked, it takes the current
" line, or the current range, and sends it to the tag-local.com test.php eval
" script. The result is shown in a scratch buffer below your code.
"
" It's useful to bind the command to a key combo, like this:
"
"   map <Leader>e :TAGEval<CR>
"
" Then (backslash)e (or whatever your <Leader> is set to) will eval the
" currently selected code.
"
" config variables
" ================
"
" g:vimtagged_output_height
"
"   default: 17. set to a different number to change the height of the TAGEval
"   output window
"
if !exists('g:vimtagged_output_height')
    let g:vimtagged_output_height = 17
endif

python << EOF

import re
import vim
import sys
import cookielib
import httplib
import urllib, urllib2

host = 'phpadmin.tag-local.com'

login_url = 'http://%s/admin_secure_login.html'
eval_url  = 'http://%s/eng/eval.php'

cookiejar = cookielib.CookieJar()

opener = urllib2.build_opener(
        urllib2.HTTPCookieProcessor(cookiejar),
        urllib2.HTTPHandler)

def POST(url, data):
    return opener.open(urllib2.Request(url, urllib.urlencode(data)))

def login(username, password):
    return POST(login_url % host, dict(
        username=username,
        password=password))

def eval_post(code):
    return POST(eval_url % host, dict(s=code))

def eval_code(code):
    '''eval code given on the Tagged server. returns the result'''

    output = eval_post(code).read()

    # Login if necessary. TODO: make the server return an actual status code,
    # instead of hunting for a specific string here.
    if 'No active session -- please log in' in output:
        login(vim.eval('g:vimtagged_username'), vim.eval('g:vimtagged_password'))

    return eval_post(code).read()

def senclose(s):
    '''enclose a string in single quotes, and escape single quotes inside it'''
    return "'%s'" % re.sub(re.compile("'"), "''", s)

def set_register(name, val):
    '''set a vim register from python'''

    vim.command("let " + name + "=" + senclose(val))

EOF

function s:ShowOutputWindow()
  if exists("t:vimtagged_bufnr") && bufwinnr(t:vimtagged_bufnr) > 0
    exe "keepjumps ".bufwinnr(t:vimtagged_bufnr)."wincmd W"
    exe 'normal ggdG'
  else
    exe "belowright keepjumps silent! " . g:vimtagged_output_height . " new"
    let t:vimtagged_bufnr=bufnr('%')
  end
endfunction


function! TAGEval(start, end)
    let s:lines = getline(a:start, a:end)

    " send the code to the server
    
    python << EOF
code = '\n'.join(vim.eval('s:lines'))
result = eval_code(code)
set_register('@m', result)
EOF

    " show the output in a scratch buffer
    call s:ShowOutputWindow()
    put=@m
    setlocal buftype=nofile bufhidden=wipe noswapfile

    " go back to the original window
    wincmd k

endfunction

command! -range TAGEval call TAGEval(<line1>, <line2>)

