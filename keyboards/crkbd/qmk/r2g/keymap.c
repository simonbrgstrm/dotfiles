#include QMK_KEYBOARD_H
#include <stdio.h>
#include "quantum/keymap_extras/keymap_swedish.h"

// global
#include "transactions.h"
#include "gui_state.h"
#include "boot.h"
#include "navi_logo.h"

#include "draw_helper.h"
#include "fast_random.h"

// left side
#include "layer_frame.h"
#include "burst.h"

// right side
#include "ring.h"

#define ___off___ {0,0,0}
#define MG__WHITE {255,255,255}
#define MG____RED {255,0,0}
#define MG__GREEN {32,159,33}
#define MG___BLUE {80,200,220}
#define MG_YELLOW {255,208,0}
#define MG_ORANGE {255,85,0}
#define MG___PINK {180, 50, 160}
#define MG_PURPLE {50,0,232}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_QWERTY] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                         KC_Y,    KC_U,    KC_I,    KC_O,   KC_P,  KC_BSPC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      MT(MOD_LSFT, KC_ESC), KC_A,  KC_S,    KC_D,    KC_F,    KC_G,          KC_H,    KC_J,    KC_K,    KC_L, KC_SCLN, KC_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LCTL,    KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                         KC_N,    KC_M, KC_COMM,  KC_DOT, KC_SLSH, KC_LBRC,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI,   MO(1),  KC_SPC,     KC_ENT,   MO(2), KC_RGUI
                                      //`--------------------------'  `--------------------------'

  ),

  [_LOWER] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_TAB,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                         KC_6,    KC_7,    KC_8,    KC_9,    KC_0, KC_DEL,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_LEFT, KC_DOWN, KC_UP,  KC_RIGHT, KC_HOME, KC_END,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LCTL, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_PLUS, SE_ACUT, SE_LABK, SE_RABK, SE_PIPE, KC_RCBR,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI, _______,  KC_SPC,     KC_ENT,   MO(3), KC_RGUI
                                      //`--------------------------'  `--------------------------'
  ),

  [_RAISE] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_TAB, KC_EXLM,   KC_AT, KC_HASH,  SE_DLR, KC_PERC,                      KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_MINS,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT, SE_LCBR, SE_RCBR, SE_LBRC, SE_RBRC, SE_TILD,                      SE_LCBR,  SE_RCBR, SE_LBRC, SE_RBRC, SE_BSLS,  KC_BSLS,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LCTL, XXXXXXX, XXXXXXX, LALT(KC_C), SE_PLUS, SE_CIRC,                      KC_UNDS, KC_PLUS, KC_LCBR, KC_DOT, KC_PIPE, KC_TILD,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI,   MO(3),  KC_SPC,     KC_ENT, _______, KC_RGUI
                                      //`--------------------------'  `--------------------------'
  ),

  [_ADJUST] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      RESET,  XXXXXXX,  SE_AT,  KC_HASH,  SE_DLR,  KC_F5,                       XXXXXXX, LGUI(KC_F7), LGUI(KC_F8), LGUI(KC_F9), XXXXXXX, KC_DEL,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RGB_TOG, RGB_HUI, RGB_SAI, RGB_VAI, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_MUTE, KC_VOLD, KC_VOLU, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RGB_MOD, RGB_HUD, RGB_SAD, RGB_VAD, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI, _______,  KC_SPC,     KC_ENT, _______, KC_RGUI
                                      //`--------------------------'  `--------------------------'
  )
};

const uint8_t PROGMEM ledmap[][42][4] = {
[_ADJUST] = {
___off___, MG___PINK, MG___PINK, MG___PINK, MG___PINK, MG___PINK,         ___off___, MG___PINK, MG___PINK, MG___PINK, ___off___, ___off___,
___off___, ___off___, ___off___, ___off___, ___off___, ___off___,         ___off___, MG__WHITE, MG__WHITE, MG__WHITE, ___off___, ___off___,
___off___, ___off___, ___off___, ___off___, ___off___, ___off___,         ___off___, ___off___, ___off___, ___off___, ___off___, ___off___,
                                 ___off___, ___off___, ___off___,         ___off___, ___off___, ___off___
      },
[_LOWER] = {
___off___, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE,         MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE, MG____RED,
___off___, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE,         MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE, MG___BLUE,
___off___, ___off___, ___off___, ___off___, ___off___, ___off___,         ___off___, ___off___, ___off___, ___off___, ___off___, ___off___,
                                 ___off___, ___off___, ___off___,         ___off___, ___off___, ___off___
      },
[_RAISE] = {
___off___, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE,         MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE,
___off___, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE,         MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE, MG_ORANGE,
___off___, ___off___, ___off___, ___off___, ___off___, ___off___,         ___off___, ___off___, ___off___, ___off___, ___off___, ___off___,
                                 ___off___, ___off___, ___off___,         ___off___, ___off___, ___off___
      }
};

extern bool g_suspend_state;
extern rgb_config_t rgb_matrix_config;

// sync transport
typedef struct _sync_keycode_t {
    uint16_t keycode;
} sync_keycode_t;

// force rigth side to update
bool b_sync_need_send = false;

// last keycode typed
sync_keycode_t last_keycode;

void update(uint16_t keycode) {
#if IS_RIGHT
    update_circle(keycode);
#endif
}

void reset(void) {
#if IS_RIGHT
    reset_ring();
#endif
}

void set_wackingup_mode_clean(void) {
    oled_clear();
    reset();
}

void process_key(uint16_t keycode) {
    // update screen with the new key
    update(keycode);

    gui_state_t t = get_gui_state();

    if (t == _IDLE) {
        // wake up animation
        reset();
    }

    if (t == _BOOTING || t == _HALTING) {
        // cancel booting or halting : waking_up
        set_wackingup_mode_clean();
    }

    if (t == _SLEEP) {
        // boot sequence
        set_wackingup_mode_clean();
        reset_boot();
    }

    update_gui_state();
}

void user_sync_a_slave_handler(uint8_t in_buflen, const void* in_data, uint8_t out_buflen, void* out_data) {
    const sync_keycode_t* m2s = (const sync_keycode_t*)in_data;
    // get the last char typed on left side and update the right side
    process_key(m2s->keycode);
}

void keyboard_post_init_user(void) {
    rgb_matrix_enable();
    rgb_matrix_sethsv_noeeprom(10, 180, 180); // (180, 255, 231) is purple
    rgb_matrix_mode_noeeprom(1);
    // HELLO NAVI
    transaction_register_rpc(USER_SYNC_A, user_sync_a_slave_handler);
}

// ====================================================
// RGB matrix
// ====================================================

uint8_t ledIndexForKeymapIndex(uint8_t keyIndex) {
  // Turn keyIndex into a row and column within g_led_config.
  // Reference: https://github.com/qmk/qmk_firmware/blob/master/keyboards/crkbd/r2g/r2g.c
  uint8_t row = 0;
  uint8_t col = 0;
  uint8_t keysPerRow = 12; // Specific to crkdb!
  uint8_t keysPerHalf = keysPerRow / 2; // Assumes equal split!
  row = keyIndex / keysPerRow;
  col = keyIndex % keysPerRow;
  if (row == 3) { // Specific to crkbd!
    col += 3; // Compensate for leading three NO_LED entries in g_led_config.
  }
  bool mirror = (col >= keysPerHalf);
  if (mirror) {
    // Normalise row and col per g_led_config structure.
    row += 4;
    col -= keysPerHalf;
    // Mirror column position.
    col = (keysPerHalf - 1) - col;
  }
  return g_led_config.matrix_co[row][col];
}
void rgb_matrix_indicators_advanced_user(uint8_t led_min, uint8_t led_max) {
    uint8_t layerNum = get_highest_layer(layer_state);
    if (layerNum == 0) {
        return;
    }
    uint8_t ledIndex = 0;
    uint8_t r, g, b;
    for (uint8_t keyIndex = 0; keyIndex < 42; keyIndex++) { // 0 to 42
        ledIndex = ledIndexForKeymapIndex(keyIndex);
        if (ledIndex >= led_min && ledIndex <= led_max) {
            r = pgm_read_byte(&ledmap[layerNum][keyIndex][0]);
            g = pgm_read_byte(&ledmap[layerNum][keyIndex][1]);
            b = pgm_read_byte(&ledmap[layerNum][keyIndex][2]);
            if (!r && !g && !b) {
                RGB_MATRIX_INDICATOR_SET_COLOR(ledIndex, 0, 0, 0);
            } else {
                RGB_MATRIX_INDICATOR_SET_COLOR(ledIndex, r, g, b);
            }
        }
    }
}

// HELLO NAVI
// clang-format on

oled_rotation_t oled_init_user(oled_rotation_t rotation) {
    // vertical orientation
    return OLED_ROTATION_270;
}

void render(gui_state_t t) {
    // logo
    render_logo(t);
#if IS_LEFT
    // left side
    render_layer_frame(t);
    render_gears();
#endif

#if IS_RIGHT
    // right side
    render_circle(t);
#endif
}

bool oled_task_user(void) {
    gui_state_t t = get_gui_state();

    // in sleep mode => turn display off
    if (t == _SLEEP) {
        oled_off();
        return false;
    }

    // not in sleep mode => screen is on
    oled_on();

#ifdef WITH_BOOT
    // in booting mode => display booting animation
    if (t == _BOOTING) {
        bool boot_finished = render_boot();
        if (boot_finished) {
            // end of the boot : wacking up
            set_wackingup_mode_clean();
            update_gui_state();
        }
        return false;
    }
#endif

    // in halting mode => display booting animation
    if (t == _HALTING) {
        render_halt();
        return false;
    }

    render(t);
    return false;
}

void housekeeping_task_user(void) {
    // only for master side
    if (!is_keyboard_master()) return;

    // only if a new char was typed
    if (!b_sync_need_send) return;

    // send the char to the slave side : sync is done
    if (transaction_rpc_send(USER_SYNC_A, sizeof(last_keycode), &last_keycode)) {
        b_sync_need_send = false;
    }
}

bool process_record_user(uint16_t keycode, keyrecord_t* record) {
    if (record->event.pressed) {
        // master : store keycode to sent to the other side to be process_key
        last_keycode.keycode = keycode;
        b_sync_need_send     = true;

        // gui process the input
        process_key(keycode);
    }
    return true;
}

#if IS_LEFT
layer_state_t layer_state_set_user(layer_state_t state) {
    // update the frame with the layer name
    update_layer_frame(state);
    return state;
}
#endif
