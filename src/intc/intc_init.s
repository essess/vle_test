# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "intc.i"
        .extern     ivor4_handler
        .extern     _f_vectbl                   #< linker defined
# -----------------------------------------------------------------------------
#   @public
#   intc_init, using software vector mode - the boilerplate code (and it's
#   size) for hardware vector mode is not a big enough reason for slightly
#   less latency gained
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     intc_init
intc_init:
        e_or2i      r2, ivor4_handler@l         #< register handler
        mtivor4     r2                          #
        e_lis       r2, INTC_BASE@ha
        se_li       r3, ( SVEN | VTES_4 )       #< sw vector mode, word wide
        e_stw       r3, INTC_MCR_OFFSET@l(r2)   #  entries in table
        e_lis       r3, _f_vectbl@h             #< loadup table base into VTBA
        e_or2i      r3, _f_vectbl@l             #
        e_stw       r3, INTC_IACKR_OFFSET@l(r2) #
        se_li       r3, PRI_0                   #< lower threshold to lowest
        e_stw       r3, INTC_CPR_OFFSET@l(r2)   #  priority (unmask everything)
        se_blr
.function   "intc_init", intc_init, .-intc_init
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