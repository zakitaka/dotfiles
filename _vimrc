"filetype無効化"
filetype plugin indent off
"vi互換無効
set nocompatible

"*** 検索関係 ***
"インクリメンタルサーチ
set incsearch
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan

"*** タブ空白関係 ***
"タブの代わりに空白
set expandtab
"インデント時の空白数
set shiftwidth=2
"Tab が対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"インデント
set smartindent
" 改行時のコメントが続くのを無効にする
autocmd FileType * setlocal formatoptions-=ro

"*** 表示関係 ***
" ステータスラインを常に表示
set laststatus=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コマンドライン補完を拡張モードにする
set wildmenu
" カラースキーム
colorscheme molokai
" ルーラ
set ruler

"*** 検出関係 ***
" ファイル形式の検出
filetype on
" プラグインの検出
filetype plugin on

" キー設定
:nnoremap <ESC><ESC> :nohlsearch<CR>


"************************************************************************"
"*** neobundle設定 ***
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neocomplcache'
:let g:neocomplcache_enable_at_startup = 1
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'git://github.com/vim-scripts/AutoComplPop.git'
:let g:acp_enableAtStartup = 0
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'DrawIt'
NeoBundle 'Align'
:let g:Align_xstrlen = 3
:let g:DrChipTopLvlMenu = ''
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'kana/vim-smartchr'
inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
inoremap <expr> , smartchr#loop(', ', ',')
NeoBundle 'taku-o/vim-toggle'
" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'

"*** autocmd  ***
autocmd BufNewFile *.sh 0r ~/.vim/template/script.txt
autocmd BufNewFile *.plist 0r ~/.vim/template/plist.txt
" カーソル位置を記憶する
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" unite.vimの設定
"" unite.vim {{{
  " The prefix key.
  nnoremap    [unite]   <Nop>
  nmap    <Space>u [unite]
   
  " unite.vim keymap
  nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
  nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
  nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
  nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
   
  " vinarise
  let g:vinarise_enable_auto_detect  =  1
   
"" }}}

" キーマップ
noremap <Space>h  ^
noremap <Space>l  $
nnoremap <Space>/  *

"filetype有効化"
filetype plugin indent on

" 固有の設定の読み込み
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
