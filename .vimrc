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

set ignorecase
set notitle
set ruler

"#=========================
" plug.vim
"#=========================

set nocompatible
filetype plugin indent off

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
Plug 'Shougo/neocomplcache'
"Plug 'davidhalter/jedi-vim'
"Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {
    \ 'build': {
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
    \ },
\}

Plug 'tpope/vim-surround'

Plug 'nvie/vim-flake8'
Plug 'jimenezrick/vimerl'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/spec.vim'
Plug 'Blackrush/vim-gocode'
Plug 'andrewschleifer/nu-vim'
Plug 'Shougo/vimfiler'
Plug 'hynek/vim-python-pep8-indent'

Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'cocopon/iceberg.vim'
Plug 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Plug 'dag/vim-fish'
Plug 'dag/vim2hs'

Plug 'ElmCast/elm-vim'

Plug 'glabra/casl2.vim'

Plug 'pangloss/vim-javascript'
call plug#end()

let g:elm_format_autosave = 1

filetype plugin indent on

autocmd BufRead,BufNewFile *.cas set filetype=casl2

"swap semicolon for colon
noremap ; :
noremap : ;

" Tab Completion
map <Tab> <C-P>

set nowrap
set nu
set hlsearch
"nmap <Esc><Esc> :noh<CR>
noremap <Esc><Esc> :nohlsearch<CR><Esc>
hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4


filetype plugin on
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 "softtabstop=2


"run python code on vim
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>

"TagbarOpen

"Crontab設定
set backupskip=/tmp/*,/private/tmp/*

let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
set completeopt-=preview

let g:ref_alc_cmd='lynx -dump -nonumbers %s'

"iabbr
iabbr #= #========================

filetype plugin indent on

set shiftwidth=2

" vim-latex
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'

"=nu
augroup NuValidator
  autocmd!
  autocmd FileType html compiler nu-validator
augroup END

"au BufNewFile,BufRead *.nu,*.nujson,Nukefile
setf nu

"scheme
autocmd FileType scheme nnoremap <buffer> ,t :!gosh %<CR>
language C


" disable mouse
set mouse=

" disable beep
set visualbell t_vb=
set noerrorbells

" PEP8
let g:flake8_ignore="E111,E228"

set nocompatible

" Changelog
"let spec_chglog_format = "%c ayu <mac.ayu15@gmail.com.>"
"au FileType spec map <buffer> <LocalLeader>c <Plug>SpecCahngelog
"au BufNewFile,BufRead *.changelog setf spec
let g:changelog_timeformat = "%Y-%m-%d %H:%M"
let g:changelog_username = "Ayu <mac.ayu15@gmail.com>"

" template
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt

" scroll
"imap jjjj <esc>
"imap kkkk <esc>
"imap hhhh <esc>
"imap llll <esc>
inoremap jj <Esc>

set backspace=indent,eol,start


" ===============================
"      Cursor highlightings
" ===============================
set cursorline


" ===============================
"      Colorscheme
" ===============================
colorscheme monokai


" ======================
"   Plugin Settings
" ======================
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0


" ======================
"  Comment
"  =====================
autocmd FileType python :inoremap # X#
