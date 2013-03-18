# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "mpool.i"
# -----------------------------------------------------------------------------
#   @public
#   initialize a block pool - not threadsafe
#   args: r2 - ptr to mpool control block (mcb)
#         r3 - ptr to start of raw block
#         r4 - desired number of blocks (>=2)
#         r5 - desired sizeof blocks in bytes (>=4)
#   retval: none
#   clobbers: nothing more than original args
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?r30:   .long       0                       #< sizeof blks
?r31:   .long       0                       #< topof raw blk
?fs     .equ        .                       #< frame size

        .section    .text_vle
mpool_init:
        e_stwu      rsp, -?fs(rsp)
        se_mflr     r0
        se_stw      r0, ?lr(rsp)
#       tweqi       r3, 0                   #< block ptr can't be null
        se_stw      r31, ?r31(rsp)
        se_mr       r31, r3
#       twlti       r5, 4                   #< sizeof >= 4
        se_stw      r30, ?r30(rsp)
        se_mr       r30, r5
#       twlti       r4, 2                   #< 2+ blocks p/raw blk
        se_mtctr    r4

        e_bl        fifo_init               #< r2 validated here

# foreach block
#   start peeling off blocks and pushing them into the fifo

        se_lwz      r30, ?r30(rsp)
        se_lwz      r31, ?r31(rsp)
        se_lwz      r0, ?lr(rsp)
        se_mtlr     r0
        e_lwz       rsp, ?rsp(rsp)
        se_blr
.function   "mpool_init", mpool_init, .-mpool_init
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