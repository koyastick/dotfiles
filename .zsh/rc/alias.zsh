# alias
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
alias g++='g++-10'
alias gb='git checkout $(git for-each-ref --format="%(authorname) %09 %(refname:short)" --sort=authorname | sed "/origin/d" | fzf | awk "{print \$NF}")'
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"