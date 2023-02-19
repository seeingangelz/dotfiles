# Set the path of Oh-My-Zsh installation directory
export ZSH="$HOME/.config/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="lambda"

# Set the auto update mode and frequency for Oh-My-Zsh
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# Enable autocorrection of mistyped commands
ENABLE_CORRECTION="true"

# Set the path to the custom directory for Zsh configuration
ZSH_CUSTOM=~/.config/zsh

# Set the plugins to be used in the terminal
plugins=(git sudo)

# Load the Oh-My-Zsh shell script
source $ZSH/oh-my-zsh.sh

# Set the display to use X11 protocol
export DISPLAY=:0

# Set the path of the history file for Zsh
export HISTFILE=~/.cache/.zsh_history

# Set the maximum size of the history file
export HISTSIZE=10000

# Set the maximum number of commands to be saved in the history file
export SAVEHIST=10000

# Set the list of commands to be ignored in the history
export HISTORY_IGNORE="(ls|ls -a|cd|clear|pwd|exit|cd -|cd ..)"

# Enable ignoring duplicate commands in the history
setopt HIST_IGNORE_ALL_DUPS

# Enable finding and skipping duplicate commands in the history
setopt HIST_FIND_NO_DUPS

# Load plugins
source $HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-autopair/autopair.plugin.zsh

# Bind the forward and backward word keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Define some commonly used aliases
alias ls="ls --group-directories-first"
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -iv'
alias rmrf='rm -rfiv'
alias c="clear"
alias syu="sudo pacman -Syu && pkill -RTMIN+8 dwmblocks"
alias s="sudo pacman -S"
alias ss="pacman -Ss"
alias r="sudo pacman -Rsn"
alias ys="yay -S"
alias yss="yay -Ss"
alias zshrc="nvim ~/.config/zsh/.zshrc"
alias vim="nvim"
alias ed="cd $HOME/.config/suckless/dwm && ls"
alias es="cd $HOME/.config/suckless/st && ls"
alias em="cd $HOME/.config/suckless/dmenu && ls"
alias yt-best="yt-dlp --extract-audio --audio-format best "
alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytb-best="yt-dlp -f bestvideo+bestaudio "

# Define a function to upload files
upload() { curl -F"file=@$1" https://envs.sh ; }

# Display system info
neofetch
