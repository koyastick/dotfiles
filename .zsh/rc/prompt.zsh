# # prompt
# PROMPT_PREF=$'(%{\e[38;5;242m%}%n@%m %{\e[0m%}%~)'
# PROMPT_SUF=$'\n%B%(?.%F{cyan}.%F{red})\$ %f%b'
# PROMPT="$PROMPT_PREF$PROMPT_SUF"
# RPROMPT=$'%{\e[38;5;242m%}%D %T %(?..%F{red})(%(?.\'-\' .;_; ))%{\e[0m%}%f'

# # vcs_info
# autoload -Uz vcs_info
# autoload -Uz add-zsh-hook
# setopt prompt_subst

# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "+"
# zstyle ':vcs_info:git:*' unstagedstr '*'
# zstyle ':vcs_info:*' formats $'%{\e[38;5;242m%} at %F{white}%b%c%u %{\e[0m%}'
# zstyle ':vcs_info:*' actionformats $'%{\e[38;5;242m%} at %F{red}%b%c%u(%a) %{\e[0m%}'

# function _update_vcs_info_msg() {
#     LANG=en_US.UTF-8 vcs_info
#     PROMPT="$PROMPT_PREF${vcs_info_msg_0_}$PROMPT_SUF"
# }

# add-zsh-hook precmd _update_vcs_info_msg
# precmd() { vcs_info }
