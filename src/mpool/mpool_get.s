# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "mpool.i"
        .include    "mpool_prv.i"
# -----------------------------------------------------------------------------
#   @public
#   pull a block from the pool - not threadsafe
#   args: r2 - ptr to mpool control block (mcb)
#   retval: r3 - ptr to block, null if empty
#   clobbers: r0,r4
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
mpool_get:
        se_li       r0, 0
        tweq        r2, r0                  #< assert mcb ptr !null
        se_lwz      r3, head(r2)            #< pull head from mcb
        se_cmpi     r3, 0                   #< anything left ?
        se_beq      @empty                  #  nope
        se_lwz      r4, link(r3)            #< pull link of blk head pts to
        se_stw      r4, head(r2)            #< store link as new head
        se_stw      r0, link(r3)            #< just in case, 0 link field
@empty: se_blr
.function   "mpool_get", mpool_get, .-mpool_get
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