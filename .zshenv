export TERM=xterm-256color
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$PATH
#export PKG_CONFIG=$HOME/local/lib/pkgconfig
#export LD_LIBRARY_PATH=$HOME/local/lib
if [ `uname` = "Darwin" ]; then
	eval `gdircolors ${HOME}/.dir_colors`
	alias ls='ls -hF -G'
elif [ `uname -o` = "GNU/Linux" ]; then
	eval `dircolors ${HOME}/.dir_colors`
	alias ls='ls -hF --color=auto'
fi
