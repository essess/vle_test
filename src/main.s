# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "intc.i"
        .include    "dec.i"
        .include    "tb.i"
        .extern     _startof_ram            #< linker supplied sym
        .extern     lodurfw
# -----------------------------------------------------------------------------
#   @public
#   main program:
#       - blr to 'quit', the core will reset itself
#       - rsp points to top of stack
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     main
main:   e_stwu      rsp, -8(rsp)
        se_mflr     r2
        se_stw      r2, 4(rsp)
        e_lis       r2, _startof_ram@h      #< setup int base
        mtivpr      r2                      #
        e_bl        intc_init
        e_bl        dec_init
        e_bl        tb_init
        e_bl        tb_start
        wrteei      1                       #< unmask int's
        se_bl       lodurfw                 #< fire up app
        se_lwz      r2, 4(rsp)
        se_mtlr     r2
        se_lwz      rsp, 0(rsp)
        se_blr
.function   "main", main, .-main
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