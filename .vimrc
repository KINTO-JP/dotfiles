"-------------------------------------------------
" NeoBundle設定
"-------------------------------------------------
" Be iMproved
set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" 設定の始まり
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" fugitive
" Vimのステータスラインにgitのbranchを表示する際に使用中
" http://yuku-tech.hatenablog.com/entry/20110427/1303868482
NeoBundle 'tpope/vim-fugitive'

" indent-guides
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=82
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=170
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1

" Node-Commenter
" http://nishikawasasaki.hatenablog.com/entry/20101226/1293374432
NeoBundle 'The-NERD-Commenter'
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1

" Emmet
NeoBundle 'mattn/emmet-vim'

" neocomplete
NeoBundle 'Shougo/neocomplete'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
" return neocomplete#close_popup() . "\<CR>"
" For no inserting <CR> key.
return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

"" ----Syntax----
" syntastic
" シンタックスエラーチェック
" https://github.com/scrooloose/syntastic
NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
" syntastic用にキーマップ設定
nnoremap ,sc :<C-u>SyntasticCheck<CR>
nnoremap ,e :<C-u>Errors<CR>

" jade-syntastic
" https://github.com/digitaltoad/vim-jade
NeoBundle 'digitaltoad/vim-jade'

" Markdown
NeoBundle 'tpope/vim-markdown'

" JSON
NeoBundle 'elzr/vim-json'

" Haskell
NeoBundle 'dag/vim2hs'
"" ----Haskell用----
" ghcmod-vim
NeoBundle 'eagletmt/ghcmod-vim'
" html-template-syntax
" yesodのテンプレートエンジンをハイライト表示
NeoBundle 'pbrisbin/html-template-syntax'
" neco-ghc
" 補完
NeoBundle 'eagletmt/neco-ghc'

"" ----ファイラ系----
" unite.vim
NeoBundle 'Shougo/unite.vim'
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" neomru.vim
" Unite.vimで最近使ったファイルを表示する
NeoBundle 'Shougo/neomru.vim'

" Node-Tree
" 参考 http://blog.livedoor.jp/kumonopanya/archives/51048805.html
NeoBundle 'scrooloose/nerdtree'
" Node-Tree用にキーマップ設定
nnoremap <silent> <C-e>      :NERDTreeToggle<CR>
" 引数なしでvimを開いたらNERDTreeを起動、引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く
autocmd vimenter * if !argc() | NERDTree | endif
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:nerdtreetype") && b:nerdtreetype == "primary") | q | endif
" NERDTreeIgnore 無視するファイルを設定
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
" NERDTreeShowHidden 隠しファイルを表示 Values: 0 or 1.
let g:NERDTreeShowHidden=1
" ブックマークや、ヘルプのショートカットをメニューに表示 Values: 0 or 1.
let g:NERDTreeMinimalUI=1
" NERDTreeを+|`などを使ってツリー表示 Values: 0 or 1.
let g:NERDTreeDirArrows=0
" マウス操作方法 Values: 1, 2 or 3.
let g:NERDTreeMouseMode=1

" FuzzyFinder
" 参考 http://d.hatena.ne.jp/mickey24/20090310/1236633777
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
" FuzzyFinder.vim用にキーマップ設定
nnoremap <Space>f f
nnoremap <Space>F F
nnoremap f <Nop>
nnoremap <silent> fb :FufBuffer!<CR>
nnoremap <silent> ff :FufFile!<CR>
nnoremap <silent> fl :FufLine<CR>
nnoremap <silent> fm :FufMruFile!<CR>
nnoremap <silent> fc :FufRenewCache<CR>
nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FufBuffer!<CR>
nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FufFile!<C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FufMruFile!<CR>

autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 1000
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

" 設定の終わり
call neobundle#end()

"-------------------------------------------------
" 基本設定
"-------------------------------------------------
" ファイルを開く際の文字コード設定
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

" vimで編集するときの文字コードの設定
set encoding=utf-8
set termencoding=utf-8

" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" twigをハイライトする
au BufRead,BufNewFile *.twig set filetype=htmldjango

" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1

" 文字列中のSQLをハイライトする
let php_sql_query=1

" OSのクリップボードを使用
set clipboard=unnamedplus,unnamed

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
" 参考: http://blog.ruedap.com/entry/20110712/vim_statusline_git_branch_name
" 行が長すぎるときに切り詰める位置
set statusline=%<
" バッファ番号
set statusline+=[%n]
" %m 修正フラグ
set statusline+=%m
" %r 読み込み専用フラグ
set statusline+=%r
" %h ヘルプバッファフラグ
set statusline+=%h
" %w プレビューウィンドウフラグ
set statusline+=%w
" fencとffを表示
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}
" バッファ内のファイルのタイプ
set statusline+=%y
" 空白スペース
" \ で1個、\ \ で2個になる
if winwidth(0) >= 130
  " バッファ内のファイルのフルパス
  set statusline+=\ %F
else
  " ファイル名のみ
  set statusline+=\ %t
endif
" 左寄せ項目と右寄せ項目の区切り
set statusline+=%=
" Gitのブランチ名を表示
set statusline+=%{fugitive#statusline()}
" 何行目にカーソルがあるか
set statusline+=\ \ %1l
set statusline+=/
" バッファ内の総行数
set statusline+=%L
" 何列目にカーソルがあるか
set statusline+=,
set statusline+=%c
" 画面上の何列目にカーソルがあるか
set statusline+=%V
" ファイル内の何％の位置にあるか
set statusline+=\ \ %P

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
imap <F11> <nop>
set pastetoggle=<F11>
autocmd InsertLeave * set nopaste

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

" ポップアップの色の設定
" (色一覧)http://h2plus.biz/hiromitsu/entry/674
" ノーマルアイテム
highlight Pmenu ctermbg=4
" 選択しているアイテム
highlight PmenuSel ctermbg=1
" スクロールバー
highlight PMenuSbar ctermbg=4
" スクロールバーのレバー
highlight PmenuThumb ctermfg=1

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


" 変数のスコープ
let g:svbfre = '.\+'

"-------------------------------------------------
" インデント設定
"-------------------------------------------------
" 挿入モードでTabを挿入するとき、代わりに適切な数の空白を使う
" （有効:expandtab/無効:noexpandtab）
set expandtab

" タブを画面で表示する際の幅
set tabstop=4

" Tabの挿入やBSの使用等の編集操作をするときに、Tabが対応する空白の数
set softtabstop=4

" インデント時に使用されるスペースの数
set shiftwidth=2

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
match ZenkakuSpace /　/

"-------------------------------------------------
" キーマッピング
"-------------------------------------------------
" 最終行へ移動
map g<Space> G

"" ----ノーマルモード時----
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

" タブの操作
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" splitの移をctrl押しながらhjklへ
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 列の先頭と後尾へ移動
nnoremap 0 ^
nnoremap 9 $

" 強制全保存終了を無効化
nnoremap ZZ <Nop>

" 空白挿入
nnoremap <M-Space> i<Space><Esc><Right>

" .vimrcを即座に開く
nnoremap <Space>. :e $MYVIMRC<CR>

" vimrcの設定を反映してリロード
nnoremap <Space>.. :<C-u>source $MYVIMRC<CR>

"" ----挿入モード時----
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

"" ----ヴィジュアルモード時----
" >と<の連打でのインデントを変化
vnoremap < <gv
vnoremap > >gv
" tabの連打でのインデントを変化
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

