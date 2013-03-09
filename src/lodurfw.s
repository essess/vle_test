# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "swt.i"
        .include    "siu.i"
        .include    "fmpll.i"

        .extern     main
        .extern     _ecc_init_wordsize      ;< linker defined, see .lcf
        .extern     _ecc_init_end           ;<

INTDIS_ANDMASK      .equ        ~( %1<<17 | %1<<15 | %1<<12 |%1<<9 )

EPREDIV             .equ        ( 1-1 << EPREDIV_LSHIFT)  ;< 8MHz/1 * 40 =
EMFD                .equ        ( 40 << EMFD_LSHIFT )     ;< vco = 320 MHz
ESYNCR1_VAL         .equ        ( EMODE | CLKCFG_NXR | EPREDIV | EMFD )

ESYNCR2_VAL         .equ        ( LOCDIS | LOLRDIS | LOCRDIS | LOLIRQDIS | \
                                  LOCIRQDIS |ERFD_DIV4 )  ; vco/4 = 80 MHz clk

FMPLL_TO            .equ        300                       ; ~160 loops typ.

# -----------------------------------------------------------------------------
#   @public
#   VLE entry point for the device side firmware of the lodur app:
#       https://bitbucket.org/essess/lodur
# -----------------------------------------------------------------------------
        .section    .init_vle, text_vle
        .public     lodurfw
        .type       lodurfw, @function
lodurfw:
        e_lis       r1, (MAP0_ENAB|MAP1_ENAB|MAP2_ENAB)@h
        e_lis       r2, SWT_BASE@ha
        e_stw       r1, SWT_CR@l(r2)        ;< disable swt
        se_li       r1, 0                   ;< kill booke wdt as best we can,
        mttcr       r1                      ;  see note 0
        mfhid0      r1                      ;< r-m-w, branch prediction enb
        se_bclri    r1, 6                   ;  for both directions
        se_bclri    r1, 7
        mthid0      r1
        e_li        r1, ( %1<<0 | %1<<9 )   ;< enb and flush btb
        mtspr       1013, r1                ;< see note 1
        mfmsr       r1                      ;< r-m-w, turn on SPE apu
        se_bseti    r1, 6                   ;< see note 2
        mtmsr       r1
        e_lis       r2, FMPLL_BASE@ha       ;< loadup fmpll defaults
        e_lis       r1, ESYNCR1_VAL@h
        e_or2i      r1, ESYNCR1_VAL@l
        se_stw      r1, FMPLL_ESYNCR1@l(r2)
        e_lis       r1, ESYNCR2_VAL@h
        e_or2i      r1, ESYNCR2_VAL@l
        se_stw      r1, FMPLL_ESYNCR2@l(r2)
        e_li        r1, FMPLL_TO            ;< wait for lock or timeout
        mtctr       r1
@wait:  se_lwz      r1, FMPLL_SYNSR@l(r2)
        se_btsti    r1, 28                  ;< SYNSR[LOCK]
        se_bne+     @ecc                    ;< locked, move on
        e_bdnz      @wait
        trap                                ;< lock fail, trap to dbg if present
@ecc:   e_lis       r1, _ecc_init_wordsize@h
        e_or2i      r1, _ecc_init_wordsize@l
        mtctr       r1                      ;< loadup WORD size count
        e_lis       r2, _ecc_init_end@h     ;< loadup starting address
        e_or2i      r2, _ecc_init_end@l     ;
        se_mr       rsp, r2                 ;< do a convienient load of tos
        se_li       r3, 0                   ;< wipe as 0 to clear .bss as
@next:  e_stwu      r3, -4(r2)              ;  nifty side effect
        e_bdnz      @next
        se_bl       main                    ;< run app
        mfmsr       r1                      ;< mask ALL int sources:
        e_lis       r2, INTDIS_ANDMASK@h    ;  CE, EE, ME, DE
        e_or2i      r2, INTDIS_ANDMASK@l
        se_and      r1, r2
        mtmsr       r1
        e_lis       r1, SSR@h
        e_lis       r2, SIU_SRCR@ha
        se_stw      r1, SIU_SRCR@l(r2)      ;< bye
        wait
        se_blr
# -----------------------------------------------------------------------------
# note 0: TCR[WRC] can only be cleared by a reset. The BAM has turned it on for
#         us, so the best we can do at this point is to simply put the trip
#         point so far out in time that it won't trigger itself.
# -----------------------------------------------------------------------------
# note 1: turns out that mwerks generates the wrong code for the mtbucsr
#         instruction; mtspr 1008, Rn. It should be spr 1013 so it's done
#         manually here. Also note that HID0 is 1008, and that was implied
#         immediately before in the last mtxxx instruction. I think that the
#         assembler has no idea what the bucsr register is and silently uses
#         the last spr value (state) from the previous mthid0 register (in
#         which it does know as 1008)
# -----------------------------------------------------------------------------
# note 2: sometimes(!) this instruction generates as se_bseti r1, 3
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