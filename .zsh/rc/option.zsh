setopt print_eight_bit
setopt interactive_comments
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_glob

export FZF_DEFAULT_OPTS='
--height 50% 
--reverse
--border
--color dark,hl:51,hl+:51,fg:249,bg+:238,fg+:254
--color info:30,prompt:123,spinner:30,pointer:37,marker:235
'