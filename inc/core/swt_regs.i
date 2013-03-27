# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
             .include    "reg.i"
             .ifndef     _SWT_REGS_I_
_SWT_REGS_I_ .equ        1
# -----------------------------------------------------------------------------
reg_base    SWT, $fff38000          #< software watchdog timer
# -----------------------------------------------------------------------------
                                    #  master access protection
MAP0_DIS    .equ    %0 << 31        #< core instruction access disabled
MAP0_ENAB   .equ    %1 << 31        #< enabled
MAP1_DIS    .equ    %0 << 30        #< nexus access disabled
MAP1_ENAB   .equ    %1 << 30        #< enabled
MAP2_DIS    .equ    %0 << 29        #< dma access disabled
MAP2_ENAB   .equ    %1 << 29        #< enabled
                                    #  keyed service mode
KEY_FSS     .equ    %0 << 9         #< fixed service sequence
KEY_KSM     .equ    %1 << 9         #< keyed service mode
                                    #  reset on invalid access
RIA_BERR    .equ    %0 << 8         #< gen bus err
RIA_RST     .equ    %1 << 8         #< gen system reset if WEN_ENAB
                                    #  window mode
WND_REG     .equ    %0 << 7         #< regular mode
WND_WM      .equ    %1 << 7         #< windowed mode
                                    #  interrupt then reset
ITR_RST     .equ    %0 << 6         #< gen reset on first to
ITR_2ND     .equ    %1 << 6         #< int first, reset second
                                    #  hard lock
HLK_DIS     .equ    %0 << 5         #< read/write
HLK_ENAB    .equ    %1 << 5         #< write only
                                    # soft lock
SLK_DIS     .equ    %0 << 4         #< read/write
SLK_ENAB    .equ    %1 << 4         #< write only
                                    #  clock selection
CSL_SYS     .equ    %0 << 3         #< system clock
CSL_OSC     .equ    %1 << 3         #< oscillator clock
                                    #  stop mode control
STP_RUN     .equ    %0 << 2         #< run in stop mode
STP_STOP    .equ    %1 << 2         #< stop in stop mode
                                    #  debug mode control
FRZ_RUN     .equ    %0 << 1         #< run in debug mode
FRZ_STOP    .equ    %1 << 1         #< stop in debug mode
                                    #  watchdog enabled
WEN_DIS     .equ    %0 << 0         #< swt is disabled
WEN_ENAB    .equ    %1 << 0         #< swt is enabled

reg         SWT, CR, $0000          #< control register
# -----------------------------------------------------------------------------
reg         SWT, IR, $0004          #< interrupt register
# -----------------------------------------------------------------------------
reg         SWT, TO, $0008          #< timeout register
# -----------------------------------------------------------------------------
reg         SWT, WN, $000c          #< window register
# -----------------------------------------------------------------------------
reg         SWT, SR, $0010          #< service register
# -----------------------------------------------------------------------------
reg         SWT, CO, $0014          #< counter output register
# -----------------------------------------------------------------------------
reg         SWT, SK, $0018          #< service key register
# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------