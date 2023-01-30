export PATH="$HOME/.local/bin:$PATH"
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
