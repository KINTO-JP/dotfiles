Installtion
========

前提条件

 - git
 - Vim 7.4以上

```
$ git clone git@github.com:scrtree/dotfiles.git
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
$ git config --global core.editor "/YOUR_PATH/vim"
```

zshの設定
---
preztoと.zlogin .zlogout .zprofile .zshenv .zshrc のシンボリックリンクを貼る

アップデートするときのコマンド
```
$ git pull && git submodule update --init --recursive
```

tmuxの設定
---
```
brew install reattach-to-user-namespace
```
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

###プラグインの導入方法
プラグインのインストール

**:NeoBundleInstall**

プラグインのアップデート

**:NeoBundleInstall!**
or
**:NeoBundleUpdate**

プラグインのアンインストール

**:NeoBundleClean**


