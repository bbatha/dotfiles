alias psql-dev="psql -h dev-db.paperspace.io -U postgres -d paperspace"
alias psql-staging="psql -h staging-db.paperspace.com -U adminps -d paperspace"
alias psql-prod="psql -h ps-db-prod.cluster-c1xm2pfayrwq.us-east-1.rds.amazonaws.com -p 16309 -U adminps -d paperspace"
alias psql-dev-logs="psql -h dev-staging-logs-db-cluster.cluster-c1xm2pfayrwq.us-east-1.rds.amazonaws.com -U postgres -d logs_dev"
alias psql-staging-logs="psql -h dev-staging-logs-db-cluster.cluster-c1xm2pfayrwq.us-east-1.rds.amazonaws.com -U postgres -d logs_staging"
alias psql-prod-logs="psql -h prod-logs-db-cluster.cluster-c1xm2pfayrwq.us-east-1.rds.amazonaws.com -p 5432 -U postgres -d logs"
alias psql-psdev="psql -h localhost -U postgres"
#export HOMEBREW_RABBITMQ="/usr/local/Cellar/rabbitmq/3.7.16/sbin"
export SRC_PATH="$HOME/repos"
export PROJECT_PATH="$SRC_PATH/psdev"
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

. $SRC_PATH/psdev/.rc
. "$SRC_PATH/.asdf/asdf.sh"

eval "$(go env | grep GOPATH)"
typeset -U path
path=(
  "$GOPATH/bin"
  "$HOME/.krew/bin"
  "$HOME/.cargo/bin"
  $path[@]
  "$PROJECT_PATH/bin"
)

export YVM_DIR="$HOME/.yvm"
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

. $HOME/.cargo/env

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PGDATA="$HOME/.pgdata"

alias vim='nvim'
alias gcloudscp='gcloud compute scp --ssh-key-file=~/.ssh/id_rsa'
alias less='less -R'
export EDITOR=nvim

[ -f /usr/local/share/zsh/site-functions ] && source /usr/local/share/zsh/site-functions

eval $(ssh-agent)
ssh-add

export GOPROXY=https://proxy.golang.org/

#minkube start --vm-driver=hyperkit
#eval $(minikube docker-env)
export GOPRIVATE=github.com/Paperspace

alias k=kubectl

#if [ -d "$HOME/.asdf" ]; then
#  . "$HOME/.asdf/asdf.sh"
#  . "$HOME/.asdf/completions/asdf.bash"
#fi
. "$HOME/.cargo/env"


