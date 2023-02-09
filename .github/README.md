<div align=center>
  
```ocaml
Aeon's Dotfiles
```
  
</div>

<p align="center">
  <img src="https://user-images.githubusercontent.com/120582042/214979888-4e60322a-56e3-4f64-87b0-5ee0c4df7025.png" width="1000px" alt="DWM Rice"/>
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/120582042/214994119-8de5c6c3-a9f6-4281-846e-f1c6b1d6dbd2.png" width="1000px" alt="ExitMenu"/>
</p>

## <div align="center">:snowflake: Information ツ</div>

Here are some details about my setup:

- **OS:** [Arch Linux](https://archlinux.org)
- **WM:** [dwm](https://dwm.suckless.org)
- **Terminal:** [st](https://st.suckless.org)
- **Shell:** [zsh](https://www.zsh.org/)
- **Browser:** [Firefox](https://www.mozilla.org/en-US/) / [qutebrowser](https://www.qutebrowser.org/)
- **Editor:** [neovim](https://github.com/neovim/neovim) / [Emacs](https://www.gnu.org/software/emacs/)
- **Compositor:** [picom (jonaburg)](https://github.com/jonaburg/picom)
- **Application Laucher:** [dmenu](https://tools.suckless.org/dmenu/)
- **Notification Daemon:** [dunst](https://github.com/dunst-project/dunst)
- **Music Player:** [cmus](https://cmus.github.io/)

## <div align="center">:snowflake: Suckless Patches お</div>

<details>
<summary><b>DWM 火</b></summary>
 <ul>
    <li><a href="https://dwm.suckless.org/patches/xresources/">xresources</a> <b>- Allows to handle settings from Xresources.</b></li>
    <li><a href="https://dwm.suckless.org/patches/fullgaps/">fullgaps</a> <b>- Adds gaps between client windows.</b></li>
    <li><a href="https://dwm.suckless.org/patches/selfrestart/">selfrestart</a> <b>- Restart dwm without the unnecessary dependency of an external script.</b></li>
    <li><a href="https://dwm.suckless.org/patches/preserveonrestart/">preserveonrestart</a> <b>- Preserves clients on old tags.</b></li>
    <li><a href="https://dwm.suckless.org/patches/movestack/">movestack</a> <b>- Allows you to move clients around in the stack and swap them with the master.</b></li>
    <li><a href="https://dwm.suckless.org/patches/exitmenu/">exitmenu</a> <b>- Simple exit menu for dwm.</b></li>
    <li><a href="https://dwm.suckless.org/patches/autostart/">autostart</a> <b>- Will make dwm run scripts on startup. (used to configure my statusbar)</b></li>
    <li><a href="https://dwm.suckless.org/patches/statusallmons/">statusallmons</a> <b>- Draws and updates the statusbar on all monitors.</b></li>
    <li><a href="https://dwm.suckless.org/patches/setstatus/">setstatus</a> <b>- Enables to set the status with dwm itself. No more xsetroot bloat!</b></li>
    <li><a href="https://dwm.suckless.org/patches/swallow/">swallow</a> <b>- Adds "window swallowing" to dwm.</b></li>
    <li><a href="https://dwm.suckless.org/patches/pertag/">pertag</a> <b>- Keeps layout, mwfact, barpos and nmaster per tag.</b></li>
    <li><a href="https://dwm.suckless.org/patches/resizecorners/">resizecorners</a> <b>- The mouse is warped to the nearest corner and you resize it from there.</b></li>
    <li><a href="https://dwm.suckless.org/patches/alpha/">alpha</a> <b>- Allow dwm to have translucent bars, while keeping all the text on it opaque.</b></li>
    <li><a href="https://dwm.suckless.org/patches/colorbar/">colorbar</a> <b>- Lets you change the foreground and background color of every statusbar element.</b></li>
    <li><a href="https://dwm.suckless.org/patches/truecenteredtitle/">truecenteredtitle</a> <b>- Center the title with proportion to the area that the title has.</b></li>
    <li><a href="https://dwm.suckless.org/patches/noborder/">noborder</a> <b>- Remove the border when there is only one window visible.</b></li>
    <li><a href="https://dwm.suckless.org/patches/alpha/dwm-fixborders-6.2.diff">fixborders</a> <b>- Fixes dwm bug and allows to make borders opaque.</b></li>
    <li><a href="https://dwm.suckless.org/patches/cfacts/">cfacts</a> <b>- Provides the ability to assign different weights to clients in their respective stack in tiled layout.</b></li>
    <li><a href="https://dwm.suckless.org/patches/centeredmaster/">centeredmaster</a> <b>- Centers the nmaster area on screen.</b></li>
    <li><a href="https://dwm.suckless.org/patches/fibonacci/">fibonacci</a> <b>- Adds two new layouts that arranges all windows in Fibonacci tiles.</b></li>
  </ul>
</details>

<details>
<summary><b>ST 水</b></summary>
 <ul>
   <li><a href="https://st.suckless.org/patches/xresources/">xresources</a> <b>- Adds the ability to configure st via Xresources.</b></li>
   <li><a href="https://st.suckless.org/patches/alpha/">alpha</a> <b>- Allows users to change the opacity of the background.</b></li>
   <li><a href="https://st.suckless.org/patches/boxdraw/">boxdraw</a> <b>- Custom rendering of lines/blocks/braille characters for gapless alignment.</b></li>
   <li><a href="https://st.suckless.org/patches/scrollback/">scrollback</a> <b>- Scroll back through terminal output.</b></li>
   <li><a href="https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff">scrollback-mouse</a> <b>- Apply the following patch on top of the previous to allow scrolling using mouse.</b></li>
</ul>
</details>

<details>
<summary><b>DMENU 矢</b></summary>
 <ul>
   <li><a href="https://tools.suckless.org/dmenu/patches/center/">center</a> <b>- Centers dmenu in the middle of the screen.</b></li>
   <li><a href="https://tools.suckless.org/dmenu/patches/border/">border</a> <b>- Adds a border around the dmenu window.</b></li>
   <li><a href="https://tools.suckless.org/dmenu/patches/alpha/">alpha</a> <b>- Adds translucency to the dmenu window, while keeping the text in it opaque.</b></li>
   <li><a href="https://tools.suckless.org/dmenu/patches/case-insensitive/">case-insensitive</a> <b>- Changes case-insensitive item matching to default behaviour.</b></li>
   <li><a href="https://tools.suckless.org/dmenu/patches/highlight/">highlight</a> <b>- Highlights the individual characters of matched text for each dmenu list entry.</b></li>
   <li><a href="https://tools.suckless.org/dmenu/patches/numbers/">numbers</a> <b>- Adds text which displays the number of matched and total items in the top right corner of dmenu.</b></li>
   <li><a href="https://tools.suckless.org/dmenu/patches/xresources/">xresources</a> <b>- Adds the ability to configure dmenu via Xresources.</b></li>
 </ul>
</details>

## <div align="center">:snowflake: Neovim Config 道</div>

<p align="center">
  <img src="https://user-images.githubusercontent.com/123886904/217865294-688ecbc9-21bd-42cb-95b9-e99d940878ad.png" width="1000px" alt="DWM Rice"/>
</p>
