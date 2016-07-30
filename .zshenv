#export TERM=xterm-256color

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

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
# Ubuntu make installation of Ubuntu Make binary symlink
PATH=/home/bbatha/.local/share/umake/bin:$PATH

alias vim=nvim
export EDITOR=nvim


export PATH="$HOME/.cargo/bin:$PATH"
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export CARGO_HOME=$HOME/.cargo

export RUST_SRC_PATH="$HOME/src/rust/src"
