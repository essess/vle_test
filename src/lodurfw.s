# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "swt.i"
# -----------------------------------------------------------------------------
#   @public
#   VLE entry point for the device side firmware of the lodur app:
#       https://bitbucket.org/essess/lodur
# -----------------------------------------------------------------------------
        .section    .init_vle, text_vle
        .public     lodurfw
        .type       lodurfw, @function
lodurfw:
        e_lis       r1, (MAP0_ENAB|MAP1_ENAB|MAP2_ENAB)@h
        e_lis       r2, SWT_BASE@ha
        e_stw       r1, SWT_CR@l(r2)        ;< disable swt
        se_li       r1, 0                   ;< kill booke wdt as best we can,
        mttcr       r1                      ;  see note 0
        mfhid0      r1                      ;< r-m-w, branch prediction enb
        se_bclri    r1, 6                   ;  for both directions
        se_bclri    r1, 7
        mthid0      r1
        e_li        r1, ( %1<<0 | %1<<9 )   ;< enb and flush btb
;       mtbucsr     r1                      ;< see note 1
        mtspr       1013, r1
        mfmsr       r1                      ;< r-m-w, turn on SPE apu
        se_bseti    r1, 6                   ;< see note 2
        mtmsr       r1
; TODO : init flash wait states (why - we're executing from ram!)
; TODO : lockup fmpll
; TODO : ecc wipe (w/side effect of init'ing .bss)
; TODO : set rsp (now that ram ecc is valid)
; TODO : loadup .data (needed for ram images? nope)
        wrteei      1                       ;< unmask external interrupts
        .extern     main
        se_b        main
# -----------------------------------------------------------------------------
# note 0: TCR[WRC] can only be cleared by a reset. The BAM has turned it on for
#         us, so the best we can do at this point is to simply put the trip
#         point so far out in time that it won't trigger itself.
# -----------------------------------------------------------------------------
# note 1: turns out that mwerks generates the wrong code for the mtbucsr
#         instruction; mtspr 1008, Rn. It should be spr 1013 so it's done
#         manually here. Also note that HID0 is 1008, and that was implied
#         immediately before in the last mtxxx instruction. I think that the
#         assembler has no idea what the bucsr register is and silently uses
#         the last spr value (state) from the previous mthid0 register (in
#         which it does know as 1008)
# -----------------------------------------------------------------------------
# note 2: sometimes(!) this instruction generates as se_bseti r1, 3
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