# Theme
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_title_display_process yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal

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

export EDITOR='vim'

set -gx PATH ~/Library/Python/3.6/bin $PATH

if test -e ~/.vars
    source ~/.vars
end

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end
