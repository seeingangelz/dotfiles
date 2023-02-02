# Set variables for the locations of the system and user Xresources and Xmodmap files
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# Set the wallpaper using wal
wal -R &

# Start the compositor (picom) with experimental backends enabled
picom --experimental-backends &

# Start dunst
dunst &

# Enable numlock
numlockx on &

# Set the keyboard layout to Brazilian Portuguese
setxkbmap br &

# Check if sysresources and sysmodmap exist
if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

# Check if userresources and usermodmap exist
if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# Run ssh-agent and dwm in an infinite loop
 while :; do
  ssh-agent dwm
 done

# Execute dwm
exec dbus-launch --sh-syntax --exit-with-session dwm
