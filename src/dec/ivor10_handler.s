# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "led.i"
        .include    "dec_prv.i"
# -----------------------------------------------------------------------------
#   @public
#   decrementer interrupt handler:
#   this interrupts is so short, I don't bother unmasking. if you do more here
#   consider this as a point of optimization to keep int latency low.
#   clobbers: r2,r3,r4,lr - but restored before exit since this is an interrupt
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?r2:    .long       0
?r3:    .long       0
?r4:    .long       0
?srr0:  .long       0
?srr1:  .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
        .align      16
ivor10_handler:
        e_stwu      rsp, -?fs(rsp)
        e_stmvsrrw  ?srr0(rsp)
        se_stw      r2, ?r2(rsp)
        se_bgeni    r2, 4
        mttsr       r2                      #< clr TSR[DIE]
        wrteei      1                       #< unmask

        e_lwz       r2, msec@l(r24)         #< !atomic, but msec is ro
        se_addi     r2, 1                   #  and therefore safe to modify
        e_stw       r2, msec@l(r24)         #  in one place only (here)

        se_stw      r3, ?r3(rsp)            #< save remaining context
        se_stw      r4, ?r4(rsp)
        se_mflr     r2
        se_stw      r2, ?lr(rsp)

        se_li       r2, LED0
        se_bl       led_invert

        se_lwz      r2, ?lr(rsp)
        se_mtlr     r2
        se_lwz      r4, ?r4(rsp)
        se_lwz      r3, ?r3(rsp)
        se_lwz      r2, ?r2(rsp)
        wrteei      0                       #< mask
        e_lmvsrrw   ?srr0(rsp)
        se_lwz      rsp, ?rsp(rsp)
        se_rfi
.function   "ivor10_handler", ivor10_handler, .-ivor10_handler
# -----------------------------------------------------------------------------
        .section    .bss
        .align      4
        .public     msec
msec:   .long       0                       # system time -> READ-ONLY
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