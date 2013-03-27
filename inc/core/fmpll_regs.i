# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
               .include    "reg.i"
               .ifndef     _FMPLL_REGS_I_
_FMPLL_REGS_I_ .equ        1
# -----------------------------------------------------------------------------
reg_base    FMPLL, $c3f80000        #< fm pll
# -----------------------------------------------------------------------------
reg         FMPLL, SYNCR, $0000     #< synthesizer control register
# -----------------------------------------------------------------------------
reg         FMPLL, SYNSR, $0004     #< synthesizer status register
# -----------------------------------------------------------------------------
                                        #  enhanced mode enable
EMODE           .equ    %1 << 31        #< enhanced mode
LEGMODE         .equ    %0 << 31        #< legacy mode
                                        #  clock configuration
CLKCFG_BERPO    .equ    %000 << 28      #< byp mode w/ext ref & pll off
CLKCFG_BXRPO    .equ    %001 << 28      #< byp mode w/xtal ref & pll off
CLKCFG_BERPR    .equ    %010 << 28      #< byp mode w/ext ref & pll running
CLKCFG_BXRPR    .equ    %011 << 28      #< byp mode w/xtal ref & pll running
CLKCFG_NER      .equ    %110 << 28      #< normal mode w/ext ref
CLKCFG_NXR      .equ    %111 << 28      #< normal mode w/xtal ref
                                        #  enhanced predivider
EPREDIV_LSHIFT  .equ    16              #< use like: ($f << EPREDIV_LSHIFT)
                                        #  enhanced mult factor divider
EMFD_LSHIFT     .equ    0               #< use like: ($f << EMFD_LSHIFT)

reg         FMPLL, ESYNCR1, $0008   #< synthesizer control register
# -----------------------------------------------------------------------------
                                    #  loss-of-clock enable
LOCEN       .equ    %1 << 23        #< loc enabled
LOCDIS      .equ    %0 << 23        #< loc disabled
                                    #  loss-of-lock reset enable
LOLRE       .equ    %1 << 22        #< assert reset on lol
LOLRDIS     .equ    %0 << 22        #< ignore lol
                                    #  loss-of-clock reset enable
LOCRE       .equ    %1 << 21        #< assert reset on loc
LOCRDIS     .equ    %0 << 21        #< ignore loc
                                    #  loss-of-lock int request
LOLIRQ      .equ    %1 << 20        #< enb irq req upon loc
LOLIRQDIS   .equ    %0 << 20        #< ignore lol
                                    #  loss-of-clock int request
LOCIRQ      .equ    %1 << 19        #< enb irq req upon loc
LOCIRQDIS   .equ    %0 << 19        #< ignore loc
                                    #  enhanced reduced frq div
ERFD_DIV2   .equ    %00 << 0        #< div 2
ERFD_DIV4   .equ    %01 << 0        #< div 4
ERFD_DIV8   .equ    %10 << 0        #< div 8
ERFD_DIV16  .equ    %11 << 0        #< div 16

reg         FMPLL, ESYNCR2, $000c   #< synthesizer control register 1
# -----------------------------------------------------------------------------
reg         FMPLL, ESYNCR2, $000c   #< synthesizer control register 2
# -----------------------------------------------------------------------------
reg         FMPLL, SYNFMMR, $0018   #< synthesizer FM modulation register
# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------