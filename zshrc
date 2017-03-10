

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi






#autoload colors zsh/terminfo
#colors

autoload -Uz promptinit
promptinit
prompt steeef

export TERM=xterm-256color

# Alias  neovim
alias v='nvim'

# Default editor
  export EDITOR="nvim"
  export USE_EDITOR=$EDITOR
  export VISUAL=$EDITOR

# Autorun Tmux
  if [ "$TMUX" = "" ]; then tmux; fi

# Auto cd
setopt auto_cd

#Spellcheck
setopt correctall
alias git status='nocorrect git status'

# c-h BS hack for vim
# infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
# tic $TERM.ti

# Package Manager
