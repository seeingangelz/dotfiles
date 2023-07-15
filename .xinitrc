# Set variables for the locations of the system and user Xresources and Xmodmap files
sysresources=/etc/X11/xinit/Xresources
userresources=$HOME/.Xresources

# Set the wallpaper using wal
wal -R &

# Start the compositor (picom) with experimental backends enabled
picom &

# Start dunst
dunst &

# Start dwmblocks
dwmblocks &

# Start clipmenud
clipmenud &

# Enable numlock
numlockx on &

# Start udiskie
udiskie &

# Start xsettingsd
xsettingsd &

# Set the keyboard layout to brazilian portuguese
setxkbmap br &

# Start xautolock
alwayslock &

# Check updates
updnotify &

# Check if sysresources and sysmodmap exist
if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

# Check if userresources exist
if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

# Run ssh-agent and dwm in an infinite loop
 while :; do
  ssh-agent dwm 
 done

# Execute wm
exec dbus-launch --sh-syntax --exit-with-session dwm
#exec dbus-launch --sh-syntax --exit-with-session awesome
