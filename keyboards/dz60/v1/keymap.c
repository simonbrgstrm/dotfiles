#include QMK_KEYBOARD_H
#include "quantum/keymap_extras/keymap_swedish.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/*,-----------------------------------------------------------------------------------------.
| Esc |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  0  |  ?  |  ´  |   Bkspc   |
|-----------------------------------------------------------------------------------------+
| Tab    |  Q  |  W  |  E  |  R  |  T  |  Y  |  U  |  I  |  O  |  P  |  Å  |  ^  |   *    |
|-----------------------------------------------------------------------------------------+
| Lay1    |  A  |  S  |  D  |  F  |  G  |  H  |  J  |  K  |  L  |  Ö  |  Ä  |    Enter    |
|-----------------------------------------------------------------------------------------+
| Shift     |  Z  |  X  |  C  |  V  |  B  |  N  |  M  |  ,  |  .  |  /  |      Shift      |
|-----------------------------------------------------------------------------------------+
| Ctrl |  Cmd  |  Alt  |              Space                |  Alt | Cmd   | Lay2 |  RCTRL |
`-----------------------------------------------------------------------------------------'
*/
	LAYOUT_60_ansi(
		KC_GESC, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,           KC_BSPC,
		KC_TAB,           KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS,
		MO(1),            KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_ENT,
		KC_LSFT,          KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH,          KC_RSFT,
		KC_LCTL, KC_LGUI,          KC_LALT,                   KC_SPC,                             KC_RALT, KC_RGUI,         MO(2),   KC_RCTL),

/* Layer 1
,-----------------------------------------------------------------------------------------.
| Esc |  F1 |  F2 |  F3 |  F4 |  F5 |  F6 |  F7 |  F8 |  F9 | F10 | F11 | F12 |   DELETE  |
|-----------------------------------------------------------------------------------------+
|        |RBB T|RGB M| Hue+| Hue-| Sat+| Sat-| Val+| Val-|     |     |      |      |      |
|-----------------------------------------------------------------------------------------+
|         | BL T| BL M| BL+ | BL- |     |     |     |     |     |     |     |             |
|-----------------------------------------------------------------------------------------+
|           |     |     |     |     |     |     |     |     |     |     |                 |
|-----------------------------------------------------------------------------------------+
|      |       |       |                                   |       |      |       |       |
`-----------------------------------------------------------------------------------------'
*/

	LAYOUT_60_ansi(
		KC_GRV,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,           KC_DEL,
		KC_TRNS,          RGB_TOG, RGB_MOD, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, KC_INS, KC_PSCR, KC_SLCK, KC_PAUS, RESET,
		KC_TRNS,          KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_LEFT, KC_DOWN, KC_UP,   KC_RIGHT,  KC_HOME, KC_END, KC_TRNS,
		KC_TRNS,          SE_PIPE, SE_LABK, SE_RABK,  BL_TOGG, BL_INC,  BL_STEP, KC_TRNS, SE_LABK,  SE_RABK,  SE_PIPE,          KC_TRNS,
		KC_TRNS, KC_TRNS,          KC_TRNS,                   KC_TRNS,                            KC_TRNS, KC_TRNS,          KC_TRNS, KC_TRNS),

/*Layer 2
,-----------------------------------------------------------------------------------------.
| Esc | SF1 | SF2 | SF3 | SF4 | SF5 | SF6 | SF7 | SF8 | SF9 |SF10 |SF11 |SF12 |   DELETE  |
|-----------------------------------------------------------------------------------------+
|        |RBB T|RGB M| Hue+| Hue-| Sat+| Sat-| Val+| Val-|     |     |      |      |      |
|-----------------------------------------------------------------------------------------+
|         | BL T| BL M| BL+ | BL- |     |     |     |     |     |     |     |             |
|-----------------------------------------------------------------------------------------+
|           |     |     |     |     |     |     |     |     |     |     |     |     |     |
|-----------------------------------------------------------------------------------------+
|      |       |       |                                   |     |      |     |     |     |
`-----------------------------------------------------------------------------------------'
*/

	LAYOUT_60_ansi(
		KC_GRV,  LGUI(KC_F1),   LGUI(KC_F2),   LGUI(KC_F3),   LGUI(KC_F4),  LGUI(KC_F5),   LGUI(KC_F6),   LGUI(KC_F7),   LGUI(KC_F8),  LGUI(KC_F9),   LGUI(KC_F10),  LGUI(KC_F11),  LGUI(KC_F12),           KC_DEL,
		KC_TRNS,          RGB_TOG, RGB_MOD, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, KC_TRNS, KC_PSCR, KC_SLCK, KC_PAUS, RESET,
		KC_TRNS,          KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_INS,  KC_HOME, KC_PGUP, KC_TRNS,
		KC_TRNS,          SE_PIPE, SE_LABK, SE_RABK,  BL_TOGG, BL_INC,  BL_STEP, KC_TRNS, KC_DEL,  KC_END,  KC_PGDN,          KC_TRNS,
		KC_TRNS, KC_TRNS,          KC_TRNS,                   KC_TRNS,                            KC_TRNS, KC_TRNS,          KC_TRNS, KC_TRNS)

};

