# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "fifo.i"
        .include    "fifo_prv.i"
# -----------------------------------------------------------------------------
#   @public
#   pop an item from the front (head) of supplied fifo - not threadsafe
#   args: r2 - ptr to fcb
#   retval: r3 - ptr to item, null on empty
#   clobbers: r0,r4
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
fifo_pop:
        se_li       r0, 0
        tweq        r0, r2                  #< assert fcb ptr !null
        se_lwz      r3, head(r2)            #< get ref to head item
        se_cmpi     r3, 0                   #< fifo empty?
        se_beq      @done                   #  yep
        se_lwz      r4, tail(r2)            #< if head = tail, this was
        se_cmp      r3, r4                  #  last item
        se_bne      @2f
        se_stw      r0, head(r2)            #< null out head and tail
        se_stw      r0, tail(r2)
@done:  se_blr
@2f:    se_lwz      r4, next(r3)            #< 1+ items still in fifo
        se_stw      r4, head(r2)            #< next item is new head
        se_stw      r0, next(r3)            #< wipe next field to be safe
        se_blr
.function   "fifo_pop", fifo_pop, .-fifo_pop
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