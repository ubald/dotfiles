# Brew Mac
set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths

set -gx fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/lib/ruby/gems/2.6.0/bin" $fish_user_paths

set -gx fish_user_paths "$HOME/go/bin" $fish_user_paths

set -gx fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/lib/python3.8/site-packages" $fish_user_paths
set -gx fish_user_paths "$HOME/Library/Python/3.8/bin" $fish_user_paths
# set -gx fish_user_paths "$HOME/Library/Python/3.7/bin" $fish_user_paths
# set -gx fish_user_paths "/usr/local/lib/python3.7/site-packages" $fish_user_paths
# set -gx fish_user_paths "$HOME/Library/Python/2.7/bin" $fish_user_paths

alias gfp="git fetch -p && git pull"
