export TERM=xterm-256color

if [ `uname` = "Darwin" ]; then
  export PATH=/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$HOME/.cabal/bin:$PATH
	eval `gdircolors ${HOME}/.dir_colors`
	alias ls='ls -hF -G'
elif [ `uname -o` = "GNU/Linux" ]; then
  eval "$(rbenv init -)"
	eval `dircolors ${HOME}/.dir_colors`
	alias ls='ls -hF --color=auto'
elif [ `uname` = "FreeBSD" ]; then
  eval "$(rbenv init -)"
  alias ls='ls -GhF'
  function doall() {
    sudo "$@"
    local jails="$(jls | grep -v JID | awk '{ print $1 }')"
    echo "${jails}" | xargs -I {} sudo jexec {} "$@"
  }
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/llvm36/lib/
fi

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit" 
