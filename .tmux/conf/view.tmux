# tmuxを256色表示できるようにする
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'

source-file ~/.tmux/iceberg_minimal.tmux.conf
# source-file ~/.tmux/tmuxcolors-dark.conf

# ステータスバーの設定
set-option -g status-position top
set-option -g status-justify centre
set-option -g base-index 1
set-option -g pane-base-index 1
set-option -g status-interval 1
set-option -g status-left-length 90
set-option -g status-right-length 90
set-option -g status-left '#{?client_prefix,#[reverse],} #h[#S] #[default]'
set-window-option -g window-status-format " #I:#W "
set-window-option -g window-status-current-format "#[fg=#141414,bg=#849cc4] #I:#W #[default]"
set -g status-right '#(~/.tmux/scripts/wifi)#{battery_status_bg}#{battery_color_fg}#{battery_percentage}#[default] [%H:%M %Y-%h-%d %a]'
