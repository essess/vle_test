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
#   clobbers: r0,r3,ctr
# -----------------------------------------------------------------------------
        .section    .text_vle
mpool_init:                                 #  see note 0 about traps
        se_li       r0, 4                   #< sizeof >= 4
        twlt        r5, r0
        se_li       r0, 2                   #< 2+ blocks p/raw blk
        twlt        r4, r0
        se_li       r0, 0
        tweq        r3, r0                  #< raw blk !null
        se_stw      r0, 0(r3)               #< terminate the list
        se_mtctr    r4
@next:  e_bdz       @done
        stwux       r3, r3, r5              #< update and link back
        se_b        @next
@done:  se_stw      r3, head(r2)            #< store off head
        se_blr
.function   "mpool_init", mpool_init, .-mpool_init
# -----------------------------------------------------------------------------
# note 0: turns out trap word immediate isn't available in VLE. you can
#         only trap on reg-to-reg comparisons.
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