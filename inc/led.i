# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
            .ifndef     _LED_I_
_LED_I_     .equ        1
# -----------------------------------------------------------------------------

LED0        .equ        0
LED1        .equ        1
LED2        .equ        2
LED3        .equ        3

            .public     led_init
            .public     led_invert

# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------