# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "mpool.i"
# -----------------------------------------------------------------------------
#   @public
#   exercise the mpool api and provide usage examples
#   args:
#   retval:
#   clobbers: r0,r2,r3,r4,r5
# -----------------------------------------------------------------------------
#   note: no size checks are done. if a raw block was cutup into 8 blocks,
#         there is no code to prevent a 9th block from another pool to be
#         _put() back. 
# -----------------------------------------------------------------------------
#   note: if a block from another pool is inserted into another pool, there are
#         no checks/tracking to prevent this from happening. this has some
#         advantages such that you could have a huge single pre-initialized
#         pool and multiple 'sub' mcb's to disperse across - thus anyone can
#         'own' a block
# -----------------------------------------------------------------------------
#   note: there is no way to prevent _put()ing duplicate blocks into the pool
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?r31:   .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
mpool_test:
        e_stwu      rsp, -?fs(rsp)
        se_mflr     r0
        se_stw      r0, ?lr(rsp)
        se_stw      r31, ?r31(rsp)

        e_add16i    r2, r24, cb@l           #< e_la refused by assem
        e_add16i    r3, r24, pool@l
        se_li       r4, 8
        se_li       r5, 16
        e_bl        mpool_init

        se_li       r31, 0
@get:   e_bl        mpool_get
        se_cmpi     r3, 0
        se_addi     r31, 1
        e_bne       @get                    #< exhaust what we just made
        # r31 == 9 (8+1(chk fail))

        # at this point head is null and pool is completely wiped
        # manually walk the pool 8x16 and start _put()ing back blocks

        e_add16i    r3, r24, pool@l
        e_bl        mpool_put           #< 8
        se_addi     r3, 16
        e_bl        mpool_put           #< 7
        se_addi     r3, 16
        e_bl        mpool_put           #< 6
        se_addi     r3, 16
        e_bl        mpool_put           #< 5
        se_addi     r3, 16
        e_bl        mpool_put           #< 4
        se_addi     r3, 16
        e_bl        mpool_put           #< 3
        se_addi     r3, 16
        e_bl        mpool_put           #< 2
        se_addi     r3, 16
        e_bl        mpool_put           #< 1

        se_lwz      r31, ?r31(rsp)
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
endof_pool:
sizeof_pool     .equ    (endof_pool-pool)/4
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