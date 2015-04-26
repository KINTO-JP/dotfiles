#!/bin/sh

if [ ! -L ~/.zprezto -a -d ~/dotfiles/prezto ]; then
    ln -s ~/dotfiles/prezto ~/.zprezto
fi

ln -s $HOME/dotfiles/.zlogin $HOME/.zlogin
ln -s $HOME/dotfiles/.zlogout $HOME/.zlogout
ln -s $HOME/dotfiles/.zpreztorc $HOME/.zpreztorc
ln -s $HOME/dotfiles/.zprofile $HOME/.zprofile
ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/scripts/loadaverage /usr/local/bin/loadaverage
ln -s $HOME/dotfiles/scripts/pc-running-time /usr/local/bin/pc-running-time
ln -s $HOME/dotfiles/scripts/used-mem /usr/local/bin/used-mem

mkdir $HOME/.vimtmp

mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +":NeoBundleInstall" +:q
