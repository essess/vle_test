# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
             .include    "reg.i"
             .ifndef     _SIU_REGS_I_
_SIU_REGS_I_ .equ        1
# -----------------------------------------------------------------------------
reg_base    SIU, $c3f90000          #< system integration unit
# -----------------------------------------------------------------------------
                                    #
SSR         .equ    %1<<31          #< software system reset
SER         .equ    %1<<30          #< software external reset
CRE         .equ    %1<<15          #< checkstop reset enable

reg         SIU, SRCR, $0010        #< system reset control register
# -----------------------------------------------------------------------------
                                    #  pin assignment
PA_PRIM     .equ    %0001 << 10     #< primary function
PA_ALT      .equ    %0010 << 10     #< alternate function
PA_ALT2     .equ    %0100 << 10     #< alternate function 2
PA_ALT3     .equ    %1000 << 10     #< alternate function 3
PA_GPIO     .equ    %0000 << 10     #< gpio
                                    #  output buffer enable
OBE_DIS     .equ    %0 << 9         #< disable output buffer for pad
OBE_ENAB    .equ    %1 << 9         #< enable output buffer for pad
                                    #  input buffer enable
IBE_DIS     .equ    %0 << 8         #< disable input buffer for pad
IBE_ENAB    .equ    %1 << 8         #< enable input buffer for pad
                                    #  drive strength control
DSC_10PF    .equ    %00 << 6        #< 10pf drive strength (weakest)
DSC_20PF    .equ    %01 << 6        #< 20pf drive strength
DSC_30PF    .equ    %10 << 6        #< 30pf drive strength
DSC_50PF    .equ    %11 << 6        #< 50pf drive strength (strongest)
                                    #  open drain output enable
ODE_DIS     .equ    %0 << 5         #< disable (push/pull driver enabled)
ODE_ENAB    .equ    %1 << 5         #< enable open drain for the pad
                                    #  input hysteresis
HYS_DIS     .equ    %0 << 4         #< disable hysteresis for the pad
HYS_ENAB    .equ    %1 << 4         #< enable hysteresis for the pad
                                    #  slew rate control
SRC_MIN     .equ    %00 << 2        #< minimum slew rate
SRC_MED     .equ    %01 << 2        #< medium slew rate
SRC_MAX     .equ    %11 << 2        #< maximum slew rate
                                    #  weak pullup/pulldown enable
WPE_DIS     .equ    %0 << 1         #< disable weak pull device for pad
WPE_ENAB    .equ    %1 << 1         #< enable weak pull device for pad
                                    #  weak pullup/pulldown select
WPS_PDOWN   .equ    %0 << 0         #< pulldown is enabled for the pad
WPS_PUP     .equ    %1 << 0         #< pullup is enabled for the pad

reg         SIU, PCR188, $01b8      #< pad configuration register
reg         SIU, PCR189, $01ba
reg         SIU, PCR190, $01bc
reg         SIU, PCR191, $01be
# -----------------------------------------------------------------------------
                                    #  pin data out
PDO_VOH     .equ    %1 << 0         #< voh is driven onto external pin
PDO_VOL     .equ    %0 << 0         #< vol is driven onto external pin
PDO_MASK    .equ    %1 << 0

reg         SIU, GPDO188, $06bc     #< GPIO pin data out register
reg         SIU, GPDO189, $06bd
reg         SIU, GPDO190, $06be
reg         SIU, GPDO191, $06bf
# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------