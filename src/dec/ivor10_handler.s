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
# -----------------------------------------------------------------------------
        .section    .text_vle
        .align      16
ivor10_handler:
        e_stwu      rsp, -16(rsp)           #< create frame
        se_stw      r2, 12(rsp)             #< push r2
        se_stw      r3, 8(rsp)              #< push r3
        se_stw      r4, 4(rsp)              #< push r4
        se_bgeni    r2, 4
        mttsr       r2                      #< clr TSR[DIE]
        e_lwz       r2, msec@l(r24)
        se_addi     r2, 1                   #< msec++
        e_stw       r2, msec@l(r24)
        se_li       r2, LED0
        se_mflr     r0                      #< safe, no danger of preemption
        se_bl       led_invert
        se_mtlr     r0
        se_lwz      r4, 4(rsp)              #< pop r4
        se_lwz      r3, 8(rsp)              #< pop r3
        se_lwz      r2, 12(rsp)             #< pop r2
        se_lwz      rsp, 0(rsp)             #< clear frame
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