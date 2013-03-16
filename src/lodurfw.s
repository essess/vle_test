# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "core\intc_regs.i"
        .include    "led.i"
        .extern     intc_reg_handler
# -----------------------------------------------------------------------------
#   @public
#   lodurfw: app
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     lodurfw
lodurfw:
        e_bl        led_init
        se_li       r3, 0                   #< sw0 vector
        e_lis       r2, clrflg0@h           #< handler
        e_or2i      r2, clrflg0@l
        e_bl        intc_reg_handler        #< reg it
        se_li       r3, 1
        e_lis       r2, INTC_BASE@ha
        e_stb       r3, INTC_PSR0@l(r2)     #< set sw0 pri = 1
@loop:  se_li       r3, SET
        e_stb       r3, INTC_SSCIR0@l(r2)   #< assert irq synchronously
        se_b        @loop
.function   "lodurfw", lodurfw, .-lodurfw
# -----------------------------------------------------------------------------
#   @internal
#   clr sw int 0 flag
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     clrflg0
clrflg0:
        e_stwu      rsp, -12(rsp)
        se_stw      r4, 4(rsp)              #< push r4
        se_mflr     r4
        se_stw      r4, 8(rsp)              #< push lr
        e_lis       r2, INTC_BASE@ha        #< only use r2/r3 here, they're the
        se_li       r3, CLR                 #  safe clobber regs from ivor4
        e_stb       r3, INTC_SSCIR0@l(r2)
        se_li       r2, LED1
        e_bl        led_invert              #< TODO: save clobbered registers in frame!
        se_lwz      r4, 8(rsp)              #< pop lr
        se_mtlr     r4
        se_lwz      r4, 4(rsp)              #< pop r4
        se_lwz      rsp, 0(rsp)
        se_blr
.function   "clrflg0", clrflg0, .-clrflg0
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