# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "intc.i"
# -----------------------------------------------------------------------------
#   @public
#   external interrupt handler:
#   from INTC used in software mode. NOTE that the entire volatile register
#   context is NOT saved here. I'm going to leave that up to you.
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     ivor4_handler
        .align      16
ivor4_handler:
        e_stwu      rsp, -24(rsp)
        e_stmvsrrw  16(rsp)
        se_stw      r2, 4(rsp)
        se_mflr     r2                      #< we have to take the latency hit
        se_stw      r2, 8(rsp)              #  of storing r2/r3 because we have
        se_stw      r3, 12(rsp)             #  to pull IACKR before re-enb ints
        e_lis       r2, INTC_BASE@ha        #< pull vector/ack it
        e_lwz       r3, INTC_IACKR@l(r2)
        wrteei      1                       #< unmask
        se_lwz      r3, 0(r3)
        se_mtlr     r3
        se_blrl                             #< go
        se_li       r3, 0                   #< RM reccomends wr 0 to EIOR
        e_lis       r2, INTC_BASE@ha
        e_stw       r3, INTC_EOIR@l(r2)
        se_lwz      r3, 12(rsp)
        se_lwz      r2, 8(rsp)
        se_mtlr     r2
        se_lwz      r2, 4(rsp)
        wrteei      0
        e_lmvsrrw   16(rsp)
        se_lwz      rsp, 0(rsp)
        se_rfi
.function   "ivor4_handler", ivor4_handler, .-ivor4_handler
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