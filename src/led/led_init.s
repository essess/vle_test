# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "led.i"
        .include    "led_prv.i"

LEDINIT_PCR .equ        ( PA_GPIO | OBE_ENAB | DSC_50PF | ODE_ENAB | \
                          SRC_MAX | WPE_DIS )

# -----------------------------------------------------------------------------
#   @public
#   initialize all leds to OFF
#   args:
#       none
#   retval:
#       none
#   clobbers:
#       r2, r3
# -----------------------------------------------------------------------------
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
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# with the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
#
#   -Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimers.
#
#   -Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimers in the documentation
#    and/or other materials provided with the distribution.
#
#   -Neither Sean Stasiak, nor the names of other contributors may be used to
#    endorse or promote products derived from this Software without specific
#    prior written permission.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH
# THE SOFTWARE.
# -----------------------------------------------------------------------------