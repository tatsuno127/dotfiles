" ============
" dein.vim
" ===========
if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/tatsuno/.config/nvim/dein/plugins')
  call dein#begin('/home/tatsuno/.config/nvim/dein/plugins')

  call dein#load_toml('/home/tatsuno/.config/nvim/dein.toml')
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  " call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/neocomplete.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


" ============
" ============
set clipboard=unnamedplus

set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set mouse=a
set encoding=utf-8

set number
set title
set ruler
set shortmess+=I
set showcmd
set cmdheight=2

set scrolloff=5
set laststatus=2
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

set showmatch
set matchtime=2

set textwidth=0
set wrap

set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis,cp932
set autoindent

syntax on

" --------------------
" keymaps 
" --------------------
nnoremap ' :
nnoremap ; :
let mapleader = ","

"------------------
" edit
"------------------
" バックスペースでインデントを削除可能に
set backspace=indent,eol,start
" オートインデントを有効に
set autoindent
" タブが対応する空白の数
set tabstop=4
set softtabstop=4
" オートインデントでの字下げの空白数
set shiftwidth=4
" タブの代わりに空白を使う
set expandtab
set smartindent

" ----------------
"  search
" ----------------
" 検索時に大文字小文字を区別しない
set ignorecase
" 最後まで検索したら最初へ戻る
set wrapscan
" 即検索（インクリメンタルサーチ）を使わない
set noincsearch

" ----------------
"  spell check
" ----------------
set spell
set spelllang=en,cjk

" ----------------
"  tabs
" ----------------
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
