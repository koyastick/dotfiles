# lang config
export LANG=ja_JP.UTF-8

# histry
HISTSIZE=1000000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history

# auto load
autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-.,;:|/{}=@"
zstyle ':zle:*' word-style unspecified
