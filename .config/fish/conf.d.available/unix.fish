# Unix configuration

set -gx fish_user_paths $HOME/.local/bin $fish_user_paths

alias docker-clean-containers="docker rm (docker ps -a -q)"
alias docker-remove-untagged-images="echo (docker images | awk \'/^<none>/ {print $3}\')"
# docker rmi (docker images --filter "dangling=true" -q --no-trunc)

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

fish_add_path /usr/local/go/bin
fish_add_path ~/bin
fish_add_path ~/.phpenv/bin

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
