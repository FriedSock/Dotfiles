[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

alias gst='git status '
alias gps='git push '
alias gpl='git pull '
alias gco='git checkout '
alias be='bundle exec '
export PATH=$PATH:/Users/jackbracewell/bin
export PATH=$PATH:/Users/jackbracewell/go/src/github.com/deliveroo/co-restaurants/bin
COLUMNS=1000
export GOPATH=$HOME/go

source ~/.bashrc
#export PATH="/usr/local/opt/go@1.12/bin:$PATH"

#export NVM_DIR=~/.nvm
#. $(brew --prefix nvm)/nvm.sh
export CO_RESTAURANTS_TEST_DATABASE_URL="postgres://localhost/co-restaurants-test"
export CO_RESTAURANTS_TEST_DATABASE_URL="postgres://localhost/co-restaurants-test"
export CO_RESTAURANTS_TEST_REDIS_URL="redis://localhost:6379/1"
export GO111MODULE=on
