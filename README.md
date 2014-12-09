Installtion
========

前提条件
gitインストール済

※mac版
homebrewインストール済

```
$ git clone git@github.com:utiwa/dotfiles.git
$ cd dotfiles
$ sh setup.sh
```
##git commit した時のコミットのエラー回避方法
```
ex:
error: There was a problem with the editor 'vi'.
Please supply the message using either -m or -F option.
```
###使用するエディタをgitに設定
```
$ git config --global core.editor "/usr/bin/vim"
```

zshの設定
---
ここ読めばわかる！
http://news.mynavi.jp/column/zsh/index.html

tmuxの設定
---
scriptisディレクトリの中にある
__loadaverage, pc-running-time, used-mem__を
__/usr/local/bin__などPATHの遠ている場所に置く

###PATHの設定の確認方法
```
echo $PATH
```

###PCに搭載しているメモリの量にused-memの以下の4の数字のところを書き換える
```
 # 搭載メモリ(理論値): 4GBの場合
echo "TOTAL_MEM: $((4 * 1024)) MB (Theoretical value)"
```

###スクリプトに実行権限を与える
```
chmod u+x used-mem pc-running-time loadaverage
```

vimの設定
---
バックアップとスワップファイルの保存場所を作成
```
$ mkdir .vimtmp
```
NeoBundleのSetup
```
$ mkdir -p ~/.vim/bundle
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

###プラグインの導入方法
プラグインのインストール

**:NeoBundleInstall**

プラグインのアップデート

**:NeoBundleInstall!**

**:NeoBundleUpdate**

プラグインのアンインストール

**:NeoBundleClean**


