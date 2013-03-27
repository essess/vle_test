# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
            .include    "core\siu_regs.i"
            .ifndef     _LED_PRV_I_
_LED_PRV_I_ .equ        1
# -----------------------------------------------------------------------------

LED0_PCR    .equ        SIU_PCR188
LED0_GPDO   .equ        SIU_GPDO188

LED1_PCR    .equ        SIU_PCR189
LED1_GPDO   .equ        SIU_GPDO189

LED2_PCR    .equ        SIU_PCR190
LED2_GPDO   .equ        SIU_GPDO190

LED3_PCR    .equ        SIU_PCR191
LED3_GPDO   .equ        SIU_GPDO191

LED_OFF     .equ        PDO_VOH
LED_ON      .equ        PDO_VOL

# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------