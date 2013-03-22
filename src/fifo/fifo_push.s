# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "fifo.i"
        .include    "fifo_prv.i"
# -----------------------------------------------------------------------------
#   @public
#   push an item into the back (tail) of the supplied fifo - not threadsafe
#   args: r2 - ptr to fcb
#         r3 - ptr to item
#   retval:
#   clobbers: r0,r4
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
fifo_push:
        se_li       r0, 0
        tweq        r0, r2                  #< assert fcb ptr !null
        tweq        r0, r3                  #< assert item ptr !null
        se_stw      r0, next(r3)            #< terminate new item
        se_lwz      r4, tail(r2)            #< grab ptr to curr last item
        se_cmpi     r4, 0                   #< if tail null,
        se_beq      @1f                     #  0 items in fifo, else
        se_stw      r3, next(r4)            #< pnt curr item back to new item
        se_stw      r3, tail(r2)            #< pnt tail to new item
        se_blr
@1f:    se_stw      r3, head(r2)            #< pnt head to new item
        se_stw      r3, tail(r2)            #< pnt tail to new item
        se_blr
.function   "fifo_push", fifo_push, .-fifo_push
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