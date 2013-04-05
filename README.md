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
#あとで書く

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
プラグインのインストール
  :NeoBundleInstall
プラグインのアップデート
  :NeoBundleInstall!
プラグインのアンインストール
  :NeoBundleClean

