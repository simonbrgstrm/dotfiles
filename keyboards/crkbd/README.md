# Corne / crkbd

[All keyboards](../README.md) | [Layout legend](../README.md#reading-the-layouts)

## QMK r2g

Source: [`qmk/r2g/keymap.c`](qmk/r2g/keymap.c). [Build and flash](qmk/r2g/README.md).

Hold the left layer thumb for Lower (1), the right layer thumb for Raise (2), or both for Adjust (3). `SFT/ESC` is `MT(MOD_LSFT, KC_ESC)`: tap for Escape, hold for left Shift.

**0 - QWERTY**

```text
TAB     | Q       | W       | E       | R       | T       || Y       | U       | I       | O       | P       | BSPC
SFT/ESC | A       | S       | D       | F       | G       || H       | J       | K       | L       | SCLN    | QUOT
LCTL    | Z       | X       | C       | V       | B       || N       | M       | COMM    | DOT     | SLSH    | LBRC
                              LGUI   | MO(1)   | SPC     || ENT     | MO(2)   | RGUI
```

**1 - Lower**

```text
TAB     | 1       | 2       | 3       | 4       | 5       || 6       | 7       | 8       | 9       | 0       | DEL
LSFT    | NO      | NO      | NO      | NO      | NO      || LEFT    | DOWN    | UP      | RIGHT   | HOME    | END
LCTL    | NO      | NO      | NO      | NO      | NO      || PLUS    | SE_ACUT | SE_LABK | SE_RABK | SE_PIPE | RCBR
                              LGUI   | TRNS    | SPC     || ENT     | MO(3)   | RGUI
```

**2 - Raise**

```text
TAB     | EXLM    | AT      | HASH    | SE_DLR  | PERC    || CIRC    | AMPR    | ASTR    | LPRN    | RPRN    | MINS
LSFT    | SE_LCBR | SE_RCBR | SE_LBRC | SE_RBRC | SE_TILD || SE_LCBR | SE_RCBR | SE_LBRC | SE_RBRC | SE_BSLS | BSLS
LCTL    | NO      | NO      | LALT(C) | SE_PLUS | SE_CIRC || UNDS    | PLUS    | LCBR    | DOT     | PIPE    | TILD
                              LGUI   | MO(3)   | SPC     || ENT     | TRNS    | RGUI
```

**3 - Adjust**

```text
RESET   | NO      | SE_AT   | HASH    | SE_DLR  | F5      || NO      | LGUI(F7) | LGUI(F8) | LGUI(F9) | NO      | DEL
RGB_TOG | RGB_HUI | RGB_SAI | RGB_VAI | NO      | NO      || NO      | MUTE     | VOLD     | VOLU     | NO      | NO
RGB_MOD | RGB_HUD | RGB_SAD | RGB_VAD | NO      | NO      || NO      | NO       | NO       | NO       | NO      | NO
                              LGUI   | TRNS    | SPC     || ENT     | TRNS     | RGUI
```

## QMK low-profile

Source: [`qmk/lp/simonbrgstrm_lp/keymap.c`](qmk/lp/simonbrgstrm_lp/keymap.c).

The physical layout and layer access match r2g above, with only these keymap differences:

| Layer | Position (left half) | r2g | Low-profile |
| --- | --- | --- | --- |
| Raise (2) | Row 1, column 5 | `SE_DLR` | `DLR` |
| Raise (2) | Row 3, column 4 | `LALT(C)` | `NO` |
| Raise (2) | Row 3, column 5 | `SE_PLUS` | `NO` |
| Adjust (3) | Row 1, column 4 | `HASH` | `NO` |

## VIA

Source: [`via/crkbd`](via/crkbd). The export stores each half separately and mirrors the right-hand rows; the diagrams put them in physical left-to-right order and omit unused matrix positions.

`FN_MO13` holds layer 1, `FN_MO23` holds layer 2; holding both activates layer 3.

**0 - Base**

```text
TAB     | Q       | W       | E       | R       | T       || Y       | U       | I       | O       | P       | BSPC
LSFT    | A       | S       | D       | F       | G       || H       | J       | K       | L       | SCLN    | QUOT
LCTL    | Z       | X       | C       | V       | B       || N       | M       | COMM    | DOT     | SLSH    | ESC
                              LGUI   | FN_MO13 | SPC     || ENT     | FN_MO23 | RALT
```

**1 - Symbols and navigation**

```text
TAB     | EXLM    | AT      | HASH    | DLR     | PERC    || CIRC    | AMPR    | ASTR    | LPRN    | RPRN    | DEL
LSFT    | NO      | NO      | NO      | NO      | NO      || LEFT    | DOWN    | UP      | RGHT    | HOME    | END
LCTL    | NO      | NO      | NO      | NO      | NO      || NO      | NO      | HELP    | HELP    | HELP    | NO
                              LGUI   | TRNS    | SPC     || ENT     | TRNS    | RALT
```

**2 - Numbers and punctuation**

```text
TAB     | 1       | 2       | 3       | 4       | 5       || 6       | 7       | 8       | 9       | 0       | DEL
LCTL    | NO      | NO      | NO      | NO      | NO      || MINS    | EQL     | LBRC    | RBRC    | BSLS    | GRV
LSFT    | NO      | NO      | NO      | NO      | NO      || UNDS    | PLUS    | LCBR    | RCBR    | PIPE    | TILD
                              LGUI   | TRNS    | SPC     || ENT     | TRNS    | RALT
```

**3 - Adjust**

```text
RESET   | NO      | NO      | NO      | NO      | NO      || NO      | LWIN(F7) | LWIN(F8) | LWIN(F9) | NO      | NO
RGB_TOG | RGB_HUI | RGB_SAI | RGB_VAI | NO      | NO      || NO      | MUTE     | VOLD     | VOLU     | NO      | NO
RGB_MOD | RGB_HUD | RGB_SAD | RGB_VAD | NO      | NO      || NO      | NO       | NO       | NO       | NO      | NO
                              LGUI   | TRNS    | SPC     || ENT     | TRNS     | RALT
```
