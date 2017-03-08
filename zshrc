






autoload colors zsh/terminfo
colors

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

# Package Manager
