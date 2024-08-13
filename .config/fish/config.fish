# Theme
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_git_default_branches master main trunk
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes
set -g theme_display_virtualenv yes
set -g theme_display_nix yes
set -g theme_display_nvm yes
set -g theme_display_ruby yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_date no
set -g theme_title_display_process yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

# Colors
set fish_color_normal normal
set fish_color_command blue
set fish_color_quote green
set fish_color_redirection gray
set fish_color_end gray
set fish_color_error red
set fish_color_param cyan
set fish_color_comment brblack
set fish_color_match --background=brblue
set fish_color_search_match bryellow --background=brblack
set fish_color_operator bryellow
set fish_color_escape bryellow
set fish_color_cwd normal
set fish_color_autosuggestion 555 brblack
set fish_color_user brgreen
set fish_color_host normal
set fish_color_cancel -r

set fish_pager_color_prefix brblack
set fish_pager_color_completion white
set fish_pager_color_description yellow
set fish_pager_color_progress green
set fish_pager_color_secondary cyan

set fish_color_cwd_root red
set fish_color_history_current --bold
set fish_color_selection white --bold --background=brblack
set fish_color_status red
set fish_color_valid_path cyan

alias vim="nvim"
alias cat="bat"
alias ping="prettyping"

export EDITOR='vim'

if test -e ~/.vars
    source ~/.vars
end

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

thefuck --alias | source
set -xg FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -xg VIRTUAL_ENV_DISABLE_PROMPT '1'

load_nvm

pyenv init - | source

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ubald/bin/google-cloud-sdk/path.fish.inc' ]; . '/Users/ubald/bin/google-cloud-sdk/path.fish.inc'; end
