# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
        .include    "led.i"
        .include    "led_prv.i"
# -----------------------------------------------------------------------------
#   @public
#   initialize all leds to OFF
#   args:
#   retval:
#   clobbers: r2,r3
# -----------------------------------------------------------------------------
LEDINIT_PCR .equ        ( PA_GPIO | OBE_ENAB | DSC_50PF | ODE_ENAB | \
                          SRC_MAX | WPE_DIS )
        .section    .text_vle
led_init:
        se_li       r3, LED_OFF             #< set state to avoid glitch on
        e_lis       r2, SIU_BASE@ha         #  dir change
        e_stb       r3, LED0_GPDO@l(r2)
        e_stb       r3, LED1_GPDO@l(r2)
        e_stb       r3, LED2_GPDO@l(r2)
        e_stb       r3, LED3_GPDO@l(r2)
        e_li        r3, LEDINIT_PCR@l       #< set as output
        e_sth       r3, LED0_PCR@l(r2)
        e_sth       r3, LED1_PCR@l(r2)
        e_sth       r3, LED2_PCR@l(r2)
        e_sth       r3, LED3_PCR@l(r2)
        se_blr
.function   "led_init", led_init, .-led_init
# -----------------------------------------------------------------------------