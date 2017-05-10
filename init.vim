" ==================
" dein vim / plugins
" ==================
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml = '~/.dein.toml'
    let s:lazy_tom = '~/.dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy':0})

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/neosnippet')
    call dein#add('thinca/vim-quickrun')
    call dein#add('zchee/deoplete-jedi')
"    call dein#add('ryanoasis/vim-devicons')
    call dein#add('scrooloose/nerdtree')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
"    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('vim-airline/vim-airline')

    " call dein#load_toml(s:lazy_tom, {'lazy':1})
    call dein#end()
    call dein#save_state()
endif

" vimproc load first
if dein#check_install(['vimproc'])
    call dein#install(['vimproc'])
endif

if dein#check_install()
    call dein#install()
endif

" ==================
" Plugin Settings
" ==================
" -- deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
        \ neosnippet#expandable_or_jumpable() ?
        \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" -- neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.cache/neosnippet-snippets/neosnippets'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction


" -- indentLine
let g:indent_guides_auto_colors = 0
" set tabstop=2 shiftwidth=2 expandtab
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=black
" hi IndentGuidesOdd  ctermbg=white
" hi IndentGuidesEven ctermbg=darkgrey

" -- airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'
let g:Powerline_theme = 'kalisi'
let g:Powerline_colorscheme = 'kalisi'

" -- nerdtree s
let g:NERDTreeShowGitStatus = 1
let g:NERDTreeUpdateOnWrite = 1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=0
map <C-n> : NERDTreeTabsToggle<CR>

" -- jedi
autocmd FileType python setlocal completeopt-=preview 
let g:jedi#show_function_definition = 0

" -- vim-quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
au FileType qf nnoremap <silent><buffer>q :quit<CR>
let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap <Leader>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" -- flake
let g:syntastic_python_checkers = ["flake8"]


" ==================
" Others
" ==================
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

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

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

" -------------------
" other keymaps
" -------------------
nnoremap <C-h> <Nop>
nnoremap <C-l> <Nop>
nnoremap <C-j> <Nop>
nnoremap <C-k> <Nop>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" -------------------
" color scheme
" -------------------
colorscheme kalisi
set background=dark
