function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

function load_nvm --on-variable="PWD"
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"

    set -l nvmrc_version (env cat $nvmrc_path)
    set -l nvmrc_node_version (nvm version $nvmrc_version)
    if test "$nvmrc_node_version" = "N/A"
      nvm install $nvmrc_version --silent
      return
    end

    set -l node_version (nvm version)
    if test nvmrc_node_version != node_version
      nvm use $nvmrc_node_version --silent
      return
    end

    return
  end

  # set -l node_version (nvm version)
  # set -l default_node_version (nvm version default)
  # else if test "$node_version" != "$default_node_version"
  #   echo "Reverting to default Node version"
  #   nvm use default
  #   nvm deactivate --silent
  # end
  # if test "$node_version" != "none"
  #   nvm deactivate --silent
  # end
end

# ~/.config/fish/config.fish
# You must call it on initialization or listening to directory switching won't work
# load_nvm