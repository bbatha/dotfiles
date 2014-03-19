export TERM=xterm-256color

if [ `uname` = "Darwin" ]; then
    export PATH=/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$PATH
	eval `gdircolors ${HOME}/.dir_colors`
	alias ls='ls -hF -G'
elif [ `uname -o` = "GNU/Linux" ]; then
    export PATH=/usr/local/lib/scala:/opt/jetbrains/idea/bin:$PATH
    export PATH=$HOME/local/bin:$PATH
    export JDK_HOME=/usr/lib/jvm/java-7-oracle/
	eval `dircolors ${HOME}/.dir_colors`
	alias ls='ls -hF --color=auto'
fi
if [ $(uname -n | grep -c .lanl.gov) = 1 ]; then
    export http_proxy="http://proxyout.lanl.gov:8080"
    export PATH=$PATH:$HOME/.cabal/bin:/usr/lanl/bin
    export PKG_CONFIG=$HOME/local/lib/pkgconfig
    export LD_LIBRARY_PATH=$HOME/local/lib:$HOME/local/lib64
    #export LIBRARY_PATH=$HOME/local/lib
    export LDFLAGS=-L$HOME/local/lib
    export CPPFLAGS=-I$HOME/local/include
    export CC=/usr/lanl/bin/gcc
fi

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit" 
