" Line status
set laststatus=2
set noshowmode

" Editor config
set nocompatible
syntax on
set mouse=a
set showcmd
set encoding=utf-8
set showmatch
set clipboard=unnamedplus
set cursorline
set background=dark
set termguicolors
set splitright
set nofoldenable

" Numbers
set ruler
set numberwidth=1
set number
set relativenumber

" Indent
set shiftwidth=2
set expandtab
set autoindent
set smartindent
filetype indent on

" Search
set incsearch
set ignorecase

" Cursor
set guicursor+=i:-blinkwait150-blinkoff150-blinkon150

" Python host
let g:python3_host_prog = '/usr/bin/python3.8'
au FileType python setlocal formatprg=autopep8\ -

" True Color
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ALE
let g:ale_disable_lsp = 1

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/config-plugins.vim
so ~/.config/nvim/maps.vim
