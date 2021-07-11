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

#### COLOUR (Solarized dark)

# default statusbar colors
set-option -g status-style fg=yellow,bg=black #yellow and base02

# default window title colors
set-window-option -g window-status-style fg=brightblue,bg=default #base0 and default
#set-window-option -g window-status-style dim

# active window title colors
set-window-option -g window-status-current-style fg=brightred,bg=default #orange and default
#set-window-option -g window-status-current-style bright

# pane border
set-option -g pane-border-style fg=black #base02
set-option -g pane-active-border-style fg=brightgreen #base01

# message text
set-option -g message-style fg=brightred,bg=black #orange and base01

# pane number display
set-option -g display-panes-active-colour brightred #orange
set-option -g display-panes-colour blue #blue

# clock
set-window-option -g clock-mode-colour green #green

# bell
set-window-option -g window-status-bell-style fg=black,bg=red #base02, red

#### COLOUR (Solarized dark)
