# Unix configuration

set -gx fish_user_paths $HOME/.local/bin $fish_user_paths

alias docker-clean-containers="docker rm (docker ps -a -q)"
alias docker-remove-untagged-images="docker rmi (docker images | awk '/^<none>/ {print $3}')"
# docker rmi (docker images --filter "dangling=true" -q --no-trunc)