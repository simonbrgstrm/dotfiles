HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export PATH="${PATH}:${HOME}/.local/bin/"

ZSHCOL="sbm"
/home/sbm/scripts/theme.sh "$ZSHCOL"
eval "$(starship init zsh)"


alias ls="ls --color=auto"
alias l='ls -l'
alias ll='ls -lah'
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias psg="ps aux | grep "

