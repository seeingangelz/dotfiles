export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

ENABLE_CORRECTION="true"

ZSH_CUSTOM=~/Documents/dotfiles/.config/zsh

plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

export DISPLAY=:0

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

source $HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls="ls --group-directories-first"
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -iv'
alias rmrf='rm -rfiv'
alias c="clear"
alias syu="sudo pacman -Syu"
alias s="sudo pacman -S"
alias ss="pacman -Ss"
alias r="sudo pacman -Rsn"
alias ys="yay -S"
alias yss="yay -Ss"
alias zshrc="nvim ~/.zshrc"
alias vim="nvim"
alias ed="cd $HOME/.config/suckless/dwm && ls"
alias es="cd $HOME/.config/suckless/st && ls"
alias em="cd $HOME/.config/suckless/dmenu && ls"
alias yt-best="yt-dlp --extract-audio --audio-format best "
alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytb-best="yt-dlp -f bestvideo+bestaudio "
upload() { curl -F"file=@$1" https://envs.sh ; }

neofetch
