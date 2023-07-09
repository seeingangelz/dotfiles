#!/bin/sh

xmenu <<EOF | sh &
Change Wallpaper	wg
Color Picker	colorpicker
Sniper Text	sleep 1; snipertext
Screenshot
	Select Area	sleep 1; screenshot
	Fullscreen	sleep 1; flameshot full

Web Browser
	Firefox	firefox
	qutebrowser	qutebrowser
File Manager
	PCManFM	pcmanfm
	Ranger	xdotool key --clearmodifiers "Super_L+F1"
Games
	Steam	steam
	Lutris	lutris
Terminal
	st	st
	Kitty	kitty 
	Alacritty	alacritty
Text Editor
	Neovim	st -e nvim 
	Emacs	emacs
Office
	LibreOffice
		Writer	libreoffice --writer
		Calc	libreoffice --calc
		Impress	libreoffice --impress
		Draw	libreoffice --draw
		Math	libreoffice --math
		Base	libreoffice --base

Edit config
	Suckless
		DWM	st -e nvim $HOME/.config/suckless/dwm/config.def.h
		ST	st -e nvim $HOME/.config/suckless/st/config.def.h
		DMENU	st -e nvim $HOME/.config/suckless/dmenu/config.def.h
		DWMBLOCKS	st -e nvim $HOME/.config/suckless/dwmblocks-async/config.c
	Terminal
		Alacritty	st -e nvim $HOME/.config/alacritty/alacritty.yml
		Kitty	st -e nvim $HOME/.config/kitty/kitty.conf
		st	st -e nvim $HOME/.config/suckless/st/config.def.h
	Text Editor
		Neovim
			init.lua	st -e nvim $HOME/.config/nvim/init.lua
			options	st -e nvim $HOME/.config/nvim/lua/aeon/options.lua	
			keymaps	st -e nvim $HOME/.config/nvim/lua/aeon/keymaps.lua
			plugins	st -e nvim $HOME/.config/nvim/lua/aeon/plugins.lua
		Emacs	st -e nvim $HOME/.config/emacs/init.el
	Other
		Cava	st -e nvim $HOME/.config/cava/config
		Cmus	st -e nvim $HOME/.config/cmus/autosave
		Dunst	st -e nvim $HOME/.config/dunst/dunstrc
		Flameshot	st -e nvim $HOME/.config/flameshot/flameshot.ini
		mpv
			input.conf	st -e nvim $HOME/.config/mpv/input.conf
			mpv.conf	st -e nvim $HOME/.config/mpv/mpv.conf
		Neofetch	st -e nvim $HOME/.config/neofetch/config.conf
		Picom	st -e nvim $HOME/.config/picom/picom.conf
		Ranger
			rc.conf	st -e nvim $HOME/.config/ranger/rc.conf
			rifle.conf	st -e nvim $HOME/.config/ranger/rifle.conf
			scope.sh	st -e nvim $HOME/.config/ranger/scope.sh
		Redshift	st -e nvim $HOME/.config/redshift/redshift.conf
		sxiv	st -e nvim $HOME/.config/sxiv/exec/key-handler
		xmenu	st -e nvim $HOME/.config/xmenu/xmenu.sh
		Zathura	st -e nvim $HOME/.config/zathura/zathurarc
		Zsh
			zprofile	st -e nvim $HOME/.config/zsh/.zprofile
			zshrc	st -e nvim $HOME/.config/zsh/.zshrc
Resolution
	1280x800	xrandr -s 1280x800
	3840x2400	xrandr -s 3840x2400
	3840x2400	xrandr -s 3840x2160
	2880x1800	xrandr -s 2880x1800
	2560x1440	xrandr -s 2560x1600
	2560x1440	xrandr -s 2560x1440
	1920x1440	xrandr -s 1920x1440
	1856x1392	xrandr -s 1856x1392
	1792x1344	xrandr -s 1792x1344
	1920x1200	xrandr -s 1920x1200
	1920x1080	xrandr -s 1920x1080
	1600x1200	xrandr -s 1600x1200
	1680x1050	xrandr -s 1680x1050
	1400x1050	xrandr -s 1400x1050
	1280x1024	xrandr -s 1280x1024
	1440x900	xrandr -s 1440x900
	1280x960	xrandr -s 1280x960
	1360x768	xrandr -s 1360x768
	1152x864	xrandr -s 1152x864
	1280x768	xrandr -s 1280x768
	1280x720	xrandr -s 1280x720
	1024x768	xrandr -s 1024x768
	800x600	xrandr -s 800x600
	640x480	xrandr -s 640x480

Restart DWM	pkill dwm
Lock				slock
Shutdown		poweroff
Reboot			reboot
EOF
