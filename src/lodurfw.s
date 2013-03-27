# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
        .include    "led.i"
# -----------------------------------------------------------------------------
#   @public
#   lodurfw: flash upload app. trying something new here .. no interrupts and
#            polling everything, not my usual style/preference.
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
        .public     lodurfw
lodurfw:
        e_stwu      rsp, -?fs(rsp)
        se_mflr     r0
        se_stw      r0, ?lr(rsp)

        e_bl        led_init
        se_li       r2, LED0
@loop:  e_bl        led_invert
        se_b        @loop

        se_lwz      r0, ?lr(rsp)
        se_mtlr     r0
        se_lwz      rsp, ?rsp(rsp)
        se_blr
.function   "lodurfw", lodurfw, .-lodurfw
# -----------------------------------------------------------------------------