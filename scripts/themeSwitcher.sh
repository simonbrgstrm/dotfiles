#!/usr/bin/env bash

dot=$HOME/dotfiles
herbstwm_config="${dot}/.config/herbstluftwm/autostart"
polybar_config="${dot}/.config/polybar/colors.ini"
starship_config="${dot}/.config/starship.toml"
dunst_config="${dot}/.config/dunst/dunstrc"
spacevim_config="${dot}/.SpaceVim.d/init.toml"
zsh_config="${dot}/.zshrc"

themeSwitch() {
    if [ -z "$1" ]; then
        echo "Please select theme"
        echo "Themes: gruvbox, nord, sbm"
        return
    fi

    case "$1" in
    "gruvbox")
        herbstluftwm_theme=(
            's/^frameActive=.*/frameActive="#7c6f64"/'
            's/^frameActiveBg=.*/frameActiveBg="#7c6f64"/'
            's/^frameNormal=.*/frameNormal="#282828"/'
            's/^frameNormalBg=.*/frameNormalBg="#928374"/'
            's/^activeColor=.*/activeColor="#366337"/'
            's/^normalColor=.*/normalColor="#8ec07c"/'
            's/^urgentColor=.*/urgentColor="#ff000"/'
            's/^innerColor=.*/innerColor="#282828"/'
            's/^floatingOuterColor=.*/floatingOuterColor="#000000"/'
            's/^activeInnerColor=.*/activeInnerColor="#689d6a"/'
            's/^activeOuterColor=.*/activeOuterColor="#689d6a"/'
            's/^backgroundColor=.*/backgroundColor="#282828"/'
            's/^wall=.*/wall="$HOME\/dotfiles\/wall\/gruvbox.png"/'
        )
        polybar_theme=(
            's/^background.*/background = #383838/'
            's/^foreground.*/foreground = #C4C7C5/'
            's/^cpu.*/cpu = #689D6A/'
            's/^signal.*/signal = #8EC07C/'
            's/^temp.*/temp = #8EC07C/'
            's/^titel.*/titel = #8EC07C/'
            's/^workspacefg.*/workspacefg = #689D6A/'
            's/^workspacebg.*/workspacebg = #383838/'
            's/^urgentfg.*/urgentfg = #E65100/'
            's/^urgentbg.*/urgentbg = #212B30/'
            's/^emptyfg.*/emptyfg = #C4C7C5/'
            's/^emptybg.*/emptybg = #383838/'
            's/^launcher.*/launcher = #FFA726/'
            's/^sepa.*/sepa = #5C6F7B/'
            's/^sysmenu.*/sysmenu = #CC241D/'
        )
        starship_theme=(
            '/directory/{n;s/style.*/style = "bold fg:14"/}'
            '/git_branch/{n;s/style.*/style = "bold fg:9"/}'
            '/git_status/{n;s/style.*/style = "bold fg:13"/}'
            '/nordejs/{n;s/style.*/style = "bold fg:8"/}'
            '/java/{n;s/style.*/style = "bold fg:8"/}'
            '/python/{n;s/style.*/style = "bold fg:8"/}'
            '/golang/{n;s/style.*/style = "bold fg:8"/}'
            '/openstack/{n;s/style.*/style = "bold fg:8"/}'
        )
        dunst_theme=(
            's/^\s\{4,\}background.*/    background = "#282828"/'
            's/^\s\{4,\}foreground.*/    foreground = "#b1b4ba"/'
            's/^\s\{4,\}frame_color.*/    frame_color = "#689d6a"/'
        )
        vim_colorscheme="gruvbox"
        zsh_colorscheme="gruvbox-dark"
        rofi_theme="${dot}/.config/rofi/gruvbox.rasi"
        ;;
    
    "nord")
        herbstluftwm_theme=(
            's/^frameActive=.*/frameActive="#222222"/'
            's/^frameActiveBg=.*/frameActiveBg="#222222"/'
            's/^frameNormal=.*/frameNormal="#101010"/'
            's/^frameNormalBg=.*/frameNormalBg="#916500"/'
            's/^activeColor=.*/activeColor="#d8dee9"/'
            's/^normalColor=.*/normalColor="#5e81ac"/'
            's/^urgentColor=.*/urgentColor="#ff000"/'
            's/^innerColor=.*/innerColor="#4c566a"/'
            's/^floatingOuterColor=.*/floatingOuterColor="#000000"/'
            's/^activeInnerColor=.*/activeInnerColor="#6e9cf0"/'
            's/^activeOuterColor=.*/activeOuterColor="#2e3440"/'
            's/^backgroundColor=.*/backgroundColor="#2e3440"/'
            's/^wall=.*/wall="$HOME\/dotfiles\/wall\/nord.png"/'
        )
        polybar_theme=(
            's/^background.*/background = #3B4252/'
            's/^foreground.*/foreground = #C4C7C5/'
            's/^cpu.*/cpu = #81A1C1/'
            's/^signal.*/signal = #64AAAF/'
            's/^temp.*/temp = #81A1C1/'
            's/^titel.*/titel = #81A1C1/'
        )
        starship_theme=(
            '/directory/{n;s/style.*/style = "bold fg:6"/}'
            '/git_branch/{n;s/style.*/style = "bold fg:80"/}'
            '/git_status/{n;s/style.*/style = "bold fg:1"/}'
        )
        dunst_theme=(
            's/^\s\{4,\}background.*/    background = "#2e3440"/'
            's/^\s\{4,\}foreground.*/    foreground = "#b1b4ba"/'
            's/^\s\{4,\}frame_color.*/    frame_color = "#6e9cf0"/'
        )
        vim_colorscheme="nord"
        zsh_colorscheme="nord"
        rofi_theme="${dot}/.config/rofi/nord.rasi"
        ;;
    
    *)
        echo "Unknown theme: $1"
        return 1
        ;;
    esac

    # Apply all changes for the selected theme
    for cmd in "${herbstluftwm_theme[@]}"; do
        sed -i "$cmd" "$herbstwm_config"
    done

    for cmd in "${polybar_theme[@]}"; do
        sed -i "$cmd" "$polybar_config"
    done

    for cmd in "${starship_theme[@]}"; do
        sed -i "$cmd" "$starship_config"
    done

    for cmd in "${dunst_theme[@]}"; do
        sed -i "$cmd" "$dunst_config"
    done

    sed -i "s/^\s\{4,\}colorscheme.*/    colorscheme = \"$vim_colorscheme\"/" "$spacevim_config"
    sed -i "s/^ZSHCOL=.*/ZSHCOL=\"$zsh_colorscheme\"/" "$zsh_config"

    # Link rofi theme
    ln -sf "$rofi_theme" /usr/share/rofi/themes/default.rasi

    # Reload changes
    herbstclient reload
    killall dunst; notify-send "Theme" "$1"
    killall -USR1 zsh
}

themeSwitch "$1"
