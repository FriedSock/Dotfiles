set fish_theme fishface

set fish_plugins git

#function fish_prompt
#  function _git_branch_name
#    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
#  end

#  function _is_git_dirty
#    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
#  end

#  set -l blue (set_color -o blue)
#  set -l green (set_color -o green)

#if [ (_git_branch_name) ]
#    echo -n -s "$green><(((\"> "
#  else
#   echo -n -s "$blue><(((\"> "
#end
#end

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s' (git rev-parse --abbrev-ref HEAD)
        set_color normal
    end
end

function fish_prompt
    set last_status $status

    echo

    set_color magenta
    printf '%s' (whoami)
    set_color normal
    printf ' at '

    set_color yellow
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    git_prompt

    echo

    if test $last_status -eq 0
        set_color white -o
        printf '><((°> '
    else
        set_color red -o
        printf '[%d] ><((ˣ> ' $last_status
    end

    set_color normal
end

alias 'gst' 'git status '
alias 'gps' 'git push '
alias 'gpl' 'git pull '
alias 'gco' 'git checkout '
alias 'be' 'bundle exec '
alias 'ob' 'ruby /Users/jackbracewell/Code/git-off-my-lawn/tools/observe_history.rb'
alias 'gr' 'ruby /Users/jackbracewell/Code/git-off-my-lawn/plugin/markov/harvest.rb'
alias 'sm' 'ruby /Users/jackbracewell/Code/ctrlp-similar/script/item_item.rb'
alias 'tst' 'ruby /Users/jackbracewell/Code/ctrlp-similar/script/test.rb'
alias 'gc' 'ruby /Users/jackbracewell/Code/ctrlp-similar/plugin/get_commit_files.sh'

alias 'mvim' '~/Downloads/MacVim-snapshot-72/mvim'
