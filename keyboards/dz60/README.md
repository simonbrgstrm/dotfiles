# DZ60

[All keyboards](../README.md) | [Layout legend](../README.md#reading-the-layouts)

## QMK v1

Source: [`v1/keymap.c`](v1/keymap.c). ANSI 60% layout. Hold the Caps Lock position for layer 1, or the right-hand `MO(2)` key for layer 2. `GESC` sends Escape normally and grave with Shift or GUI.

**0 - Base**

```text
GESC | 1    | 2    | 3    | 4    | 5    | 6    | 7    | 8    | 9    | 0    | MINS | EQL  | BSPC
TAB  | Q    | W    | E    | R    | T    | Y    | U    | I    | O    | P    | LBRC | RBRC | BSLS
MO(1)| A    | S    | D    | F    | G    | H    | J    | K    | L    | SCLN | QUOT | ENT
LSFT | Z    | X    | C    | V    | B    | N    | M    | COMM | DOT  | SLSH | RSFT
LCTL | LGUI | LALT |                  SPC                              | RALT | RGUI | MO(2) | RCTL
```

**1 - Function, navigation and lighting**

```text
GRV  | F1      | F2      | F3      | F4      | F5      | F6      | F7   | F8      | F9    | F10  | F11  | F12  | DEL
TRNS | RGB_TOG | RGB_MOD | RGB_HUI | RGB_HUD | RGB_SAI | RGB_SAD | RGB_VAI | RGB_VAD | INS | PSCR | SLCK | PAUS | RESET
TRNS | TRNS    | TRNS    | TRNS    | TRNS    | TRNS    | LEFT    | DOWN | UP      | RIGHT | HOME | END  | TRNS
TRNS | SE_PIPE | SE_LABK | SE_RABK | BL_TOGG | BL_INC  | BL_STEP | TRNS | SE_LABK | SE_RABK | SE_PIPE | TRNS
TRNS | TRNS    | TRNS    |                         TRNS                              | TRNS | TRNS | TRNS | TRNS
```

**2 - GUI shortcuts and navigation**

```text
GRV  | LGUI(F1) | LGUI(F2) | LGUI(F3) | LGUI(F4) | LGUI(F5) | LGUI(F6) | LGUI(F7) | LGUI(F8) | LGUI(F9) | LGUI(F10) | LGUI(F11) | LGUI(F12) | DEL
TRNS | RGB_TOG  | RGB_MOD  | RGB_HUI  | RGB_HUD  | RGB_SAI  | RGB_SAD  | RGB_VAI  | RGB_VAD  | TRNS     | PSCR      | SLCK      | PAUS      | RESET
TRNS | TRNS     | TRNS     | TRNS     | TRNS     | TRNS     | TRNS     | TRNS     | TRNS     | INS      | HOME      | PGUP      | TRNS
TRNS | SE_PIPE  | SE_LABK  | SE_RABK  | BL_TOGG  | BL_INC   | BL_STEP  | TRNS     | DEL      | END      | PGDN      | TRNS
TRNS | TRNS     | TRNS     |                                    TRNS                                          | TRNS | TRNS | TRNS | TRNS
```

## VIA DZ60RGB ANSI v2

Source: [`v2/dz60rgb_ansi_v2`](v2/dz60rgb_ansi_v2). Unused matrix positions are omitted. Unlike v1, the bottom-right keys are `RCTL`, then `MO(2)`.

**0 - Base**

```text
ESC  | 1    | 2    | 3    | 4    | 5    | 6    | 7    | 8    | 9    | 0    | MINS | EQL  | BSPC
TAB  | Q    | W    | E    | R    | T    | Y    | U    | I    | O    | P    | LBRC | RBRC | BSLS
MO(1)| A    | S    | D    | F    | G    | H    | J    | K    | L    | SCLN | QUOT | ENT
LSFT | Z    | X    | C    | V    | B    | N    | M    | COMM | DOT  | SLSH | RSFT
LCTL | LGUI | LALT |                  SPC                              | RALT | RGUI | RCTL | MO(2)
```

**1 - Media, symbols and navigation**

```text
GESC | MUTE | VOLD | VOLU | F4   | F5   | F6   | LWIN(F7) | LWIN(F8) | LWIN(F9) | F10 | F11 | F12 | DEL
TRNS | TRNS | TRNS | TRNS | TRNS | TRNS | TRNS | ASTR     | LPRN     | A(ALGR(8)) | A(ALGR(9)) | A(ALGR(7)) | A(ALGR(0)) | A(ALGR(NUBS))
TRNS | TRNS | TRNS | TRNS | TRNS | TRNS | LEFT | DOWN     | UP       | RGHT     | HOME | END | TRNS
MPRV | TRNS | TRNS | TRNS | TRNS | TRNS | TRNS | TRNS     | NO       | NUBS     | S(LSFT(NUBS)) | NO
TRNS | TRNS | TRNS |                  TRNS                              | TRNS | TRNS | TRNS | TRNS
```

The nested modifier expressions above are preserved exactly from the export rather than translated into assumed characters.

**2 - Function and RGB**

```text
NO   | F1      | F2   | F3      | F4      | F5      | F6      | F7      | F8      | F9      | F10  | F11  | F12  | DEL
TRNS | RGB_TOG | TRNS | RGB_HUI | RGB_HUD | RGB_SAI | RGB_SAD | RGB_VAI | RGB_VAD | RGB_MOD | TRNS | TRNS | TRNS | NO
TRNS | TRNS    | TRNS | TRNS    | TRNS    | TRNS    | TRNS    | TRNS    | RGB_SPI | RGB_SPD | TRNS | TRNS | TRNS
TRNS | TRNS    | TRNS | TRNS    | TRNS    | TRNS    | TRNS    | TRNS    | TRNS    | TRNS    | TRNS | TRNS
TRNS | TRNS    | TRNS |                         TRNS                              | TRNS | TRNS | TRNS | TRNS
```

**3 - Unassigned**

All physical keys are transparent. There is no key assigned to activate this layer in the export.
