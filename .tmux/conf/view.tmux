# tmuxを256色表示できるようにする
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'

# ステータスバーの設定
set-option -g status-position top
set-option -g status-justify centre
set-option -g base-index 1
set-option -g pane-base-index 1
set-option -g status-interval 1
set-option -g status-left-length 90
set-option -g status-right-length 90
set-option -g status-left '#{?client_prefix,#[reverse],} #h[#S] #[default]'
set-option -g status-right '#(~/.tmux/scripts/wifi) #(~/.tmux/scripts/battery --tmux) [%Y-%m-%d(%a) %H:%M]'

# ウィンドウバーの設定
set-window-option -g window-status-format " #I:#W"
set-window-option -g window-status-current-format " #I:#W"

source-file ~/.tmux/iceberg_minimal.tmux.conf
# source-file ~/.tmux/tmuxcolors-dark.conf
