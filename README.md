<h2 align="center"> dotfiles </h2>

<!-- BADGES -->
<div align="center">
   <p></p>
   <a href="">
      <img src="https://img.shields.io/github/last-commit/simonbrgstrm/dotfiles?color=f5ab8c&labelColor=1C2325&style=for-the-badge">
   </a>
   <a href="https://github.com/simonbrgstrm/dotfiles/stargazers">
      <img src="https://img.shields.io/github/languages/top/simonbrgstrm/dotfiles?color=f0a65d&labelColor=1C2325&style=for-the-badge">
   </a>
   <a href="https://github.com/janleigh/dotfiles/">
      <img src="https://img.shields.io/github/repo-size/simonbrgstrm/dotfiles?color=ffa0a0&labelColor=1C2325&style=for-the-badge">
   </a>
   <br>
</div>

<h2></h2>

<!-- INFORMATION -->



## Install
1. Clone repo
```
git clone https://github.com/simonbrgstrm/dotfiles.git
```

2. Install all the packages
```
./install.sh
```

3. Install [Polybar](#polybar)

4. Symlink all the configs
```
./symlink.sh
```

### Polybar
```
cd ~/polybar-3.5.5 && ./build.sh
```

Answer `No` on the first two (Clang and i3) and all others `Yes`.

And `Yes` on `sudo make install`

## Screenshots

### sbm
![sbm](./screenshots/sbm.png)

### nord
![nord](./screenshots/nord.png)

### gruvbox
![gruvbox](./screenshots/gruvbox.png)
