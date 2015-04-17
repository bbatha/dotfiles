# Autoload screen if we aren't in it.  (Thanks Fjord!)
#if [[ $STY = '' ]] then tmux attach || tmux; fi

#{{{ ZSH Modules

autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

#}}}

#{{{ Options

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt NO_HUP

setopt VI

# only fools wouldn't do this ;-)
export EDITOR="vim"


setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# beeps are annoying
setopt NO_BEEP

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

setopt COMPLETE_IN_WORD # Complete from the middle of a word

setopt always_to_end # complete and move cursor to end

#}}}

#{{{ Variables
export RI="--format ansi"

declare -U path

#export LANG=en_US
#}}}

#{{{ External Files

# Include stuff that should only be on this
if [[ -r ~/.localinclude ]]; then
    source ~/.localinclude
fi

# Include local directories
if [[ -r ~/.localdirs ]]; then
        source ~/.localdirs
fi

autoload run-help
HELPDIR=~/zsh_help

#}}}

#{{{ Aliases

#{{{ Amarok
#if [[ -x =amarok ]]; then
#  alias play='dcop amarok player play'
#  alias pause='dcop amarok player pause'
#  alias next='dcop amarok player next'
#  alias prev='dcop amarok player prev'
#  alias stop='dcop amarok player stop'
#  alias current='dcop amarok player nowPlaying'
#  alias osd='dcop amarok player showOSD'
#  alias pp='dcop amarok player playPause'
#fi

#}}}

#{{{ Shell Conveniences

alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
alias mk=popd

#}}}

#{{{ Package management

#if [[ -x =aptitude ]]; then
#  alias attd="sudo xterm -C aptitude"
#else
#  if [[ -x =emerge ]]; then
#    alias emu='sudo emerge -uDN world'
#    alias emup='sudo emerge -uDvpN world'
#    alias esy='sudo emerge --sync'
#    alias ei='sudo emerge'
#    alias eip='sudo emerge -vp '
#    alias packmask='sudo vi /etc/portage/package.unmask'
#    alias packuse='sudo vi /etc/portage/package.use'
#    alias packkey='sudo vi /etc/portage/package.keywords'
#  fi
#fi
#
##}}}
#
## Convenient.  Also works in Gentoo or Ubuntu
#if [[ -x `which irb1.8` ]]; then
#  alias irb='irb1.8 --readline -r irb/completion'
#else
#  alias irb='irb --readline -r irb/completion'
#fi
#
#}}}

#{{{ Globals...

alias -g G="| grep"
alias -g L="| less"

#}}}

#{{{ Suffixes...

if [[ $DISPLAY = '' ]] then
  alias -s txt=vim
else
  alias -s txt=gvim
fi

#}}}

#}}}

#{{{ Completion Stuff

# Faster! (?)
zstyle ':completion::complete:*' use-cache 1

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

unsetopt LIST_AMBIGUOUS
setopt  COMPLETE_IN_WORD

# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

# Egomaniac!
zstyle ':completion:*' list-separator 'fREW'

# complete with a menu for xwindow ids
zstyle ':completion:*:windows' menu on=0
zstyle ':completion:*:expand:*' tag-order all-expansions

# more errors allowed for large words and fewer for small words
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'

# Errors format
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'

# Don't complete stuff already on the line
zstyle ':completion::*:(rm|vi):*' ignore-line true

# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd

zstyle ':completion::approximate*:*' prefix-needed false

#}}}

#{{{ Key bindings

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
#bindkey -M vicmd "/" history-incremental-search-backward
#bindkey -M vicmd "?" history-incremental-search-forward
#
## Search based on what you typed in already
#bindkey -M vicmd "//" history-beginning-search-backward
#bindkey -M vicmd "??" history-beginning-search-forward
#
bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
#bindkey -M vicmd "q" push-line

# Ensure that arrow keys work as they should
#bindkey '\e[A' up-line-or-history
#bindkey '\e[B' down-line-or-history
#
#bindkey '\eOA' up-line-or-history
#bindkey '\eOB' down-line-or-history
#
#bindkey '\e[C' forward-char
#bindkey '\e[D' backward-char
#
#bindkey '\eOC' forward-char
#bindkey '\eOD' backward-char

#bindkey -M viins 'jj' vi-cmd-mode
#bindkey -M vicmd 'u' undo

# Rebind the insert key.  I really can't stand what it currently does.
bindkey '\e[2~' overwrite-mode

# Rebind the delete key. Again, useless.
#bindkey '\e[3~' delete-char

#bindkey -M vicmd '!' edit-command-output

# it's like, space AND completion.  Gnarlbot.
#bindkey -M viins ' ' magic-space

bindkey -e
#}}}

#{{{ History Stuff

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#}}}


autoload -U compinit
compinit
autoload -U colors
colors
setopt PROMPT_SUBST
export PROMPT="[%(!..)%n%f@%m%f%(!..) %1/]%# "

##{{{ Prompt!
#
#host_color=cyan
#history_color=yellow
#user_color=green
#root_color=red
#directory_color=magenta
#error_color=red
#jobs_color=green
#
#host_prompt="%{$fg_bold[$host_color]%}%m%{$reset_color%}"
#
#jobs_prompt1="%{$fg_bold[$jobs_color]%}(%{$reset_color%}"
#
#jobs_prompt2="%{$fg[$jobs_color]%}%j%{$reset_color%}"
#
#jobs_prompt3="%{$fg_bold[$jobs_color]%})%{$reset_color%}"
#
#jobs_total="%(1j.${jobs_prompt1}${jobs_prompt2}${jobs_prompt3} .)"
#
#history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"
#
#history_prompt2="%{$fg[$history_color]%}%h%{$reset_color%}"
#
#history_prompt3="%{$fg_bold[$history_color]%}]%{$reset_color%}"
#
#history_total="${history_prompt1}${history_prompt2}${history_prompt3}"
#
#error_prompt1="%{$fg_bold[$error_color]%}<%{$reset_color%}"
#
#error_prompt2="%{$fg[$error_color]%}%?%{$reset_color%}"
#
#error_prompt3="%{$fg_bold[$error_color]%}>%{$reset_color%}"
#
#error_total="%(?..${error_prompt1}${error_prompt2}${error_prompt3} )"
#
#case "$TERM" in
#  (screen)
#    function precmd() { print -Pn "\033]0;S $TTY:t{%100<...<%~%<<}\007" }
#  ;;
#  (xterm)
#    directory_prompt=""
#  ;;
#  (*)
#    directory_prompt="%{$fg[$directory_color]%}%~%{$reset_color%} "
#  ;;
#esac
#
#if [[ $USER == root ]]; then
#    post_prompt="%{$fg_bold[$root_color]%}%#%{$reset_color%}"
#else
#    post_prompt="%{$fg_bold[$user_color]%}%#%{$reset_color%}"
#fi
#
#PS1="${host_prompt} ${jobs_total}${history_total} ${directory_prompt}${error_total}${post_prompt} "


#if [[ $TERM == screen]; then
     #function precmd() {
          #print -Pn "\033]0;S $TTY:t{%100<...<%~%<<}\007"
             #}
#elsif [[ $TERM == linux ]]; then
    #precmd () { print -Pn "\e]0;%m: %~\a" }
#fi

#}}}

#{{{ Functions

#function vi {
        #LIMIT=$#
        #for ((i = 1; i <= $LIMIT; i++ )) do
                #eval file="\$$i"
                #if [[ -e $file && ! -O $file ]]
                #then
                        #otherfile=1
                #else

                #fi
        #done
        #if [[ $otherfile = 1 ]]
        #then
                #command sudo vi "$@"
        #else
                #command vi "$@"
        #fi
#}

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1  # Because we didn't really complete anything
}

edit-command-output() {
 BUFFER=$(eval $BUFFER)
 CURSOR=0
}
zle -N edit-command-output

#}}}

#{{{ Testing... Testing...
#exec 2>>(while read line; do
#print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)

#watch=(notme)
LOGCHECK=0

#}}}

#{{{ ZSH Modules

export PAGER=less
autoload -U compinit promptinit zcalc zsh-mime-setup zmv
compinit
promptinit
zsh-mime-setup


#}}}
alias submodule-update='git submodule foreach git pull'

eval "$(rbenv init -)"
