export TERM=xterm-256color

if [ `uname` = "Darwin" ]; then
    export PATH=/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$PATH
	eval `gdircolors ${HOME}/.dir_colors`
	alias ls='ls -hF -G'
elif [ `uname -o` = "GNU/Linux" ]; then
    export PATH=$HOME/local/bin:$PATH
	eval `dircolors ${HOME}/.dir_colors`
	alias ls='ls -hF --color=auto'
fi
if [ $(uname -n | grep -c .lanl.gov) = 1 ]; then
    export http_proxy="http://proxyout.lanl.gov:8080"
    export PATH=$PATH:/usr/lanl/bin
    export PKG_CONFIG=$HOME/local/lib/pkgconfig
    export LD_LIBRARY_PATH=$HOME/local/lib
fi
