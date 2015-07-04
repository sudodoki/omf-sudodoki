# name: sudodoki

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_ahead_count -a remote -a branch_name
  echo (command git log $remote/$branch_name..HEAD ^/dev/null | \
    grep '^commit' | wc -l | tr -d ' ')
end

function _git_dirty_remotes -a remote_color -a ahead_color
  set current_branch (command git rev-parse --abbrev-ref HEAD ^/dev/null)
  set current_ref (command git rev-parse HEAD ^/dev/null)

  for remote in (git remote)

    set -l git_ahead_count (_git_ahead_count $remote $current_branch)

    set remote_branch "refs/remotes/$remote/$current_branch"
    set remote_ref (git for-each-ref --format='%(objectname)' $remote_branch)
    if test "$remote_ref" != ''
      if test "$remote_ref" != $current_ref
        echo -n "$remote_color!"
        if [ $git_ahead_count != 0 ]
          echo -n "$ahead_color+$git_ahead_count$normal"
        end
      end
    end
  end
end

function fish_prompt
  set -l exit_code $status

  set -l gray (set_color 666)
  set -l blue (set_color 729fcf)
  set -l red (set_color red)
  set -l normal (set_color normal)
  set -l yellow (set_color ef2929)
  set -l orange (set_color ffb300)
  set -l green (set_color 8ae234)
  set -l white (set_color fff)

  echo -n -s $green (whoami)@(hostname) $white ':'

  set_color -o blue
  printf '%s ' (pwd)

  # Show git branch and dirty state
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    set dirty_remotes (_git_dirty_remotes $red $orange)

    if [ (_is_git_dirty) ]
      echo -n -s $yellow '(' $git_branch $red '*' $dirty_remotes $yellow ')' $normal
    else
      echo -n -s $yellow '(' $yellow $git_branch $red $dirty_remotes $yellow ')' $normal
    end
  end

  if test $exit_code -ne 0
    set dollar_color f00
  else
    set dollar_color fff
  end

  set_color $dollar_color
  printf '$ '

  set_color normal
end
