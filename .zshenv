export TERM=xterm-256color

if [ `uname` = "Darwin" ]; then
  export PATH=/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$PATH
	eval `gdircolors ${HOME}/.dir_colors`
	alias ls='ls -hF -G'
elif [ `uname -o` = "GNU/Linux" ]; then
	eval `dircolors ${HOME}/.dir_colors`
	alias ls='ls -hF --color=auto'
elif [ `uname` = "FreeBSD" ]; then
  alias ls='ls -GhF'
  alias doall="jls | grep -v JID | awk '{ print \$1 }' | xargs -I {} sudo jexec {} "
fi

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit" 
