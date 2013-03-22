# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "fifo.i"
# -----------------------------------------------------------------------------
        .section    .bss
fifo:   .fcb

        .offset
        .flink
field1: .long   0
field2: .long   0
field3: .long   0
sizeof_fifoitem .equ    .

        .section    .bss
item0:  .space  sizeof_fifoitem     #< simple hardcoding for testing
item1:  .space  sizeof_fifoitem
item2:  .space  sizeof_fifoitem
item3:  .space  sizeof_fifoitem
item4:  .space  sizeof_fifoitem

# -----------------------------------------------------------------------------
#   @public
#   exercise fifo api
#   args:
#   retval:
#   clobbers:
# -----------------------------------------------------------------------------
        .section    .bss
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
fifo_test:
        e_stwu      rsp, -?fs(rsp)
        se_mflr     r0
        se_stw      r0, ?lr(rsp)

        e_add16i    r2, r24, fifo@l
        e_bl        fifo_init

        # push all
        e_add16i    r3, r24, item0@l
        se_li       r0, 1
        se_stw      r0, field1(r3)
        se_stw      r0, field2(r3)
        se_stw      r0, field3(r3)
        e_bl        fifo_push

        e_add16i    r3, r24, item1@l
        se_li       r0, 2
        se_stw      r0, field1(r3)
        se_stw      r0, field2(r3)
        se_stw      r0, field3(r3)
        e_bl        fifo_push

        e_add16i    r3, r24, item2@l
        se_li       r0, 3
        se_stw      r0, field1(r3)
        se_stw      r0, field2(r3)
        se_stw      r0, field3(r3)
        e_bl        fifo_push

        e_add16i    r3, r24, item3@l
        se_li       r0, 4
        se_stw      r0, field1(r3)
        se_stw      r0, field2(r3)
        se_stw      r0, field3(r3)
        e_bl        fifo_push

        e_add16i    r3, r24, item4@l
        se_li       r0, 5
        se_stw      r0, field1(r3)
        se_stw      r0, field2(r3)
        se_stw      r0, field3(r3)
        e_bl        fifo_push

        # pop all
        e_bl        fifo_pop    #< 1
        e_bl        fifo_pop    #< 2
        e_bl        fifo_pop    #< 3
        e_bl        fifo_pop    #< 4
        e_bl        fifo_pop    #< 5
        e_bl        fifo_pop    #< null
        # validate head/prev all 0'd

        se_lwz      r0, ?lr(rsp)
        se_mtlr     r0
        se_lwz      rsp, ?rsp(rsp)
        se_blr
.function   "fifo_test", fifo_test, .-fifo_test
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