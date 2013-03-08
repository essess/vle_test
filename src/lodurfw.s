# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "swt.i"
# -----------------------------------------------------------------------------
#   @public
#   VLE entry point for the device side firmware of the lodur app:
#       https://bitbucket.org/essess/lodur
# -----------------------------------------------------------------------------
# note 0: TCR[WRC] can only be cleared by a reset. The BAM has turned it on for
#         us, so the best we can do at this point is to simply put the trip
#         point so far out in time that it won't trigger itself.
# -----------------------------------------------------------------------------
        .section    .init_vle, text_vle
        .public     lodurfw
        .type       lodurfw, @function
lodurfw: 
        e_lis       r1, (MAP0_ENAB|MAP1_ENAB|MAP2_ENAB)@h
        e_lis       r2, SWT_BASE@ha
        e_stw       r1, SWT_CR@l(r2)        ;< disable swt, but
        se_li       r1, 0                   ;< kill booke wdt as best we can,
        mttcr       r1                      ;  see note 0
@loop:  se_b        @loop
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