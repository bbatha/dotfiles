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

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
