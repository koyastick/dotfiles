# Install zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source $HOME/.zplug/init.zsh

zplug "yous/vanilli.sh"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "b4b4r07/enhancd", use:init.sh
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "zsh-users/zsh-syntax-highlighting", defer:2
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
## Then, source plugins and add commands to $PATH
zplug load

## Setup history-substring-search
## Better history searching with arrow keys
if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bg=cyan,fg=white,bold

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white