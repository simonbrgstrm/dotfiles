# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    docker
    vagrant
    sudo
    z
    #zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

eval "$(navi widget zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export PATH="${PATH}:${HOME}/.local/bin/"

# Golang path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
dot=~/dotfiles

alias zshconfig="vi ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias s="systemctl"
alias j="journalctl -xe"
alias update="sudo apt update && sudo apt upgrade -y"
alias matrix="cmatrix -C yellow"
alias cheat="cht.sh"
alias psg="ps aux | grep " 
alias 3screens="$dot/.screenlayout/3screens.sh"
alias mirrorscreen="$dot/.screenlayout/mirrorscreen.sh"
alias 2screens="$dot/.screenlayout/2screens1hor1ver.sh"
alias 4screens="$dot/.screenlayout/4screens.sh"
alias theme="$dot/scripts/theme.sh -i"
alias theme1="$dot/scripts/theme.sh desert"
alias theme2="$dot/scripts/theme.sh gruvbox-dark"
alias theme3="$dot/scripts/theme.sh sbm"
alias a2dp="pactl set-card-profile bluez_card.28_11_A5_DE_81_A4 a2dp_sink"

alias blaapiprod="~/bjornlunden/scripts/testarblaapi.sh"

# Preset theme
$dot/scripts/theme.sh sbm 

#source ~/dotfiles/scripts/.env
#$dot/scripts/theme.sh $ZSHCOL

# Theme changer
alias blue="$dot/scripts/blue.sh"
alias orange="$dot/scripts/orange.sh"

# Creates dir and cd into it
cdm() {mkdir $1 && cd $1}

# ugrep
alias uq='ug -Q'
alias ux='ug -UX'
alias uz='ug -z'
alias grep='ugrep -G'
alias egrep='ugrep -E'
alias fgrep='ugrep -F'
alias pgrep='ugrep -P'
alias xgrep='ugrep -UX'
alias zgrep='ugrep -zG'
alias zegrep='ugrep -zE'
alias zfgrep='ugrep -zF'
alias zpgrep='ugrep -zP'
alias zxgrep='ugrep -zUX'
alias xdump='ugrep -X ""'

#Java version
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sbm/.sdkman"
[[ -s "/home/sbm/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sbm/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -e /home/sbm/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sbm/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
