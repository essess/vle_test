# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "fifo.i"
# -----------------------------------------------------------------------------
#   @public
#   <desc>
#   args:
#   retval:
#   clobbers:
# -----------------------------------------------------------------------------
        .offset
?rsp:   .long       0
?lr:    .long       0
?fs     .equ        .                       #< frame size

        .section    .text_vle
fifo_test:
        e_stwu      rsp, -?fs(rsp)
        se_mflr     r0
        se_stw      rsp, ?lr(rsp)


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