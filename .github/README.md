<h3 align="center">
	<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/123886904/246940666-f8141f35-8955-4637-8ca8-3d1be6bad44b.gif" width="175" alt="Logo"/><br/>
	<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/123886904/246907525-4ad936bf-5f8e-4801-8292-7a28f5252e10.gif" width="300px"/>
</h3>

<div align=center>
  
![](https://img.shields.io/github/stars/seeingangelz/dotfiles?color=48D8FC&logo=apachespark&logoColor=D9E0EE&style=for-the-badge&labelColor=191c27)
![](https://img.shields.io/github/last-commit/seeingangelz/dotfiles?&logo=github&style=for-the-badge&color=48D8FC&logoColor=D9E0EE&labelColor=191c27)
![](https://img.shields.io/github/repo-size/seeingangelz/dotfiles?color=48D8FC&logo=hackthebox&logoColor=D9E0EE&style=for-the-badge&labelColor=191c27)

</div>

<img align="right" src="https://user-images.githubusercontent.com/123886904/252125154-ecf02580-1666-487d-ae65-046b6e053dd1.png" alt="Rice Preview" width="363px"/>

```go
❄️                  Setup / DWM                   ❄️
---------------------------------------------------
╭─ Distro          -> Arch Linux
├─ Editor          -> NeoVim / Emacs
├─ Browser         -> Firefox / qutebrowser
├─ Shell           -> zsh
╰─ Process Viewer  -> btop
 
╭─ Music Player    -> cmus
├─ Compositor      -> picom
├─ Notifications   -> dunst
├─ Media Player    -> mpv
╰─ File Manager    -> ranger
 
╭─ WM              -> dwm
├─ Terminal        -> st
├─ App Laucher     -> dmenu
├─ Theme           -> pywal
╰─ Font            -> JetBrainsMono NF
```
<p align="center">
  <img src="https://user-images.githubusercontent.com/123886904/252125320-1f750941-6e7f-429a-9940-8995f70a2860.gif" width="500px" alt="DWM Rice"/>
</p>
<br>

> **Warning**
>
> This is my private Arch Linux configuration. It is recommended to use it only for inspiration, as there is no guarantee that it will work for you.
> 
> I am no Arch expert. I'm just a Arch user.
>
<br>

<div align=center>
  
```ocaml
❄️ Installation 魅
```
</div>

<details>
<summary><b>Manual</b></summary>
<br>

> Assuming your **AUR Helper** is [yay](https://github.com/Jguer/yay).

```sh
yay -S cava devour exa tty-clock-git picom-simpleanims-next-git cmatrix-git pipes.sh npm checkupdates+aur xdotool xautolock betterlockscreen yad libnotify wal-telegram-git python-pywalfox xsettingsd themix-gui-git themix-theme-oomox-git archdroid-icon-theme tesseract-data-eng tesseract-data-por slop arandr clipmenu zsh cmus mpd mpc ncmpcpp playerctl dbus simple-mtpfs dunst emacs feh ffmpeg ffmpegthumbnailer firefox flameshot fzf git gnu-free-fonts go gd btop imagemagick mpv neofetch neovim noto-fonts noto-fonts-cjk noto-fonts-emoji numlockx obs-studio openssh perl pulseaudio pulsemixer udiskie python-pip python-pywal qalculate-gtk xdg-user-dirs qutebrowser ranger syncthing sxiv telegram-desktop tree ttf-jetbrains-mono-nerd ttf-font-awesome gpick ueberzugpp redshift p7zip unzip epub-thumbnailer-git python-pdftotext poppler vim webkit2gtk xclip yt-dlp zathura zathura-pdf-mupdf zip xorg-server xorg-xinit libx11 libxinerama libxft base base-devel
```
```sh
git clone https://github.com/seeingangelz/dotfiles.git
```

> Create [symbolic links](https://www.freecodecamp.org/news/linux-ln-how-to-create-a-symbolic-link-in-linux-example-bash-command/) to the files/directories you need.

</details>

<details>
<summary><b>Automatic</b></summary>
<br>

> Install [curl](https://curl.se/)

```sh
curl -sSL https://raw.githubusercontent.com/seeingangelz/dotfiles/master/.github/dots_bootstrap.sh | bash -s && cd ~/Documents/dotfiles/ && ./install.sh
```

</details>
<br>

<div align=center>
  
```ocaml
❄️ Suckless Build お
```
<br>
</div>

<details>
<summary><b>DWM Patches 火</b></summary>
<br>  
<table>
  <tr>
    <td>
      <a href="https://dwm.suckless.org/patches/xresources/">
        <p title="Allows to handle settings from Xresources."><kbd>xresources</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/vanitygaps/">
        <p title="Adds gaps between client windows.
		Add cfacts patch.
		Adds layouts: spiral, dwindle, bstack, bstackhoriz
		nrowgrid, horizgrid, gaplessgrid, centeredmaster
      		centeredfloatingmaster, grid, deck"><kbd>vanitygapscombo</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/alpha/">
        <p title="Allow dwm to have translucent bars, while keeping all the text on it opaque."><kbd>alpha</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/preserveonrestart/">
        <p title="Preserves clients on old tags."><kbd>preserveonrestart</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/movestack/">
        <p title="Allows you to move clients around in the stack and swap them with the master."><kbd>movestack</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/bar_height/">
        <p title="This patch allows user to change dwm's default bar height."><kbd>barheight</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/togglefloatingcenter/">
        <p title="This patch will allows you to toggle floating window client will be centered position."><kbd>togglefloatingcenter</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://dwm.suckless.org/patches/statuscmd/">
        <p title="This patch adds the ability to signal a status monitor."><kbd>statuscmd</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/statusallmons/">
        <p title="Draws and updates the statusbar on all monitors."><kbd>statusallmons</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/swallow/">
        <p title='Adds "window swallowing" to dwm.'><kbd>swallow</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/alttagsdecoration/">
        <p title="Provides the ability to use an alternative text for tags which contain at least one window."><kbd>alttagsdecoration</kbd></p>
      </a>
    </td>
     <td>
      <a href="https://dwm.suckless.org/patches/save_floats/">
        <p title="This patch saves size and position of every floating window before it is forced into tiled mode."><kbd>savefloats</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/resizecorners/">
        <p title="The mouse is warped to the nearest corner and you resize it from there."><kbd>resizecorners</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/focusonnetactive/">
        <p title="Patch to activate window instead of urgency."><kbd>focusonnetactive</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://dwm.suckless.org/patches/winicon/">
        <p title="A patch that enables dwm to show window icons."><kbd>winicon</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/awesomebar/">
        <p title="This patch changes the taskbar to be more like awesome."><kbd>awesomebar
	</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/noborder/">
        <p title="Remove the border when there is only one window visible."><kbd>noborder</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/centeredwindowname/">
        <p title="Center the WM_NAME of the currently selected window on the status bar."> <kbd>centeredwindowname</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/exitmenu/">
        <p title="Simple exit menu for dwm."><kbd>exitmenu</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/windowmap/">
        <p title="This patch makes the windows get mapped or unmapped in Xorg. Fixing black screen when switch back to a fullscreen service."><kbd>windowmap</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/underlinetags/">
        <p title="Underlines selected tags."><kbd>underlinetags</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://dwm.suckless.org/patches/statusbutton/">
        <p title="Adds a clickable button to the left hand side of the statusbar."><kbd>statusbutton</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/scratchpads/">
        <p title="Enables multiple scratchpads."><kbd>scratchpads</kbd></p>
      </a>
    </td>
     <td>
      <a href="https://dwm.suckless.org/patches/pertag/">
        <p title="Keeps layout, mwfact, barpos and nmaster per tag."><kbd>pertag</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/attachdirection/">
        <p title="Attachdirection is a merge of:
		attachabove
		attachaside
		attachbelow
		attachbottom
		attachtop."><kbd>attachdirection</kbd></p>
      </a>
    </td>
        <td>
      <a href="https://github.com/bakkeby/patches/blob/master/dwm/dwm-placemouse-6.2.diff">
        <p title="This patch allows you to move windows with the mouse without switching to floating mode."><kbd>placemouse</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/moveresize/">
        <p title="This patch allows you to move and resize dwm's clients using keyboard bindings."><kbd>moveresize</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/dynamicscratchpads/">
        <p title="This patch allows for the management of scratchpad windows dynamically."><kbd>dynamicscratchpads</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://dwm.suckless.org/patches/floatrules/">
        <p title="Adds 5 extra variables to the 'rules' array in config.def.h."><kbd>floatrules</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/barpadding/">
        <p title="Adds variables for verticle and horizontal space between the statusbar."><kbd>barpadding</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/sticky/">
        <p title="A sticky client is visible on all tags."><kbd>sticky</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/stickyindicator/">
        <p title="Adds indicator in their bar to show when a window is sticky."><kbd>stickyindicator</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://github.com/bakkeby/patches/blob/master/dwm/dwm-dragfact-6.3.diff">
        <p title="Allows resizing of windows with the mouse."><kbd>dragfact</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/tag-previews/">
        <p title="Allows you to see the contents of an already viewed tag."><kbd>tagpreview</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://dwm.suckless.org/patches/layoutmenu/">
        <p title="Adds a context menu for layout switching."><kbd>layoutmenu</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/bakkeby/patches/blob/master/dwm/dwm-riodraw-nopidmatching-6.3_full.diff">
        <p title="Adding rio-like draw-to-resize windows."><kbd>riodraw</kbd></p>
      </a>
    </td>
  </tr>
</table>
  
> **Note**
>
> Hover over the patch to receive information about it.
  
</details>
<details>
<summary><b>ST Patches 水</b></summary>
<br>  
<table>
    <td>
      <a href="https://st.suckless.org/patches/xresources/">
        <p title="Adds the ability to configure st via Xresources."><kbd>xresources</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/font2/">
        <p title="Allows to add spare font besides default."><kbd>font2</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/desktopentry/">
        <p title="Creates a desktop-entry for st."><kbd>desktopentry</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/scrollback/">
        <p title="Scroll back through terminal output."><kbd>scrollback</kbd></p>
      </a>
    </td>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff">
        <p title="Apply the following patch on top of the previous to allow scrolling using mouse."><kbd>scrollback-mouse</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/boxdraw/">
        <p title="Custom rendering of lines/blocks/braille characters for gapless alignment."><kbd>boxdraw</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://st.suckless.org/patches/netwmicon">
        <p title="Enables to set _NET_WM_ICON with a png-image."><kbd>netwmicon</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/alpha/">
        <p title="Allows users to change the opacity of the background."><kbd>alpha</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://github.com/seeingangelz/dotfiles/blob/master/.config/suckless/st/patches/patch_column.diff">
        <p title="Invisible content is kept instead of removed when shrinking the width of the st window."><kbd>patch_column</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://st.suckless.org/patches/workingdir">
        <p title="Allows user to specify the initial path st should use as working directory."><kbd>workingdir</kbd></p>
      </a>
    <td>
      <a href="https://st.suckless.org/patches/glyph_wide_support/st-glyph-wide-support-boxdraw-20220411-ef05519.diff">
        <p title="This patch fixes wide glyphs truncation."><kbd>glyph-wide-support</kbd></p>
      </a>
    </td>
  </tr>
</table>

> **Note**
>
> Hover over the patch to receive information about it.
</details>

<details>
<summary><b>DMENU Patches 矢</b></summary>
<br>
<table>
  <tr>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/listfullwidth/">
        <p title="This patch fixes the prompt width."><kbd>listfullwidth</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/xresources/">
        <p title="Adds the ability to configure dmenu via Xresources."><kbd>xresources</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/border/">
        <p title="Adds a border around the dmenu window."><kbd>border</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/password/">
        <p title="Will not directly display the keyboard input."><kbd>password</kbd></p>
      </a>
    </td>
      <td>
      <a href="https://tools.suckless.org/dmenu/patches/alpha/">
        <p title="Adds translucency to the dmenu window, while keeping the text in it opaque."><kbd>alpha</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/numbers/">
        <p title="Adds text which displays the number of matched and total items in the top right corner of dmenu."><kbd>numbers</kbd></p>
      </a>
    </td>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/center/">
        <p title="Centers dmenu in the middle of the screen."><kbd>center</kbd></p>
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://tools.suckless.org/dmenu/patches/case-insensitive/">
        <p title="Changes case-insensitive item matching to default behaviour."><kbd>case-insensitive</kbd></p>
      </a>
   </td>
</tr>
</table>

> **Note**
>
> Hover over the patch to receive information about it.
</details>

<details>
<summary><b>Keybinds 麗</b></summary><br>

| Keybind                            | Description                                    |
|------------------------------------|------------------------------------------------|
| `Super` + `Enter`                  | Create a new terminal.                         |
| `Super` + `P`                      | Open DMENU.                                    |
| `Super` + `Shift` + `Q`            | Close a window.                                |
| `Super` + `Shift` + `R`            | Restart DWM.                                   |
| `Super` + `←` `→`                  | Move to another window.                        |
| `Super` + `Shift` + `←` `→`        | Move master window.                            |
| `Super` + `Shift` + `Space`        | Toggle floating window.                        |
| `Super` + `,`            	     | Show/Add to scratchpad.                        |
| `Super` + `Shift` + `,`            | Hide scratchpad.                               |
| `Super` + `.`            	     | Remove scratchpad.                             |
| `Super` + `M`                      | Monocle layout.                                |
| `Super` + `T`                      | Tiled layout.                                  |
| `Super` + `F`                      | Spiral layout.                                 |
| `Super` + `U`                      | Centered master layout.                        |
| `Super` + `O`                      | Grid layout.                                   |
| `Super` + `B`                      | Toggle the top bar.                            |
| `Super` + `Shift` + `1/5`          | Move a window to another tag.                  |
| `Super` + `1/5`                    | Switch to another tag.                         |
| `Super` + `I`                      | Increment master.                              |
| `Super` + `D`                      | Decrement master.                              |
| `Super` + `H`                      | Move mfact to the left.                        |
| `Super` + `L`                      | Move mfact to the right.                       |
| `Super` + `K`                      | Move cfact down.                               |
| `Super` + `J`                      | Move cfact up.                                 |
| `Super` + `Space`                  | Toggle last layout.                            |
| `Super` + `Shift` + `Space`        | Toggle floating window.                        |
| `Super` + `=`                      | Increment gaps.                                |
| `Super` + `-`                      | Decrement gaps.                                |
| `Super` + `Alt` + `0`              | Restore gaps.                                  |
| `Super` + `Shift` + `=`            | Increment vertical gaps.                       |
| `Super` + `Shift` + `-`            | Decrement vertical gaps.                       |
| `Super` + `Control` + `=`          | Increment horizontal gaps.                     |
| `Super` + `Control` + `-`          | Decrement horizontal gaps.                     |
| `Super` + `Alt` + `=`              | Increment inside gaps.                         |
| `Super` + `Alt` + `-`              | Decrement inside gaps.                         |
| `Alt` + `←` `↑` `→` `↓`            | Move windows.                                  |
| `Alt` + `Shift` + `←` `↑` `→` `↓`  | Resize windows.                                |
| `Alt` + `Control` + `←` `↑` `→` `↓`| Move windows to the corners.                   |
| `Super` + `F1`                     | Open file manager.                             |
| `Super` + `F2`                     | Open browser.                                  |
| `Super` + `F3`                     | Open messaging application.                    |
| `Super` + `F4`                     | Open music player.                             |
| `Super` + `F6`                     | Open audio manager.                            |
| `Super` + `F7`                     | Open screen recorder.                          |
| `Super` + `F11`                    | Lockscreen.                                    |
| `Calculator`               	     | Open calculator.                               |
| `Super` + `Shift` + `N`            | Toggle nightmode.                              |
| `Super` + `Shift` + `E`            | Theme selector.                                |
| `Super` + `Control` + `E`          | Emoji selector.                                |
| `Super` + `Shift` + `S`            | Manage dotfiles.                               |
| `Super` + `Shift` + `Y`            | Manage clipboard.                              |
| `Super` + `PrtSc`                  | Fullscreen screenshot.                         |
| `PrtSc`                            | Screenshot of the selected area.               |
| `AudioPlay`                 	     | Toggle Play/Pause media.                       |
| `AudioNext`                 	     | Next track.                                    |
| `AudioPrev`                 	     | Previous track.                       	      |
| `AudioLowerVolume`                 | Decrease volume.                               |
| `AudioRaiseVolume`                 | Increase volume.                               |
| `AudioMute`                        | Toggle mute volume.                            |
| `Alt` + `Z`                        | Toggle mute mic.                               |
| `Alt` + `F2`                       | Decrease volume mic.                           |
| `Alt` + `F3`                       | Increase volume mic.                           |
| `MonBrightnessUp`                  | Increase brightness.                           |
| `MonBrightnessDown`                | Decrease brightness.                           |
| `Super` + `Shift` + `P`            | Power Menu.                                    |

</details>

<img src="https://user-images.githubusercontent.com/123886904/218294072-d474a330-7464-430a-b369-91f79373dbca.svg" width="100%" title="Footer">
