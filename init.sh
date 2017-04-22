#!/bin/bash

#Essential packages
#sudo pacman -Syyu
  sudo pacman --needed --noconfirm -S zsh tmux the_silver_searcher terminator neovim python-pip python-setuptools ttf-hack 
  sudo pacman -Syu --force python2-neovim python-neovim

#Fonts
#  yaourt --needed --noconfirm -S fira-code-git

# Vim-plug for Neovim
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Neovim for python
# sudo pip3 install neovim

#Set ZSH as default shell
  chsh -s $(which zsh)

#Set configs
  rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null
  rm -f ~/.local/share/xfce4/terminal/colorschemes/base16-harmonic16-dark.16.theme 2> /dev/null
  rm -rf ~/.config/rofi
  mkdir -p ~/.config ~/.config/nvim  # ~/.config/rofi/

# Sym link dots
  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
  ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
  ln -s ~/dotfiles/vimscheme/base16-harmonic16-dark.16.theme ~/.local/share/xfce4/terminal/colorschemes/harmonic.theme
#  ln -s ~/dotfiles/rofic ~/.config/rofi/config
#----------------------- END OF Preconfig ----------------------------
