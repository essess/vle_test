# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------

# BASE: interrupt controller --------------------------------------------------
INTC_BASE           .equ    $fff48000

# MCR : module configuration register -----------------------------------------
                                            ;
;SSR                 .equ    %1<<31          ;< software system reset
;SER                 .equ    %1<<30          ;< software external reset
;CRE                 .equ    %1<<15          ;< checkstop reset enable

INTC_MCR_OFFSET     .equ    $0000
INTC_MCR            .equ    INTC_BASE+INTC_MCR_OFFSET

# CPR: current priority register ----------------------------------------------
                                            ;  pin assignment
;PA_PRIM             .equ    %0001 << 10     ;< primary function
;PA_ALT              .equ    %0010 << 10     ;< alternate function
;PA_ALT2             .equ    %0100 << 10     ;< alternate function 2
;PA_ALT3             .equ    %1000 << 10     ;< alternate function 3
;PA_GPIO             .equ    %0000 << 10     ;< gpio

INTC_CPR_OFFSET     .equ    $0008
INTC_CPR            .equ    INTC_BASE+INTC_CPR_OFFSET

; IACKR: interrupt acknowledge register ---------------------------------------
                                            ;  pin data out
;PDO_VOH             .equ    %1 << 0         ;< voh is driven onto external pin
;PDO_VOL             .equ    %0 << 0         ;< vol is driven onto external pin
;PDO_MASK            .equ    %1 << 0

INTC_IACKR_OFFSET   .equ    $0010
INTC_IACKR          .equ    INTC_BASE+INTC_IACKR_OFFSET

; EOIR: end of interrupt register ---------------------------------------------

INTC_EOIR_OFFSET    .equ    $0018
INTC_EOIR           .equ    INTC_BASE+INTC_EOIR_OFFSET

; SSCIR: software set/clear interrupt register --------------------------------
; PSR: priority select register -----------------------------------------------

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