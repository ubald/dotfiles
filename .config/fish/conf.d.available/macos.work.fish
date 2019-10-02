# DOESN'T SEEM TO EXIST source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

alias k="kubectl"
alias kcontexts="kubectl config get-contexts"
alias kuse="kubectl config use-context"
alias kpods="kubectl get pods"
alias kscale="kubectl scale deploy"
alias kwpods="watch \"kubectl get pods\""