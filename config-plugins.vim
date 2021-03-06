" Plugin indentLine config
set list lcs=tab:\|\ 
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0

" Themes
"let g:onedark_terminal_italics=1
"colorscheme onedark

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material

" Lightline theme
"let g:lightline = {
      "\ 'colorscheme': 'material_vim',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'FugitiveHead'
      "\ },
      "\ }

" NERDTree config
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'

" Auto pairs
let g:AutoPairsFlyMode = 0

" Fzf at top
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Fzf window position
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" Match colors with colorscheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Custom ultisnips
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/ultisnips']

" ALE
let g:ale_linters_explicit = 1 " Only run seted linters

" Linters
let b:ale_linters = {'javascript': ['eslint'], 'python': ['pylint'], 'html': ['stylelint'], 'css': ['csslint']}

" Fixers
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'python': ['autopep8'], 'html': ['prettier'], 'css': ['prettier']}
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_fix_on_save = 1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,markdown EmmetInstall
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<title></title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Prettier
let g:prettier#config#single_quote = 'true'

" Screenshots
let g:vimShotSavePath = '~/Pictures'

" LIghtline ale
let g:lightline = {
\ 'colorscheme': 'material_vim',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\   'right': [
\     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\     ['lineinfo'], ['percent'],
\     ['fileformat', 'fileencoding', 'filetype']
\   ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ 'inactive': {
\   'right': [['lineinfo'], ['percent']]
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok'
  \  },
  \ 'component_type': {
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right'
\  }
\}
" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "
