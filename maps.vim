" ===========================================================================
" MAPS

" Leader key
let mapleader=" "

" Editor maps
nmap <Leader>w :w<CR>
nmap <Leader>W :wq<CR>
nmap <Leader>q :q<CR>
nmap <Leader>Q :qa<CR>
nmap <Leader>+ 5<C-w>>
nmap <Leader>- 5<C-w><
nmap <Leader>s :/
nmap <C-a> ggVG
nmap <S-Down> 10j
nmap <S-Up> 10k

" ===========================================================================
" FORMAT CODE

" Prettier
autocmd FileType html,css,javascript nmap <Leader>i <Plug>(Prettier)

" Autopep8
autocmd FileType python noremap <buffer> <Leader>i :call Autopep8()<CR>


" ==========================================================================
" TERMINAL

" Function to open a terminal
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

" Execute code in terminal
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

" ExecuteCode and open in browser
function! OpenBrowser(lenguage, port)
  execute "call ExecuteCode(a:lenguage)"
  execute "! google-chrome http://localhost:" . a:port
endfunction

" --------------------------------------------------------------------------
"  Terminal maps

" Map to open a terminal
nnoremap <C-t> :call OpenTerminal()<CR>

" RUNNING
autocmd FileType python nnoremap <Leader>b :call ExecuteCode("python3 %")<CR>
autocmd FileType javascript nnoremap <Leader>b :call ExecuteCode("node %")<CR>
autocmd FileType html nmap <Leader>b :! xdg-open %<CR>
autocmd FileType markdown nnoremap <Leader>b :call ExecuteCode("markserv %")<CR>
"autocmd FileType c nmap <Leader>b :! gcc %<CR>:! ./a.out<CR>

" ANOTHER RUNNING PROCESS
autocmd FileType javascript nnoremap <Leader>br :call ExecuteCode("npm start")<CR>
autocmd FileType python nnoremap <Leader>bf :call OpenBrowser("python3 %", "5000")<CR>
autocmd FileType javascript nnoremap <Leader>be :call OpenBrowser("node %", "3000")<CR>
autocmd FileType html nnoremap <Leader>ls :call ExecuteCode("live-server")<CR>

" ==========================================================================
" PLUGINS MAPS

" --------------------------------------------------------------------------
" Nerd tree
nnoremap <C-n> :NERDTree<CR>
nmap ñ <C-n>ma

" --------------------------------------------------------------------------
" Easymotion
nmap <Leader>e <Plug>(easymotion-s2)

" --------------------------------------------------------------------------
" Lorem
autocmd FileType html,markdown imap <C-l> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.

" --------------------------------------------------------------------------
" Coc maps
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" --------------------------------------------------------------------------
" Emmet maps
let g:user_emmet_leader_key='<C-Z>'
imap <M-j> <C-Z>,
autocmd FileType html imap <C-y> html:5<C-Z>,
autocmd FileType html imap <S-Right> <CR><Up><End><CR>

" --------------------------------------------------------------------------
" Surround map
xmap s <Plug>VSurround

" --------------------------------------------------------------------------
" Fzf maps
nmap <Leader>f :Files<Cr>
nmap <Leader>F :Ag<Cr>
nmap <Leader>t :Buffers<CR>

" --------------------------------------------------------------------------
" Ultisnips
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"

" --------------------------------------------------------------------------
" Git maps
nmap <Leader>ga :! git add .<CR>
nmap <Leader>gc :! git commit -m ""
nmap <Leader>gp :call ExecuteCode("git push")<CR>
nmap <Leader>gs :! git status<CR>

" --------------------------------------------------------------------------
" ALE
nmap <Leader>j :ALENext<CR>
nmap <Leader>k :ALEPrevious<CR>

" --------------------------------------------------------------------------
" Copilot
nmap <Leader>h :Copilot panel<CR>
imap <C-j> <Plug>(copilot-next)
imap <C-k> <Plug>(copilot-previous)
