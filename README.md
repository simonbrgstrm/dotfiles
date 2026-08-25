<h2 align="center"> dotfiles </h2>

<div align="center">
   <p></p>
   <a href="">
      <img src="https://img.shields.io/github/last-commit/simonbrgstrm/dotfiles?color=f5ea8c&labelColor=1C2325&style=for-the-badge">
   </a>
   <a href="https://github.com/simonbrgstrm/dotfiles/">
      <img src="https://img.shields.io/github/languages/top/simonbrgstrm/dotfiles?color=f0a65d&labelColor=1C2325&style=for-the-badge">
   </a>
   <a href="https://github.com/simonbrgstrm/dotfiles/">
      <img src="https://img.shields.io/github/repo-size/simonbrgstrm/dotfiles?color=ffa0a0&labelColor=1C2325&style=for-the-badge">
   </a>
   <br>
</div>

<h2></h2>

## ▶️ <samp>INFORMATION</samp>

   <img src="./screenshots/rice.png" alt="rice" align="right" width="500px">

   Personal configs.


   :small_orange_diamond: **Window Manager:** [herbstluftwm](https://herbstluftwm.org/) :herb:
   
   :small_orange_diamond: **Terminal:** [alacritty](https://github.com/alacritty/alacritty)
   
   :small_orange_diamond: **Sessions:** [tmux](https://github.com/tmux/tmux/wiki)
   
   :small_orange_diamond: **Shell:** [zsh](https://www.zsh.org/)
   
   :small_orange_diamond: **Shell Prompt:** [starship](https://starship.rs/)
   
   :small_orange_diamond: **Panel:** [polybar](https://github.com/polybar/polybar)
   
   :small_orange_diamond: **Compositor:** [picom](https://github.com/yshui/picom)
   
   :small_orange_diamond: **Editor:** [neovim](https://github.com/neovim/neovim)
   
   :small_orange_diamond: **Browser:** [firefox](https://www.mozilla.org/en-US/firefox)
   
   :small_orange_diamond: **Notification Manager:** [dunst](https://github.com/dunst-project/dunst)
   
   :small_orange_diamond: **File Manager:** [ranger](https://github.com/ranger/ranger)
   
   :small_orange_diamond: **Application Launcher:** [rofi](https://github.com/davatorium/rofi)



## Install
1. Clone repo
```
git clone https://github.com/simonbrgstrm/dotfiles.git
cd dotfiles
```

2. Install dependencies and bootstrap tools (Ubuntu only)
```
./install.sh
```

`install.sh` installs apt dependencies, Docker + Spotify repos, Spicetify, Oh My Zsh, Starship, downloads Polybar source, and runs `./symlink.sh` by default.

3. Re-run symlinks if needed
```
./symlink.sh
```

### Polybar
```
cd ~/polybar-3.7.2 && ./build.sh
```

Answer `No` on the first two (Clang and i3) and all others `Yes`.

And `Yes` on `sudo make install`
