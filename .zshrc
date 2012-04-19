# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
unsetopt appendhistory autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/bbatha/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt completealiases
autoload -U compinit promptinit
compinit
promptinit
