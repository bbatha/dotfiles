source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
source ~/.zsh_plugins.zsh

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

kube_context() {
  kubectl config current-context
}

PS1=$'[$(date)] - ($(pwd)) ($(kube_context)) $(vcs_info_wrapper);\n'

# add frequency tracking to FZF
# fd will make it so that sub-directories of PWD are prioritized
export FZF_CTRL_T_COMMAND='command cat <(fre --sorted) <(fd -t d) <(fd -t d . ~)'
export FZF_CTRL_T_OPTS='--tiebreak=index'

# add directory jumps to fre
fre_chpwd() {
  fre --add "$(pwd)"
}
typeset -gaU chpwd_functions
chpwd_functions+=fre_chpwd

fpath+=~/.zfunc
autoload -Uz compinit && compinit
setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true
setopt correct

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

bindkey -e
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
## Emacs style
zle -N edit-command-line
#bindkey '^xe' edit-command-line
#bindkey '^x^e' edit-command-line

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PNPM_HOME="/home/paperspace/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bbatha/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bbatha/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bbatha/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bbatha/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Paperspace
export PAPERSPACE_INSTALL="/Users/bbatha/.paperspace"
export PATH="$PAPERSPACE_INSTALL/bin:$PATH"
