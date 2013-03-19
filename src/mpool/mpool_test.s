# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "mpool.i"
# -----------------------------------------------------------------------------
#   @public
#   <desc>
#   args:
#   retval:
#   clobbers: r0
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
mpool_test:
        e_stwu      rsp, -?fs(rsp)
        se_mflr     r0
        se_stw      r0, ?lr(rsp)

        e_add16i    r2, r24, cb@l           #< e_la refused by assem
        e_add16i    r3, r24, pool@l
        se_li       r4, 8
        se_li       r5, 16
        e_bl        mpool_init

        se_lwz      r0, ?lr(rsp)
        se_mtlr     r0
        se_lwz      rsp, ?rsp(rsp)
        se_blr
.function   "mpool_test", mpool_test, .-mpool_test
# -----------------------------------------------------------------------------
        .section    .bss
cb:     .mcb
        .align      4
pool:   .space      8*16                    #< 8 blks @ 16 bytes ea
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