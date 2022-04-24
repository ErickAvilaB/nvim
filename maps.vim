" Nerd tree
nnoremap <C-n> :NERDTree<CR>
nmap ñ <C-n>ma

" Maps
" Leaders key
let mapleader=" "
nmap <Leader>e <Plug>(easymotion-s2)
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>p :! python3 %<CR>
"nmap <Leader>c :! gcc %<CR>:! ./a.out<CR>
nmap <Leader>n :! node %<CR>
nmap <Leader>+ 5<C-w>>
nmap <Leader>- 5<C-w><
nmap <Leader>s :/
nmap <Leader>o :! xdg-open %<CR>
nmap <Leader>i gg=G
nmap <Leader>ip gggqG
nmap <C-a> ggVG
imap <C-l> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
nmap <S-Down> 10j
nmap <S-Up> 10k

" Emmet maps
let g:user_emmet_leader_key='<C-Z>'
imap <C-j> <C-Z>,
imap <C-y> html:5<C-Z>,
imap <S-Right> <CR><Up><End><CR>

" Surround map
xmap s <Plug>VSurround

" Fzf maps
nmap <Leader>ff :Files<Cr>
nmap <Leader>fa :Ag<Cr>

" Map to open a terminal
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "below split term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>


" Execute code
function! ExecuteCode(lenguage)
  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")
  if bufType == "terminal"
    execute "q"
  else
    execute "below split | term " . a:lenguage
    execute "set nonu"
    execute "set nornu"
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"
    startinsert!
  endif
endfunction

nnoremap <Leader>pt :call ExecuteCode("python3 %")<CR>
nnoremap <Leader>nt :call ExecuteCode("node %")<CR>
nnoremap <Leader>is :call ExecuteCode("live-server")<CR>
nnoremap <Leader>m :call ExecuteCode("markserv %")<CR>


" ExecuteCode and open in browser
function! OpenBrowser(lenguage, port)
  execute "call ExecuteCode(a:lenguage)"
  execute "! google-chrome http://localhost:" . a:port
endfunction

nnoremap <Leader>pb :call OpenBrowser("python3 %", "5000")<CR>
nnoremap <Leader>nb :call OpenBrowser("node %", "3000")<CR>


" Ultisnips
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"

" Git maps
nmap <Leader>ga :! git add .<CR>
nmap <Leader>gc :! git commit -m ""
nmap <Leader>gp :call ExecuteCode("git push")<CR>
nmap <Leader>gs :! git status<CR>
