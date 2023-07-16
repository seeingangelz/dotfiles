#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    clear
    echo "This script MUST NOT be run as root."
    echo "Exiting..."
    sleep 3 && exit 1
fi

path=$(pwd)
user=$(whoami)

clear
echo ""
echo ""
echo " █████╗ ███████╗ ██████╗ ███╗   ██╗  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗" 
echo "██╔══██╗██╔════╝██╔═══██╗████╗  ██║  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
echo "███████║█████╗  ██║   ██║██╔██╗ ██║  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
echo "██╔══██║██╔══╝  ██║   ██║██║╚██╗██║  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
echo "██║  ██║███████╗╚██████╔╝██║ ╚████║  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
echo "╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
echo "                              https://github.com/seeingangelz"
echo ""
echo "Installing programs..."
echo "Already have yay installed? (y/n)"
read answer
sleep 1 && clear

case $answer in
  [Yy]*)
    echo "Installing programs..."
    yay -S cava devour exa tty-clock-git picom-simpleanims-next-git cmatrix-git pipes.sh npm checkupdates+aur xdotool xautolock betterlockscreen yad libnotify wal-telegram-git python-pywalfox xsettingsd themix-gui-git themix-theme-oomox-git archdroid-icon-theme tesseract-data-eng tesseract-data-por slop arandr clipmenu zsh cmus mpd mpc ncmpcpp playerctl dbus simple-mtpfs dunst emacs feh ffmpeg ffmpegthumbnailer firefox flameshot fzf git gnu-free-fonts go gd btop imagemagick mpv neofetch neovim noto-fonts noto-fonts-cjk noto-fonts-emoji numlockx obs-studio openssh perl pulseaudio pulsemixer udiskie python-pip python-pywal qalculate-gtk xdg-user-dirs qutebrowser ranger syncthing sxiv telegram-desktop tree ttf-jetbrains-mono-nerd ttf-font-awesome gpick ueberzugpp redshift p7zip unzip epub-thumbnailer-git python-pdftotext poppler vim webkit2gtk xclip yt-dlp zathura zathura-pdf-mupdf zip xorg-server xorg-xinit libx11 libxinerama libxft base base-devel --noconfirm
    sudo pywalfox install
    sleep 1 && clear
    ;;
  [Nn]*)
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si 
    sleep 1 && clear

    echo "Installing programs..."
    yay -S cava devour exa tty-clock-git picom-simpleanims-next-git cmatrix-git pipes.sh npm checkupdates+aur xdotool xautolock betterlockscreen yad libnotify wal-telegram-git python-pywalfox xsettingsd themix-gui-git themix-theme-oomox-git archdroid-icon-theme tesseract-data-eng tesseract-data-por slop arandr clipmenu zsh cmus mpd mpc ncmpcpp playerctl dbus simple-mtpfs dunst emacs feh ffmpeg ffmpegthumbnailer firefox flameshot fzf git gnu-free-fonts go gd btop imagemagick mpv neofetch neovim noto-fonts noto-fonts-cjk noto-fonts-emoji numlockx obs-studio openssh perl pulseaudio pulsemixer udiskie python-pip python-pywal qalculate-gtk xdg-user-dirs qutebrowser ranger syncthing sxiv telegram-desktop tree ttf-jetbrains-mono-nerd ttf-font-awesome gpick ueberzugpp redshift p7zip unzip epub-thumbnailer-git python-pdftotext poppler vim webkit2gtk xclip yt-dlp zathura zathura-pdf-mupdf zip xorg-server xorg-xinit libx11 libxinerama libxft base base-devel --noconfirm
    sudo pywalfox install
    sleep 1 && clear
    ;;
  *)
    echo "Invalid answer, skipping..."
    sleep 1 && clear
    ;;
esac

if [ -d "/sys/class/power_supply" ] && [ "$(ls -A /sys/class/power_supply)" ]; then
  echo "Is this installation on a laptop? (y/n)"
  read answer
  sleep 1 && clear

  case $answer in
    [Yy]*)
      echo "Installing dependencies..."
      yay -S acpi acpilight
      sudo chown $USER /sys/class/backlight/intel_backlight/brightness
      sleep 1 && clear
      echo "Want to enable touchpad tap-to-click? (y/n)"
      read answer
      sleep 1 && clear

      case $answer in 
        [Yy]*)
          echo "Enabling tap-to-click..."
          sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
EOF
          sleep 1 && clear
          ;;

        [Nn]*)
          echo "Skipping..."
          sleep 1 && clear
          ;;

        *)
          echo "Invalid answer, skipping..."
          sleep 1 && clear
          ;;
      esac
      ;;

    [Nn]*)
      echo "Skipping..."
      sleep 1 && clear
      ;;
    *)
      echo "Invalid answer, skipping..."
      sleep 1 && clear
      ;;
  esac
fi

echo "Already have Oh-My-Zsh installed? (y/n)"
read answer
sleep 1 && clear

case $answer in
  [Yy]*)
    if [ -L $HOME/.config/zsh ]; then
    rm $HOME/.config/zsh
    fi
    ln -sfv $path/.config/zsh $HOME/.config/zsh 

    if [ -L $HOME/.zshrc ]; then
    rm $HOME/.zshrc
    fi
    sleep 1 && clear
    ;;
  [Nn]*)
    echo "Installing..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    if [ -L $HOME/.config/zsh ]; then
    rm $HOME/.config/zsh
    mv $path/.config/zsh/.zshrc.pre-oh-my-zsh $path/.config/zsh/.zshrc
    fi
    ln -sfv $path/.config/zsh $HOME/.config/zsh 

    if [ -f $HOME/.zshrc ]; then
    rm $HOME/.zshrc
    fi
    sleep 1 && clear
    ;;
  *)
    echo "Invalid answer, skipping..."
    sleep 1 && clear
    ;;
esac

echo "Organizing dotfiles..."
echo ""

files=".Xresources .xinitrc .zshenv"
directories=".config .local .local/bin"
configs="cava redshift dunst btop xsettingsd xmenu flameshot kitty alacritty mpv neofetch sxiv wal picom ranger zathura qutebrowser cmus mpd ncmpcpp user-dirs.dirs suckless nvim emacs"
bkp_dir="$HOME/.bkp_config"

if [ ! -d "$bkp_dir" ]; then
    mkdir "$bkp_dir"
fi

for file in $files; do
    if [ -f "$HOME/$file" ]; then
        mv "$HOME/$file" "$bkp_dir"
    fi
    ln -sf "$path/$file" "$HOME/$file"
done

for directory in $directories; do
    [ ! -d "$HOME/$directory" ] && mkdir "$HOME/$directory"
done

for config in $configs; do
    if [ -d "$HOME/.config/$config" ]; then
        mv "$HOME/.config/$config" "$bkp_dir"
    fi
    ln -sf "$path/.config/$config" "$HOME/.config/$config"
done

if [ -d "$HOME/.oh-my-zsh" ]; then
  mv "$HOME/.oh-my-zsh" "$HOME/.config/"
fi

ln -sf "$HOME/.cache/wal/dunstrc" "$HOME/.config/dunst/dunstrc"
ln -sf "$HOME/.cache/wal/flameshot.ini" "$HOME/.config/flameshot/flameshot.ini"
ln -sf "$HOME/.cache/wal/config" "$HOME/.config/cava/config"
ln -sf "$HOME/.cache/wal/zathurarc" "$HOME/.config/zathura/zathurarc"
ln -sf "$HOME/.cache/wal/colors-kitty.conf" "$HOME/.config/kitty/colors-kitty.conf"
ln -sf "$HOME/.cache/wal/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

ln -sf "$path/.local/bin/statusbar" "$HOME/.local/bin"
ln -sf "$path/.local/bin/"* "$HOME/.local/bin"
ln -sf "$path/.config/xmenu/xmenu.sh" "$HOME/.local/bin/menu"

sleep 1 && clear

echo "Preparing folders..."
	sleep 1 && clear
if [ ! -e $HOME/.config/user-dirs.dirs ]; then
	xdg-user-dirs-update
	echo "Creating xdg-user-dirs..."
	sleep 1 && clear
else
	xdg-user-dirs-update
	echo "user-dirs.dirs already exists!"
	sleep 1 && clear
fi
sleep 1 && clear

echo "Do you want to download Aeon Wallpapers? (y/n)"
read answer
sleep 1 && clear

case $answer in
  [Yy]*)
    repo_url="https://github.com/seeingangelz/wallpapers.git"
    parent_dir="$HOME/Pictures"
    destination_dir="$parent_dir/wallpapers"

    if [ -d "$destination_dir" ]; then
        echo "The directory $destination_dir already exists. Wallpapers will not be downloaded again."
    else
        echo "Downloading wallpapers from the repository..."
        git clone "$repo_url" "$destination_dir"
        echo "Wallpapers downloaded successfully to $destination_dir"
    fi
    sleep 2 && clear
    ;;
  [Nn]*)
    echo "Skipping..."
    sleep 1 && clear
    ;;
  *)
    echo "Invalid answer, skipping..."
    sleep 1 && clear
    ;;
esac

if pgrep -x "Xorg" >/dev/null; then
  echo "Do you want to harden your Firefox? (y/n)"
  read answer
  sleep 1 && clear

  case $answer in
    [Yy]*)
      echo "Hardening Firefox..."

      if ! command -v wget >/dev/null; then
        echo "wget is not installed. Installing..."
        yay -S wget --noconfirm
        sleep 1 && clear
      fi

      if pgrep firefox >/dev/null; then
        pkill firefox
      fi

      for profile_dir in "$HOME/.mozilla/firefox/"*.default-release/; do
        if [ -f "$profile_dir/user.js" ]; then
          rm "$profile_dir/user.js"
        fi

        if [ -f "$profile_dir/search.json.mozlz4" ]; then
          rm "$profile_dir/search.json.mozlz4"
        fi
      done

      for file in "$path/.config/firefox/"*; do
        cp -r "$file" "$profile_dir"
      done

      ublock_version="1.50.0"
      wget -O "/tmp/uBlock0_$ublock_version.firefox.signed.xpi" "https://github.com/gorhill/uBlock/releases/download/$ublock_version/uBlock0_$ublock_version.firefox.signed.xpi"
      setsid -f firefox "/tmp/uBlock0_$ublock_version.firefox.signed.xpi"

      sleep 1 && clear
      ;;
    [Nn]*)
      echo "Skipping..."
      sleep 1 && clear
      ;;
    *)
      echo "Invalid answer, skipping..."
      sleep 1 && clear
      ;;
  esac
fi

echo "Installing suckless programs..."
suckless=("dwm" "st" "dmenu" "dwmblocks-async")
for program in "${suckless[@]}"; do
  cd "$path/.config/suckless/$program" && sudo make clean install
done
cd "$path/.config/xmenu" && sudo make install
sleep 1 && clear

echo "Running pywal..."
wallpaper_dir="$HOME/Pictures/wallpapers"
if [ -d "$wallpaper_dir" ]; then
  wallpaper=$(ls "$wallpaper_dir" | shuf -n 1)
  wallpaper_path="$wallpaper_dir/$wallpaper"
  wal -i "$wallpaper_path" &> /dev/null
  sed -i ~/.Xresources -re '1,1000d'
  cat ~/.cache/wal/colors.Xresources >> ~/.Xresources

  if [ -n "$(pgrep Xorg)" ]; then
    killall dwm &
    dwmblocks &
    pkill picom && picom & > /dev/null
    oomox-cli /opt/oomox/scripted_colors/xresources/xresources-reverse > /dev/null
    betterlockscreen -u "$wallpaper_path" > /dev/null 2>&1
    wal-telegram -t
    pywalfox update
    killall dunst && dunst &
    sleep 1 && clear
    notify-send "Rice updated!"
  fi
fi

chmod +x $path/.local/bin
sleep 1 && clear

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  echo "Changing default shell..."
  chsh -s /usr/bin/zsh
fi
sleep 1 && clear

echo "All done!"
echo "Please log out and log back in for the changes to take effect."
