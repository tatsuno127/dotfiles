"---------------------
" base setting
"---------------------
set clipboard=unnamedplus

" vi互換にしない"
set nocompatible
" カーソルを行頭、行末で止まらないようにする。"
set whichwrap=b,s,h,l,<,>,[,]

" 全モードでマウスを有効化
set mouse=a

set encoding=utf-8

" disable tex conceal
let g:tex_conceal=''

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

" ------------------
"  neobundle
" -----------------
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let Neobundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ### color scehme
" NeoBundle 'jpo/vim-railscasts-theme'
" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
" NeoBundle 'vim-scripts/rdark'
" NeoBundle 'vim-scripts/twilight'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'jonathanfilip/vim-lucius'
"
" ### color scheme for lightline
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'nanotech/jellybeans.vim'

" ### gosh interpreter 
" NeoBundle 'git://github.com/aharisu/vim_goshrepl.git'

" ### quick run
NeoBundle 'thinca/vim-quickrun'

" ### complete 
NeoBundle 'Shougo/neocomplete'

" ### snipet
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'Shougo/neosnippet-snippets'

" ### color line 
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'Lokaltog/vim-powerline'

" ### unite
" NeoBundle 'Shougo/unite.vim'

" ### python
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'nvie/vim-flake8'
NeoBundle 'davidhalter/jedi-vim'

" ### vimproc
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'windows' :'make -f make_mingw32.mak',
        \ 'cygwin'  :'make -f make_cygwin.mak',
        \ 'mac'     :'make -f make_mac.mak',
        \ 'unix'    :'make -f make_unix.mak',
    \},
\}
call neobundle#end()

" add plugins
filetype plugin on

NeoBundleCheck
set completeopt-=preview

" -----------------
"  quick run
" -----------------
nmap <Leader>r <Plug>(quickrun)
let s:hooks = neobundle#get_hooks("vim-quickrun")
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
function! s:hooks.on_source(bundle)
    let g:quickrun_config = {
        \ "*": {"runner": "remote/vimproc"},
        \ }
endfunction

" ------------------
"  python
"  -----------------
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" ------------------
"  jedi-vim
"  -----------------
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#rename_command = '<Leader>R'

" ------------------
"  neocomplete
"  -----------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'jellybeans' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" --------------------
"  lightline
" --------------------
" let g:lightline = {
"     \ 'colorscheme': 'wombat',
"     \ 'component': {
"     \   'readonly': '%{&readonly?"🔏":""}',
"     \ }
"     \ }
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'component': {
\   'readonly': '%{&readonly?"":""}',
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

" --------------------
"  other
" --------------------
colorscheme molokai
highlight Normal ctermbg=none
