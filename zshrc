#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

autoload colors zsh/terminfo
colors

# Alias  neovim
alias v='nvim'

# Autorun Tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Auto cd
setopt auto_cd

#Spellcheck
setopt correctall
alias git status='nocorrect git status'

# Package Manager
