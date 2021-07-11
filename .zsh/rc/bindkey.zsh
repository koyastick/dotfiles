# bindkey -v
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="bck-i-search > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^R' select-history