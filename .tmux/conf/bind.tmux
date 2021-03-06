# prefixを変更
unbind-key C-b
set -g prefix C-t

# pane操作のキーバインドを変更
bind y setw synchronize-panes
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
bind | split-window -h
bind - split-window -v

# コピーモードでのキーバインドを変更
setw -g mode-keys vi
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi V send -X select-line
bind -T copy-mode-vi C-v send -X rectangle-toggle
bind -T copy-mode-vi y send -X copy-selection
bind -T copy-mode-vi Y send -X copy-line
bind-key C-p paste-buffer
bind-key -n C-S-Left swap-window -t -1
bind-key -n C-S-Right swap-window -t +1