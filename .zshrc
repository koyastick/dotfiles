###################################
# plugins
###################################
source $HOME/.zplug/init.zsh
zplug "yous/vanilli.sh"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "b4b4r07/enhancd", use:init.sh
# zplug "junegunn/fzf", from:gh-r, as:command, rename-to:fzf
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug 'dracula/zsh', as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

###################################
# theme dracula/zsh
###################################
DRACULA_DISPLAY_TIME=1
DRACULA_DISPLAY_CONTEXT=1
DRACULA_GIT_NOLOCK=0

###################################
# zsh-autosuggestions
###################################
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=038,underline'
bindkey "^O" forward-word

###################################
# history-substring-search
###################################
if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=fg=black,bg=blue

###################################
# zsh-syntax-highlighting
###################################
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

###################################
# fzf
###################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
bindkey "ç" fzf-cd-widget

###################################
# basic configurations
###################################
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
## alias
case ${OSTYPE} in
    darwin*)
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        alias ls='ls -F --color=auto'
        ;;
esac
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias gb='git checkout $(git for-each-ref --format="%(authorname) %09 %(refname:short)" --sort=authorname | sed "/origin/d" | fzf | awk "{print \$NF}")'
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
setopt print_eight_bit
setopt interactive_comments
setopt extended_glob
setopt no_beep
setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups
## lang config
export LANG=ja_JP.UTF-8
## histry
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt share_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz select-word-style
select-word-style default
export WORDCHARS="*?_-.[]~&;=!#$%^(){}<>|\""
zstyle ':zle:*' word-chars "*?_-.[]~&;=!#$%^(){}<>|\""
zstyle ':zle:*' word-style unspecified
