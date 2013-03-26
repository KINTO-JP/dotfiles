"-------------------------------------------------
" 基本設定
"-------------------------------------------------
" ファイルを開く際の文字コード設定
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

" vimで編集するときの文字コード設定
set encoding=utf-8

" twigをハイライトする
au BufRead,BufNewFile *.twig set filetype=htmldjango

" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1

" 文字列中のSQLをハイライトする
let php_sql_query=1

" OSのクリップボードを使用
set clipboard=unnamedplus

" 選択した文字をクリップボードに入れる
set guioptions+=a

" 高速ターミナル接続を行う
set ttyfast

" ビープ音を消す
set vb t_vb=

" ファイルを開いた時に最後のカーソル位置を再現する
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

"-------------------------------------------------
" Vim UI
"-------------------------------------------------
" カラーの有効化
syntax on

" [行,列]表示
set ruler

" タイトルをウィンドウに表示
set title

" ステータスラインを常に表示
set laststatus=2

" ステータスライン表示方法
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%l,%c%V%8P

" 行番号表示
set number

" カーソル表示(行)
set cursorline

" カーソル表示(列)
set cursorcolumn

" 括弧入力時の対応する括弧を表示
set showmatch

" 対応する括弧の表示時間を2にする
set matchtime=2

" 検索結果文字列のハイライトを有効にする
set hlsearch

" pasteモード切り替え
set pastetoggle=<F11>

" コマンド補完を強化
set wildmenu

" 入力中のコマンド表示
set showcmd

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  <  - [←]        ノーマルモード ビジュアルモード
"  >  - [→]         ノーマルモード ビジュアルモード
"  [ - [←]         挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,<,>,[,],~

" vimの色数制限
set t_Co=256

" カラースキーマ
colorscheme desert

" コマンド実行中は再描画しない
set lazyredraw

" マウス機能をフルに使用
set mouse=a
set ttymouse=xterm2

" 挿入モードとノーマルモードでステータスラインの色変更
" ノーマルモードは青色
" 挿入モードは赤色
au InsertEnter * hi StatusLine guifg=White guibg=DarkRed gui=none ctermfg=White ctermbg=Red cterm=none
au InsertLeave * hi StatusLine guifg=While guibg=Blue gui=none ctermfg=White ctermbg=Blue cterm=none

"-------------------------------------------------
" Window設定
"-------------------------------------------------
" Window Split時に新Windowを右に表示
set splitright

" Window Split時に新windowを下に表示
set splitbelow

"-------------------------------------------------
" Help設定
"-------------------------------------------------
" Helpの言語設定
set helplang=ja
" set helplang=en

"-------------------------------------------------
" Backup設定
"-------------------------------------------------
" バッファを自動的に保存する
set autowrite

" 変更中のバッファを保存せずに、他のバッファに切り替え
set hidden

" Backupを取る
set backup

" Backupファイルの作成場所を指定
set backupdir=$HOME/.vimtmp

" スワップファイルを作成
set swapfile

" スワップファイルの作成場所を指定
set directory=$HOME/.vimtmp

" コロンコマンドを記録する数
set history=10000

" スワップファイルの自動保存時間設定
" この時間の間 (ミリ秒単位) 入力がなければ、スワップファイルがディスクに書き込まれる
set updatetime=500

" viminfoファイルの設定
"set viminfo=""

" 変数のスコープ
let g:svbfre = '.\+'

"-------------------------------------------------
" インデント設定
"-------------------------------------------------
" タブを画面で表示する際の幅
set tabstop=4

" インデント時に使用されるスペースの数
set shiftwidth=4

" 前の行に基づいて新しい行をインデント
set autoindent

" インデントが{で増え、}で減る
set smartindent

"-------------------------------------------------
" Special Key
"-------------------------------------------------
" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
set list

" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
set listchars=tab:>-,trail:-,extends:<,precedes:<
highlight specialKey ctermfg=darkgray

" 全角スペースの表示
highlight ZenkakuSpace cterm=reverse ctermfg=darkgray gui=reverse guifg=darkgray
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"-------------------------------------------------
" キーマッピング
"-------------------------------------------------
" 最終行へ移動
map g<Space> G

" ----ノーマルモード時----
" esc連打で検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 検索時に結果が中央に来るようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" shiftキーを押さずに;を:へ出来るように設定
noremap ; :
noremap : ;

" Ctrl-iでHelpの参照
nnoremap <C-i>  :<C-u>help<Space>

" カーソルしたのキーワードでHelpの参照
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><CR>

" タブの切り替え
nnoremap bg gT

" splitの移をctrl押しながらhjklへ
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" カーソルを表示行で移動する。物理行移動は<C-n>, <C-p>
" nnoremap j gj
" nnoremap k gk

" 列の先頭と後尾へ移動
nnoremap 0 ^
nnoremap 9 $

" 強制全保存終了を無効化
nnoremap ZZ <Nop>

" スペースキーで画面移動
" nnoremap <Space> <PageDown>
" nnoremap <S-Space> <Pageup>

" 空白挿入
nnoremap <M-Space> i<Space><Esc><Right>

" .vimrcを即座に開く
nnoremap <Space>. :e $MYVIMRC<CR>

" vimrcの設定を反映してリロード
nnoremap <Space>.. :<C-u>source $MYVIMRC<CR>

" ----挿入モード時----
" 挿入モードからの脱出
inoremap <C-c> <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" 挿入モードの移動
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Del>

" ----ヴィジュアルモード時----
" >と<の連打でのインデントを変化
vnoremap < <gv
vnoremap > >gv
" tabの連打でのインデントを変化
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" スペースキーで画面移動
" vnoremap <Space> <C-d>
" vnoremap <S-Space> <C-u>

