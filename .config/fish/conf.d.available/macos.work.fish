# DOESN'T SEEM TO EXIST source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

alias k="kubectl"
alias kcontexts="kubectl config get-contexts"
alias kuse="kubectl config use-context"
alias kpods="kubectl get pods"
alias kscale="kubectl scale deploy"
alias kwpods="watch \"kubectl get pods\""

alias smooch_clean="rm -rf ./dist; mkdir ./dist; ln -s $PWD/resources $PWD/dist/resources; ln -s $PWD/views $PWD/dist/views"
alias smooch_update="smooch_clean; npm install"
alias smooch_reset="rm -rf ./node_modules; smooch_update"