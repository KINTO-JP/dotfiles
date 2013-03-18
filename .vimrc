"--------------------------------------------------------------------------
" 基本設定
"--------------------------------------------------------------------------
" ファイルを開く際の文字コード設定
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

" vimで編集するときの文字コード設定
set encoding=utf-8

" 変更中のバッファを保存せずに、他のバッファに切り替え
set hidden

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
 
" esc連打で検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" タブを画面で表示する際の幅
set tabstop=4
 
" インデント時に使用されるスペースの数
set shiftwidth=4
 
" 前の行に基づいて新しい行をインデント
set autoindent

" インデントが{で増え、}で減る
set smartindent

" pasteモード切り替え
set pastetoggle=<F11>

" コマンド補完を強化
set wildmenu
 
" 入力中のコマンド表示
set showcmd
 
" twigをハイライトする
au BufRead,BufNewFile *.twig set filetype=htmldjango 
 
" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1
 
" 文字列中のSQLをハイライトする
let php_sql_query=1

" vimの色数制限
set t_Co=256

" カラースキーマ
colorscheme desert
 
" 挿入モードとノーマルモードでステータスラインの色変更
" ノーマルモードは青色
" 挿入モードは赤色
au InsertEnter * hi StatusLine guifg=White guibg=DarkRed gui=none ctermfg=White ctermbg=Red cterm=none
au InsertLeave * hi StatusLine guifg=While guibg=Blue gui=none ctermfg=White ctermbg=Blue cterm=none

" マウス機能をフルに使用
set mouse=a
set ttymouse=xterm2

" OSのクリップボードを使用
set clipboard=unnamedplus

" 選択した文字をクリップボードに入れる
set guioptions+=a

" ファイルを開いた時に最後のカーソル位置を再現する
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" shiftキーを押さずに;を:へ出来るように設定
noremap ; :
noremap : ;

" ----ノーマルモード時
" タブの切り替え
nnoremap bg gT

" helpの参照
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>

" スペースキーで画面移動
" nnoremap <Space> <PageDown>
" nnoremap <S-Space> <Pageup> 

" バッファの最終行へ
map g<Space> G

" 空白挿入
nnoremap <M-Space> i<Space><Esc><Right>

" 強制全保存終了を無効化
nnoremap ZZ <Nop>

" ----挿入モード時
" 挿入モードからの脱出
inoremap <C-c> <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" ----ヴィジュアルモード時
" >と<の連打でのインデントを変化を可能
vnoremap < <gv
vnoremap > >gv

" スペースキーで画面移動
" vnoremap <Space> <C-d>
" vnoremap <S-Space> <C-u>

