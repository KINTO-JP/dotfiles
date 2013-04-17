Installtion
========

```
$ git clone git@github.com:utiwa/dotfiles.git
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

zshの導入
---
#あとで書く

tmuxの導入
---
scriptisディレクトリの中にある**loadaverage, pc-running-time, used-mem**を**/usr/local/bin**などPATHの遠ている場所に置く

PATHの設定の確認方法
```
echo $PATH
```
PCに搭載しているメモリの量にused-memの以下の所を書き換える
```
 # 搭載メモリ(理論値): **4**GBの場合
echo "TOTAL_MEM: $((**4** * 1024)) MB (Theoretical value)"
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

プラグインのアンインストール

**:NeoBundleClean**


