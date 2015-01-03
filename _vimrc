"filetype無効化"
filetype plugin indent off
"vi互換無効
set nocompatible


"************************************************************************"
"*** neobundle設定 ***
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
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
inoremap <expr> = smartchr#loop('=', '==', ' = ')
inoremap <expr> , smartchr#loop(',', ', ')
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'vim-scripts/dbext.vim'
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
  nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
  nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
  nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
   
  " vinarise
  let g:vinarise_enable_auto_detect  =  1
   
"" }}}

" キーマップ
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>,   :<C-u>source $MYVIMRC<CR>
noremap <Space>h  ^
noremap <Space>l  $
nnoremap <Space>/  *


"挿入モード時、ステータスラインの色を変更
let g:hi_insert  =  'hi StatusLine gui = None guifg = Black guibg = Yellow cterm = None ctermfg = Black ctermbg = Yellow'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir  => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl,  '[\r\n]',  '',  'g')
  let hl = substitute(hl,  'xxx',  '',  '')
  return hl
endfunction

" quickrun
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }
nmap <Space>r <Plug>(quickrun)
set splitright

nnoremap <Space>o :only<CR>

" ag
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" bundle execでquicirunを実行する
" set ft=ruby.bundle で有効
let g:quickrun_config['ruby.bundle'] = { 'command': 'ruby', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }

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
"自動インデント時の空白数
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
" ルーラ
set ruler

" *** カラー設定***
" 背景
set background=dark
" 輝度を高くする
let g:solarized_visibility = "high"
" コントラストを高くする
let g:solarized_contrast = "high"
" カラースキーム
colorscheme solarized

"*** 検出関係 ***
" ファイル形式の検出
filetype on
" プラグインの検出
filetype plugin on

" *****************************************************
" 固有の設定の読み込み
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

"filetype有効化"
filetype plugin indent on
