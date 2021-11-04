# lang config
export LANG=ja_JP.UTF-8

# histry
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt share_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# auto load
autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-.,;:|/{}=@"
zstyle ':zle:*' word-style unspecified
