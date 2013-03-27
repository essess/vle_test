# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
        .include    "led.i"
        .include    "led_prv.i"
# -----------------------------------------------------------------------------
#   @public
#   invert led state - not threadsafe
#   args: r2 - LEDn
#   retval:
#   clobbers: r3,r4
# -----------------------------------------------------------------------------
        .section    .text_vle
led_invert:
        e_lis       r3, LED0_GPDO@h         #< load 'base' gpdo
        e_or2i      r3, LED0_GPDO@l
        lbzx        r4, r2, r3              #< fetch
        e_xori      r4, r4, %1              #< invert
        stbx        r4, r2, r3              #< write
        se_blr
.function   "led_invert", led_invert, .-led_invert
# -----------------------------------------------------------------------------