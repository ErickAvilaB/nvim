" Install plugins
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'joshdick/onedark.vim'
"Plug 'ghifarit53/tokyonight-vim'

" Editor
" Icons
Plug 'ryanoasis/vim-devicons'
" File Explorer
Plug 'preservim/nerdtree'
" Search
Plug 'easymotion/vim-easymotion'
" Multiples buffer
Plug 'christoomey/vim-tmux-navigator'
" Line
Plug 'itchyny/lightline.vim'
" Auto close (){}...
Plug 'jiangmiao/auto-pairs'
" Autocompletation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntaxis
Plug 'sheerun/vim-polyglot'
" Make comments
Plug 'preservim/nerdcommenter'
" Close html tags
Plug 'alvan/vim-closetag'
" Color picker
Plug 'KabbAmine/vCoolor.vim'
" Emmet
Plug 'mattn/emmet-vim'
" Show css color preview
Plug 'ap/vim-css-color'
" Draw indent line
Plug 'Yggdroot/indentLine'
" Format python3 code
Plug 'tell-k/vim-autopep8'
" Surround plugin
Plug 'tpope/vim-surround'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
" Ultisnips
Plug 'SirVer/ultisnips'
" Signify
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" GitHub copilot
Plug 'github/copilot.vim'
" ALE
Plug 'dense-analysis/ale'
" Vim Fugitive
Plug 'tpope/vim-fugitive'
" Tabular
Plug 'godlygeek/tabular'
" Markdown
Plug 'preservim/vim-markdown'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Screenshots
Plug 'SergioRibera/vim-screenshot', { 'do': 'npm install --prefix Renderizer' }
" Material Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()
