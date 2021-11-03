# tmux起動時のシェルをzshにする
set-option -g default-shell /bin/zsh

# pane選択時間を延長
set-option -g display-panes-time 10000
set -sg escape-time 0

# スクロールでシェルの出力履歴を参照可能にする
set-option -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"

# window name を ssh 先の host name にする
setw -g allow-rename on
set-option -g set-titles on
set-option -g set-titles-string "#T #{session_alerts}"

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
