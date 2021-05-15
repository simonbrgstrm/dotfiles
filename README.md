# dotfiles
![GitHub commit activity](https://img.shields.io/github/commit-activity/w/simonbrgstrm/dotfiles?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/simonbrgstrm/dotfiles?style=for-the-badge)
![GitHub top language](https://img.shields.io/github/languages/top/simonbrgstrm/dotfiles?style=for-the-badge)

Personal config files.


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
