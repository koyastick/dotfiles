source "$HOME/.zsh/rc/etc.zsh"
source "$HOME/.zsh/rc/alias.zsh"
source "$HOME/.zsh/rc/prompt.zsh"
source "$HOME/.zsh/rc/bindkey.zsh"
source "$HOME/.zsh/rc/plugin.zsh"
source "$HOME/.zsh/rc/option.zsh"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey "ç" fzf-cd-widget
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git'"
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude '.git'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude '.git'"
export FZF_DEFAULT_OPTS='
--height 50%
--reverse
--border
--color dark,hl:51,hl+:51,fg:249,bg+:238,fg+:254
--color info:30,prompt:123,spinner:50,pointer:37,marker:red
'
export FZF_CTRL_T_OPTS='
--preview "bat --style=numbers --color=always --line-range :500 {}"
'

export ENHANCD_FILTER='fzf-tmux -r 50%'
# export FZF_TMUX_OPTS='
# -r 50%
# '
