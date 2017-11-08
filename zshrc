# Path to your oh-my-zsh installation.
#
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mortalscumbag"

plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/bin:/Users/jackbracewell/.rvm/gems/ruby-2.1.2/bin:/Users/jackbracewell/.rvm/gems/ruby-2.1.2@global/bin:/Users/jackbracewell/.rvm/rubies/ruby-2.1.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jackbracewell/.rvm/bin"

export VIM="~/Code/neovim/runtime"
export TERM=xterm-256color
export ANSIBLE_COW_SELECTION=bud-frogs
export PATH="/usr/local/sbin:$PATH"
