#!/usr/bin/env bash

dot=$HOME/dotfiles

themeSwitch() {
    if [ "{$1}" == "" ]; then
        echo "Please select theme"
        echo "Themes: gruvbox, nord, sbm"
    elif [ "${1}" == "gruvbox" ]; then
        sed -i 's/^frameActive\=.*/frameActive="#7c6f64"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameActiveBg\=.*/frameActiveBg="#7c6f64"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameNormal\=.*/frameNormal="#282828"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameNormalBg\=.*/frameNormalBg="#928374"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeColor\=.*/activeColor="#b8bb26"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^normalColor\=.*/normalColor="#98971a"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^urgentColor\=.*/urgentColor="#ff000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^innerColor\=.*/innerColor="#282828"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^floatingOuterColor\=.*/floatingOuterColor="#000000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeInnerColor\=.*/activeInnerColor="#b8bb26"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeOuterColor\=.*/activeOuterColor="#98971a"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^backgroundColor\=.*/backgroundColor="#282828"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^wall\=.*/wall="$HOME\/dotfiles\/wall\/gruvbox.png"/' "${dot}"/.config/herbstluftwm/autostart
        
        sed -i 's/^\s\{4,\}colorscheme.*/    colorscheme = "gruvbox"/' "${dot}"/.SpaceVim.d/init.toml

        sed -i 's/^ZSHCOL\=.*/ZSHCOL="gruvbox-dark"/' "${dot}"/.zshrc
        ln -sf "${dot}"/.config/rofi/gruvbox.rasi /usr/share/rofi/themes/default.rasi
        herbstclient reload
        killall dunst;notify-send "Theme" "gruvbox"

    elif [ "${1}" == "nord" ]; then
        sed -i 's/^frameActive\=.*/frameActive="#222222"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameActiveBg\=.*/frameActiveBg="#222222"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameNormal\=.*/frameNormal="#101010"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameNormalBg\=.*/frameNormalBg="#916500"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeColor\=.*/activeColor="#d8dee9"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^normalColor\=.*/normalColor="#5e81ac"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^urgentColor\=.*/urgentColor="#ff000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^innerColor\=.*/innerColor="#4c566a"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^floatingOuterColor\=.*/floatingOuterColor="#000000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeInnerColor\=.*/activeInnerColor="#6e9cf0"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeOuterColor\=.*/activeOuterColor="#2e3440"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^backgroundColor\=.*/backgroundColor="#2e3440"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^wall\=.*/wall="$HOME\/dotfiles\/wall\/nord.png"/' "${dot}"/.config/herbstluftwm/autostart

        sed -i 's/^background.*/background = #3B4252/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^foreground.*/foreground = #C4C7C5/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^cpu.*/cpu = #81A1C1/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^signal.*/signal = #64AAAF/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^temp.*/temp = #81A1C1/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^titel.*/titel = #81A1C1/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^workspacefg.*/workspacefg = #88C0D0/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^workspacebg.*/workspacebg = #3B4252/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^urgentfg.*/urgentfg = #E65100/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^urgentbg.*/urgentbg = #212B30/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^emptyfg.*/emptyfg = #C4C7C5/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^emptybg.*/emptybg = #3B4252/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^launcher.*/launcher = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^sepa.*/sepa = #5C6F7B/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^sep2.*/sep2 = #5C6F7B/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^sysmenu.*/sysmenu = #BF616A/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^menuopen.*/menuopen = #8FBCBB/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^menuclosed.*/menuclosed = #8FBCBB/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^menuseperator.*/menuseperator = #8FBCBB/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memorylow.*/memorylow = #61C766/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memorymed.*/memorymed = #8FBCBB/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memoryhigh.*/memoryhigh = #EC7875/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memoryfg.*/memoryfg = #5C6F7B/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^batfull.*/batfull = #81A1C1/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^batdis.*/batdis = #FBC02D/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^batcharg.*/batcharg = #61C766/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^volume.*/volume = #8FBCBB/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^muted.*/muted = #C4C7C5/' "${dot}"/.config/polybar/colors.ini

        sed -i '/directory/{n;s/style.*/style = "bold fg:6"/}' "${dot}"/.config/starship.toml
        sed -i '/git_branch/{n;s/style.*/style = "bold fg:79"/}' "${dot}"/.config/starship.toml
        sed -i '/git_status/{n;s/style.*/style = "bold fg:1"/}' "${dot}"/.config/starship.toml
        sed -i '/nordejs/{n;s/style.*/style = "bold fg:31"/}' "${dot}"/.config/starship.toml
        sed -i '/java/{n;s/style.*/style = "bold fg:31"/}' "${dot}"/.config/starship.toml
        sed -i '/python/{n;s/style.*/style = "bold fg:31"/}' "${dot}"/.config/starship.toml
        sed -i '/golang/{n;s/style.*/style = "bold fg:31"/}' "${dot}"/.config/starship.toml
        sed -i '/openstack/{n;s/style.*/style = "bold fg:31"/}' "${dot}"/.config/starship.toml

        sed -i 's/^\s\{4,\}background.*/    background = "#2e3440"/' "${dot}"/.config/dunst/dunstrc
        sed -i 's/^\s\{4,\}foreground.*/    foreground = "#b1b4ba"/' "${dot}"/.config/dunst/dunstrc
        sed -i 's/^\s\{4,\}frame_color.*/    frame_color = "#6e9cf0"/' "${dot}"/.config/dunst/dunstrc
        
        sed -i 's/^\s\{4,\}colorscheme.*/    colorscheme = "nord"/' "${dot}"/.SpaceVim.d/init.toml

        sed -i 's/^ZSHCOL\=.*/ZSHCOL="nord"/' "${dot}"/.zshrc
        ln -sf "${dot}"/.config/rofi/nord.rasi /usr/share/rofi/themes/default.rasi
        herbstclient reload
        killall dunst;notify-send "Theme" "nord"

    elif [ "${1}" == "sbm" ]; then
        sed -i 's/^frameActive\=.*/frameActive="#ffb200"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameActiveBg\=.*/frameActiveBg="#ffb200"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameNormal\=.*/frameNormal="#222222"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^frameNormalBg\=.*/frameNormalBg="#916500"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeColor\=.*/activeColor="#ffb200"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^normalColor\=.*/normalColor="#704b0b"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^urgentColor\=.*/urgentColor="#ff0000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^innerColor\=.*/innerColor="#000000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^floatingOuterColor\=.*/floatingOuterColor="#000000"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeInnerColor\=.*/activeInnerColor="#996b00"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^activeOuterColor\=.*/activeOuterColor="#996b00"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^backgroundColor\=.*/backgroundColor="#996b00"/' "${dot}"/.config/herbstluftwm/autostart
        sed -i 's/^wall\=.*/wall="$HOME\/dotfiles\/wall\/sbm.png"/' "${dot}"/.config/herbstluftwm/autostart

        sed -i 's/^background.*/background = #212B30/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^foreground.*/foreground = #C4C7C5/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^cpu.*/cpu = #FDD835/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^signal.*/signal = #EF6C00/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^temp.*/temp = #FBC02D/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^titel.*/titel = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^workspacefg.*/workspacefg = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^workspacebg.*/workspacebg = #212B30/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^urgentfg.*/urgentfg = #E65100/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^urgentbg.*/urgentbg = #212B30/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^emptyfg.*/emptyfg = #C4C7C5/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^emptybg.*/emptybg = #212B30/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^launcher.*/launcher = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^sepa.*/sepa = #5C6F7B/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^sep2.*/sep2 = #5C6F7B/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^sysmenu.*/sysmenu = #D32F2F/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^menuopen.*/menuopen = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^menuclosed.*/menuclosed = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^menuseperator.*/menuseperator = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memorylow.*/memorylow = #61C766/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memorymed.*/memorymed = #FBC02D/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memoryhigh.*/memoryhigh = #EC7875/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^memoryfg.*/memoryfg = #5C6F7B/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^batfull.*/batfull = #FFA726/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^batdis.*/batdis = #FBC02D/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^batcharg.*/batcharg = #61C766/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^volume.*/volume = #FDD835/' "${dot}"/.config/polybar/colors.ini
        sed -i 's/^muted.*/muted = #C4C7C5/' "${dot}"/.config/polybar/colors.ini

        sed -i '/directory/{n;s/style.*/style = "bold fg:202"/}' "${dot}"/.config/starship.toml
        sed -i '/git_branch/{n;s/style.*/style = "bold fg:81 #cd853f"/}' "${dot}"/.config/starship.toml
        sed -i '/git_status/{n;s/style.*/style = "bold fg:11"/}' "${dot}"/.config/starship.toml
        sed -i '/nordejs/{n;s/style.*/style = "bold fg:3"/}' "${dot}"/.config/starship.toml
        sed -i '/java/{n;s/style.*/style = "bold fg:3"/}' "${dot}"/.config/starship.toml
        sed -i '/python/{n;s/style.*/style = "bold fg:3"/}' "${dot}"/.config/starship.toml
        sed -i '/golang/{n;s/style.*/style = "bold fg:3"/}' "${dot}"/.config/starship.toml
        sed -i '/openstack/{n;s/style.*/style = "bold fg:3"/}' "${dot}"/.config/starship.toml

        sed -i 's/^\s\{4,\}background.*/    background = "#282928"/' "${dot}"/.config/dunst/dunstrc
        sed -i 's/^\s\{4,\}foreground.*/    foreground = "#b56d1b"/' "${dot}"/.config/dunst/dunstrc
        sed -i 's/^\s\{4,\}frame_color.*/    frame_color = "#ffb200"/' "${dot}"/.config/dunst/dunstrc

        sed -i 's/^\s\{4,\}colorscheme .*/    colorscheme = "badwolf"/' "${dot}"/.SpaceVim.d/init.toml

        sed -i 's/^ZSHCOL\=.*/ZSHCOL="sbm"/' "${dot}"/.zshrc
        ln -sf "${dot}"/.config/rofi/sbm.rasi /usr/share/rofi/themes/default.rasi
        herbstclient reload
        killall dunst;notify-send "Theme" "sbm"

    else
        echo "Invalid theme"
        echo "Themes: gruvbox, nord, sbm"
    fi
}

themeSwitch "$(echo '
gruvbox
nord
sbm' | rofi -dmenu show -p Theme)"
