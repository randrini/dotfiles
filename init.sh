#!/bin/bash

#Essential packages
#sudo pacman -Syyu
  sudo pacman --needed --noconfirm -S zsh tmux the_silver_searcher terminator neovim python-pip python-setuptools ttf-hack 
  #sudo pacman -Syu --force python2-neovim python-neovim

#Set ZSH as default shell
  chsh -s $(which zsh)

#Set configs
  rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null
  rm -f ~/.local/share/xfce4/terminal/colorschemes/base16-harmonic16-dark.16.theme 2> /dev/null
  rm -rf ~/.config/rofi
  mkdir -p ~/.config ~/.config/nvim  # ~/.config/rofi/

# Vim-plug for Neovim
 curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Sym link dots
  ln -s ~/dotfiles/zsh_conf ~/.zshrc
  ln -s ~/dotfiles/tmux_conf ~/.tmux.conf
  ln -s ~/dotfiles/nvim_conf ~/.config/nvim/init.vim
  #ln -s ~/dotfiles/vimscheme/base16-harmonic16-dark.16.theme ~/.local/share/xfce4/terminal/colorschemes/harmonic.theme
# ln -s ~/dotfiles/rofic ~/.config/rofi/config

#----------------------- END OF Preconfig ----------------------------
