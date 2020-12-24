"
"  ___      ___ ___  _____ ______   ________  ________     
" |\  \    /  /|\  \|\   _ \  _   \|\   __  \|\   ____\    
" \ \  \  /  / | \  \ \  \\\__\ \  \ \  \|\  \ \  \___|    
"  \ \  \/  / / \ \  \ \  \\|__| \  \ \   _  _\ \  \       
" __\ \    / /   \ \  \ \  \    \ \  \ \  \\  \\ \  \____  
"|\__\ \__/ /     \ \__\ \__\    \ \__\ \__\\ _\\ \_______\
"\|__|\|__|/       \|__|\|__|     \|__|\|__|\|__|\|_______|
"                                                         
"                                                         
" 2011- .vimrc

syntax on

"filetype plugin
filetype on
filetype plugin on
let g:user_zen_expandabbr_key = '<c-z>'

set backup
set backupdir=$HOME/.vim-backup
let &directory = &backupdir

set notitle
set ruler

" =====================
" encodings
" =====================
set encoding=utf-8
set fileencodings=euc-jp,sjis,utf-8
set fileformats=unix,mac,dos

"#=========================
" plug.vim
"#=========================

set nocompatible

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif



" ==========================
"   Plugins
" ==========================

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {
    \ 'build': {
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
    \ },
\}

Plug 'Shougo/vimfiler'

" completion, etc.
Plug 'Shougo/neocomplcache'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'Shougo/vimfiler'
Plug 'vim-scripts/sudo.vim'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'cocopon/iceberg.vim'

" python
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'

"go
Plug 'Blackrush/vim-gocode'


Plug 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Plug 'dag/vim-fish'
Plug 'dag/vim2hs'

" js
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx'
"Plug 'posva/vim-vue'
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'rhysd/clever-f.vim'

call plug#end()
"=====================================================

filetype plugin indent on

" ======== Misc Settings =============
" disable mouse
set mouse=

" disable beep
set visualbell t_vb=
set noerrorbells

set nocompatible

" map jj to Esc when insert mode
inoremap jj <Esc>

set backspace=indent,eol,start
"swap semicolon for colon
noremap ; :
noremap : ;

set nowrap
set number


" =============================================
" ================= Search ====================
" =============================================
set hlsearch
set incsearch
set ignorecase
noremap <Esc><Esc> :nohlsearch<CR><Esc>
set shortmess-=S


set nofoldenable  " disable folding

" Enable TrueColor
set termguicolors  " TrueColor
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" =============================================


set backupskip=/tmp/*,/private/tmp/*

let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
set completeopt-=preview

"iabbr
iabbr #= #========================

set shiftwidth=4



" ===============================
"      Cursor highlightings
" ===============================
set cursorline


" ===============================
"      Colorscheme
" ===============================
colorscheme monokai
colorscheme iceberg


" ===============================
"      Aliases
" ===============================
"command Esjis e ++enc=sjis
command Vf VimFiler -split -simple -winwidth=35 -no-quit


" ======================
"   Plugin Settings
" ======================
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0


" ======================
"  Indent
"  =====================
set smartindent



" ======================
"  Language Specific Settings
"  =====================

"  ====================== Python
filetype plugin on
"autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 "softtabstop=2
" PEP8
let g:flake8_ignore="E111,E228"

" Comment

autocmd FileType python :inoremap # #

"run python code on vim
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>


" ================= LaTeX
" vim-latex
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'

"==================== nu
augroup NuValidator
  autocmd!
  autocmd FileType html compiler nu-validator
augroup END

"au BufNewFile,BufRead *.nu,*.nujson,Nukefile
setf nu

"=================== Scheme
autocmd FileType scheme nnoremap <buffer> ,t :!gosh %<CR>
language C

" ================== Go
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4
