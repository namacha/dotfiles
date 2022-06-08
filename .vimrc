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
set fileencodings=utf-8,euc-jp,sjis
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
"   Plugins>
" ==========================

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {
    \ 'build': {
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
    \ },
\}

Plug 'Shougo/vimfiler'

" LSP
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-around' " sources
Plug 'Shougo/ddc-matcher_head' " filters
Plug 'Shougo/ddc-sorter_rank' " filters
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'Shougo/pum.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'LumaKernel/ddc-file'
Plug 'matsui54/denops-signature_help'
Plug 'matsui54/denops-popup-preview.vim'

Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'Shougo/vimfiler'
Plug 'vim-scripts/sudo.vim'
Plug 'rhysd/clever-f.vim'

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

"Plug 'mattn/emmet-vim'

Plug 'dag/vim-fish'
Plug 'dag/vim2hs'

" js
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
"Plug 'posva/vim-vue'
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

" multi language syntax highlight
" Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/vcscommand.vim'

"Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }


call plug#end()
"=====================================================

" ======== LSP =============
call ddc#custom#patch_global('sources', ['around', 'nvim-lsp', 'file'])
" Use matcher_head and sorter_rank.
call ddc#custom#patch_global('sourceOptions', {
\ '_': {
\   'matchers': ['matcher_head'],
\   'sorters': ['sorter_rank'],
\  },
\ 'nvim-lsp': {
\ 'mark': 'L',
\ 'forceCompletionPattern': '\.\w*|:\w*|->\w*',
\ },
\ 'around': {'mark': 'A'},
\ 'file': {
\   'mark': 'F',
\   'isVolatile': v:true,
\   'forceCompletionPattern': '\S/\S*',
\  }
\ })

call ddc#enable()
call signature_help#enable()
call popup_preview#enable()
inoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

lua << EOF
lspconfig = require'lspconfig'
local opts = {noremap = true, silent = true}
local completion_callback = function (client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_knymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  require('completion').on_attach(client)
end
local lsp_installer = require "nvim-lsp-installer"
local lspconfig = require "lspconfig"
lsp_installer.setup()
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
    on_attach = on_attach,
    }
end
EOF

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


noremap p P
noremap P p

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

" very magic by default
nnoremap / /\v

set nofoldenable  " disable folding

" Enable TrueColor
set termguicolors  " TrueColor
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" =============================================


set backupskip=/tmp/*,/private/tmp/*

let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
set completeopt-=preview

"iabbr
iabbr #= #========================


" ===============================
"      Cursor highlightings
" ===============================
set cursorline


" ===============================
"      Colorscheme
" ===============================
colorscheme monokai
"colorscheme iceberg


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
" set shiftwidth=4
set expandtab


" ======================
"   KeyMaps
"  =====================
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader> V
nnoremap <CR> G
nnoremap <Leader>s :%s
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l




" ======================
"  Language Specific Settings
"  =====================

"  ====================== Python
filetype plugin on
"autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 shiftwidth=4 "softtabstop=2
" PEP8
let g:flake8_ignore="E111,E228"

" javascript
" autocmd FileType javascript setl list shiftwidth=2 smartindent expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setl shiftwidth=2
autocmd FileType typescriptreact setl shiftwidth=4 tabstop=4

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


"=================== Scheme
autocmd FileType scheme nnoremap <buffer> ,t :!gosh %<CR>
language C

" ================== Go
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4
