## Sofle Keyboard

[All keyboards](../README.md) | [Layout legend](../README.md#reading-the-layouts)

### Bootloader
```
BOOTLOADER = atmel-dfu
```

### QMK Firmware steps for Sofle Keyboard
Create new keymap
```sh
qmk new-keymap -kb sofle
```

Compile the new keymap
```sh
qmk compile -kb sofle/rev1 -km {name}
```

Flash the new keymap
```sh
qmk flash -kb sofle/rev1 -km {name}
```

## Keymap

Source: [`keymap.c`](keymap.c).

Hold `LOWER` for layer 2, `RAISE` for layer 3, or both for Adjust (4). Adjust's `QWERTY` and `COLEMAK` keys select a persistent default layer. `CG_TOGG` swaps left Ctrl and GUI for Mac/Windows-style operation.

**0 - QWERTY**

```text
ESC  | 1    | 2    | 3    | 4    | 5    || 6    | 7    | 8    | 9    | 0    | BSPC
TAB  | Q    | W    | E    | R    | T    || Y    | U    | I    | O    | P    | LBRC
LSFT | A    | S    | D    | F    | G    || H    | J    | K    | L    | SCLN | QUOT
LCTL | Z    | X    | C    | V    | B    | MUTE || NO | N | M | COMM | DOT | SLSH | RSFT
       LGUI | LALT | LCTL | LOWER | SPC || ENT | RAISE | RCTL | RALT | RGUI
```

**1 - Colemak**

```text
GRV  | 1    | 2    | 3    | 4    | 5    || 6    | 7    | 8    | 9    | 0    | GRV
ESC  | Q    | W    | F    | P    | G    || J    | L    | U    | Y    | SCLN | BSPC
TAB  | A    | R    | S    | T    | D    || H    | N    | E    | I    | O    | QUOT
LSFT | Z    | X    | C    | V    | B    | MUTE || NO | K | M | COMM | DOT | SLSH | RSFT
       LGUI | LALT | LCTL | TL_LOWR | ENT || SPC | TL_UPPR | RCTL | RALT | RGUI
```

The Colemak array uses `TL_LOWR` and `TL_UPPR`, not the custom `KC_LOWER` and `KC_RAISE` handled by this file. Their definitions are not present in this repository, so their behavior is not established here. Colemak also reverses Space and Enter compared with QWERTY.

**2 - Lower**

```text
TRNS | F1   | F2   | F3   | F4   | F5   || F6      | F7      | F8      | SE_SLSH | RBRC    | DEL
GRV  | 1    | 2    | 3    | 4    | 5    || SE_LCBR | SE_RCBR | SE_LBRC | SE_RBRC | MINS    | BSLS
TRNS | EXLM | SE_AT | HASH | SE_DLR | PERC || LEFT  | DOWN    | UP      | RIGHT   | HOME    | END
TRNS | EQL  | MINS | PLUS | LCBR | RCBR | TRNS || TRNS | BSLS | RBRC | SE_LABK | SE_RABK | SE_PIPE | TRNS
       TRNS | TRNS | TRNS | TRNS | TRNS || TRNS | TRNS | TRNS | TRNS | TRNS
```

**3 - Raise**

```text
TRNS | TRNS | TRNS | TRNS | TRNS | TRNS || TRNS | LGUI(F7) | LGUI(F8) | LGUI(F9) | TRNS | TRNS
TRNS | INS  | PSCR | APP  | NO   | NO   || PGUP | PRVWD    | UP       | NXTWD    | C(BSPC) | BSPC
TRNS | LALT | LCTL | LSFT | NO   | CAPS || PGDN | LEFT     | DOWN     | RGHT     | DEL  | BSPC
TRNS | C(Z) | C(X) | C(C) | C(V) | NO | TRNS || TRNS | NO | LSTRT | NO | LEND | NO | TRNS
       TRNS | TRNS | TRNS | TRNS | TRNS || TRNS | TRNS | TRNS | TRNS | TRNS
```

`PRVWD` / `NXTWD` send Ctrl+Left/Right normally, or Alt+Left/Right when Ctrl/GUI are swapped. `LSTRT` / `LEND` send Home/End normally, or GUI+Left/Right in swapped mode. The editing keys send Ctrl+Z/X/C/V; they are not host-independent clipboard commands.

**4 - Adjust**

```text
NO      | NO | NO      | NO      | NO      | NO || NO | NO   | NO   | NO   | NO | NO
QK_BOOT | NO | QWERTY  | COLEMAK | CG_TOGG | NO || NO | NO   | NO   | NO   | NO | NO
NO      | NO | CG_TOGG | NO      | NO      | NO || NO | VOLD | MUTE | VOLU | NO | NO
NO      | NO | NO      | NO      | NO      | NO | NO || NO | NO | MPRV | MPLY | MNXT | NO | NO
          TRNS | TRNS | TRNS | TRNS | TRNS || TRNS | TRNS | TRNS | TRNS | TRNS
```

[`oldkeymap.c`](oldkeymap.c) is a legacy copy, not the layout documented above. It has no Colemak array and contains a malformed Lower initializer; use `keymap.c` as the current reference.

