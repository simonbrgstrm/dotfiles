# Keyboard layouts

Layouts follow the checked-in keymap arrays, not their comments or upstream defaults.

| Keyboard | Keymap |
| --- | --- |
| [Corne / crkbd](crkbd/README.md) | QMK r2g, QMK low-profile, VIA |
| [DZ60](dz60/README.md) | QMK v1, VIA DZ60RGB ANSI v2 |
| [Sofle](sofle/README.md) | QMK |

## Reading the layouts

Each line is a physical row, read left to right. Split keyboards show the left and right halves separated by `||`; their last line contains the thumb keys. Sofle's encoder buttons appear between the halves on the fourth row.

Key names omit the `KC_` prefix, including inside modifier expressions. `TRNS` means transparent (use the next active lower layer); `NO` means disabled. `MO(n)` activates layer `n` while held. `LGUI(...)` / `LWIN(...)` mean GUI (Super/Command/Windows) plus that key, `LALT(...)` / `A(...)` mean Alt, `C(...)` means Ctrl, and `S(...)` / `LSFT(...)` mean Shift. `ALGR(...)` means right Alt. `RESET` / `QK_BOOT` enter the bootloader.

Punctuation retains its keycode name because its output depends on the host keyboard layout. For example, `LBRC`, `SCLN`, `QUOT`, and `SLSH` produce Swedish `Å`, `Ö`, `Ä`, and `-` with a Swedish host layout. `SE_*` names are explicit Swedish-layout aliases (`SE_LCBR` = `{`, `SE_RCBR` = `}`, `SE_LBRC` = `[`, `SE_RBRC` = `]`, `SE_LABK` = `<`, `SE_RABK` = `>`, `SE_PIPE` = `|`, `SE_BSLS` = backslash, `SE_AT` = `@`, `SE_DLR` = `$`, `SE_PLUS` = `+`, `SE_ACUT` = acute accent, `SE_CIRC` = `^`, `SE_TILD` = `~`, `SE_SLSH` = `/`).

RGB controls: `RGB_TOG` toggles lighting, `RGB_MOD` cycles effects; `HUI/HUD`, `SAI/SAD`, `VAI/VAD`, and `SPI/SPD` increase/decrease hue, saturation, brightness, and effect speed. Backlight controls: `BL_TOGG` toggles, `BL_INC` increases brightness, and `BL_STEP` cycles brightness.
