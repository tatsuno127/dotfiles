"---------------------
" base setting
"---------------------
"
set clipboard=unnamedplus

" vi互換にしない"
set nocompatible
" カーソルを行頭、行末で止まらないようにする。"
set whichwrap=b,s,h,l,<,>,[,]

" 全モードでマウスを有効化
set mouse=a

set encoding=utf-8

"---------------------
" display
"---------------------
" タイトルをウィンドウに表示
set title

" バイナリファイルを16進数で表示
set display=uhex

" 行番号を表示
set number
" ルーラーを表示
set ruler
set shortmess+=I

" 入力中のコマンドをステータスに表示
set showcmd
"コマンドラインに使われるスクリーン上の行数
set cmdheight=2

" カーソルの上、下に表示する最小限の行数 "
set scrolloff=5

" ステータスラインを常時表示 "
set laststatus=2
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

" 括弧入力時の対応する括弧の表示 "
set showmatch
set matchtime=2

" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して次の行へ
set wrap

" fileencodingsの設定を前から順に試してはじめにマッチしたものを採用
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis,cp932

"------------------
" edit
"------------------
" バックスペースでインデントを削除可能に
set backspace=indent,eol,start
" クリップボードを使用
set clipboard=unnamed

" オートインデントを有効に
set autoindent
" タブが対応する空白の数
set tabstop=4
set softtabstop=4
" オートインデントでの字下げの空白数
set shiftwidth=4
" タブの代わりに空白を使う
set expandtab

" ----------------
"  search
" ----------------
" 検索時に大文字小文字を区別しない
set ignorecase
" 最後まで検索したら最初へ戻る
set wrapscan
" 即検索（インクリメンタルサーチ）を使わない
set noincsearch

" ------------------
"  neobundle
" -----------------

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle'))

" Let Neobundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'git://github.com/aharisu/vim_goshrepl.git'

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'vim-scripts/twilight'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'amdt/vim-niji'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'windows' :'make -f make_mingw32.mak',
        \ 'cygwin'  :'make -f make_cygwin.mak',
        \ 'mac'     :'make -f make_mac.mak',
        \ 'unix'    :'make -f make_unix.mak',
    \},
\}

" add plugins
filetype plugin on

NeoBundleCheck


" ------------------
"  neocomplcache
"  -----------------


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntaxkeyword length
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku*'

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_commom_string()

" Recommended key-mappings.
" <CR> : close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function() <CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup(). "\<CR>"
endfunction
" <TAB> : completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup(). "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup(). "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup().
inoremap <expr><C-e> neocomplcache#close_popup().

" --------------------
"  lightline
" --------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" --------------------
"  Unite 
" --------------------
let g:unite_enable_start_insert=1
nnoremap <silent> ,uu :<C-u>Unite file buffer<CR>

" --------------------
"  original
" --------------------
nnoremap ' :
nnoremap ; :

colorscheme molokai
