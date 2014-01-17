set fish_theme fishface

set fish_plugins git


function fish_prompt
  function _git_branch_name
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end

  function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
  end

  set -l blue (set_color -o blue)
  set -l green (set_color -o green)

  if [ (_git_branch_name) ]
    echo -n -s "$green><(((\"> "
  else
    echo -n -s "$blue><(((\"> "
  end
end

alias 'gst' 'git status '
alias 'gps' 'git push '
alias 'gpl' 'git pull '
alias 'gco' 'git checkout '
alias 'be' 'bundle exec '
