# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
                .include    "reg.i"
                .ifndef     _ESCI_REGS_I_
_ESCI_REGS_I_   .equ        1
# -----------------------------------------------------------------------------
reg_base    ESCIA, $fffb0000        #< enh serial comm intf A
reg_base    ESCIB, $fffb4000        #< enh serial comm intf B
# -----------------------------------------------------------------------------
                                        #  SCI baud rate control value
SBR_LSHIFT      .equ    16              #< use like: ($xx << SBR_LSHIFT)
                                        #  loop mode sel/rcv src control
MODE_DW         .equ    %000 << 13      #< dual wire mode
MODE_LOOP       .equ    %100 << 13      #< loop mode
MODE_SW         .equ    %101 << 13      #< single wire mode
                                        #  frame format mode
M_0             .equ    %0 << 12        #
M_1             .equ    %1 << 12        #
                                        #  receiver wake up condition
WAKE_IDLE       .equ    %0 << 11        #< idle line wake up
WAKE_ADDR       .equ    %1 << 11        #< address mark wake up
                                        #  idle line type
ILT_RLB         .equ    %0 << 10        #< idle det starts after recep low bit
ILT_LSB         .equ    %1 << 10        #< idle det starts after last stop bit
                                        #  parity enable
PE_ENB          .equ    %1 << 9         #< enable parity checking
PE_DIS          .equ    %0 << 9         #< disable parity checking
                                        #  parity type
PT_EVEN         .equ    %0 << 8         #< even parity
PT_ODD          .equ    %1 << 8         #< odd parity
                                        #  transmitter interrupt enable
TIE_ENB         .equ    %1 << 7         #< SCI_SR[TDRE] enabled
TIE_DIS         .equ    %0 << 7         #<              disabled
                                        #  transmission complete interrupt enb
TCIE_ENB        .equ    %1 << 6         #< SCI_SR[TC] enabled
TCIE_DIS        .equ    %0 << 6         #<            disabled
                                        #  receiver full interrupt enb
RIE_ENB         .equ    %1 << 5         #< SCI_SR[RDRF] enabled
RIE_DIS         .equ    %0 << 5         #<              disabled
                                        #  idle line interrupt enb
ILIE_ENB        .equ    %1 << 4         #< SCI_SR[IDLE] enabled
ILIE_DIS        .equ    %0 << 4         #<              disabled
                                        #  transmitter enable
TE_ENB          .equ    %1 << 3         #< enabled
TE_DIS          .equ    %0 << 3         #< disabled
                                        #  receiver enable
RE_ENB          .equ    %1 << 2         #< enabled
RE_DIS          .equ    %0 << 2         #< disabled
                                        #  receiver wake up mode
RWU_NORM        .equ    %0 << 1         #< normal receiver operation
RWU_WUM         .equ    %1 << 1         #< rcvr is in wake up mode
                                        #  send break character
SBK_NONE        .equ    %0 << 0         #< no break characters will be xmt'd
SBK_XMIT        .equ    %1 << 0         #< break characters will be xmt'd

ESCI_CR1_OFFSET .equ    $0000
reg     ESCIA, CR1, ESCI_CR1_OFFSET     #< control register 1
reg     ESCIB, CR1, ESCI_CR1_OFFSET
# -----------------------------------------------------------------------------
                                        #  module disable
MDIS_ENB        .equ    %0 << 15        #< enabled
MDIS_DIS        .equ    %1 << 15        #< disabled
                                        #  fast bit error detection (LIN mode)
FBR_STD         .equ    %0 << 14        #< standard
FBR_FAST        .equ    %1 << 14        #< fast
                                        #  bit err or phy bus err stop (LIN mode)
BSTP_TDGEN      .equ    %0 << 13        #< tx dma req regardless of err
BSTP_TDNGEN     .equ    %1 << 13        #< no tx dma req on err
                                        #  bit err int enable
IEBERR_DIS      .equ    %0 << 12        #< disabled
IEBERR_ENB      .equ    %1 << 12        #< enabled
                                        #  receive dma control
RXDMA_DIS       .equ    %0 << 11        #< disabled
RXDMA_ENB       .equ    %1 << 11        #< enabled
                                        #  transmit dma control
TXDMA_DIS       .equ    %0 << 10        #< disabled
TXDMA_ENB       .equ    %1 << 10        #< enabled
                                        #  break character length
BRK13_0         .equ    %0 << 9         #
BRK13_1         .equ    %1 << 9         #
                                        #  sci_tx pin output enable (sw mode)
TXDIR_OENB      .equ    %1 << 8         #< SCI_x_TX pin is used as output
TXDIR_ODIS      .equ    %0 << 8         #< not used as output
                                        #  fast bit err det smp pnt (LIN mode)
BESM13_RS9      .equ    %0 << 7         #< sample point is RS9
BESM13_RS13     .equ    %1 << 7         #< sample point is RS13
                                        #  bit err stop (LIN mode)
SBSTP_STOP      .equ    %1 << 6         #< tx stopped on bit err
SBSTP_CONT      .equ    %0 << 6         #< tx continues on bit err
                                        #  sci_rx pin polarity
RXPOL_NORM      .equ    %0 << 5         #< normal polarity
RXPOL_INV       .equ    %1 << 5         #< inverted polarity
                                        #  parity bit masking
PMSK_IBP        .equ    %0 << 4         #< rcvd parity bit in bit position
PMSK_0IBP       .equ    %1 << 4         #< zero in bit position
                                        #  overrun interrupt enable
ORIE_ENB        .equ    %1 << 3         #< SCI_SR[OR] enabled
ORIE_DIS        .equ    %0 << 3         #<            disabled
                                        #  noise interrupt enable
NFIE_ENB        .equ    %1 << 2         #< SCI_SR[NF] enabled
NFIE_DIS        .equ    %0 << 2         #<            disabled
                                        #  frame error interrupt enable
FEIE_ENB        .equ    %1 << 1         #< SCI_SR[FE] enabled
FEIE_DIS        .equ    %0 << 1         #<            disabled
                                        #  parity error interrupt enable
PFIE_ENB        .equ    %1 << 0         #< SCI_SR[PF] enabled
PFIE_DIS        .equ    %0 << 0         #<            disabled

ESCI_CR2_OFFSET .equ    $0004
reg     ESCIA, CR2, ESCI_CR2_OFFSET     #< control register 2
reg     ESCIB, CR2, ESCI_CR2_OFFSET
# -----------------------------------------------------------------------------
ESCI_DR_OFFSET  .equ    $0006
reg     ESCIA, DR, ESCI_DR_OFFSET       #< data register
reg     ESCIB, DR, ESCI_DR_OFFSET

ESCI_D_OFFSET   .equ    $0007
reg     ESCIA, D, ESCI_D_OFFSET         #< 8-bit byte data offset
reg     ESCIB, D, ESCI_D_OFFSET
# -----------------------------------------------------------------------------
                                        #
TDRE            .equ    %1 << 31        #< transmit data reg empty
TC              .equ    %1 << 30        #< transmit complete
RDRF            .equ    %1 << 29        #< rcv data reg full
IDLE            .equ    %1 << 28        #< idle line
OR              .equ    %1 << 27        #< overrun
NF              .equ    %1 << 26        #< noise flag
FE              .equ    %1 << 25        #< framing error
PF              .equ    %1 << 24        #< parity error
BERR            .equ    %1 << 20        #< bit error flag
TACT            .equ    %1 << 17        #< transmitter active
RAF             .equ    %1 << 16        #< receiver active
RXRDY           .equ    %1 << 15        #< receive data ready
TXRDY           .equ    %1 << 14        #< transmit data ready
LWAKE           .equ    %1 << 13        #< LIN wakeup received
STO             .equ    %1 << 12        #< slave timeout
PBERR           .equ    %1 << 11        #< physical bus error flag
CERR            .equ    %1 << 10        #< CRC error flag
CKERR           .equ    %1 << 9         #< checksum error flag
FRC             .equ    %1 << 8         #< frame complete flag
UREQ            .equ    %1 << 1         #< unrequested data received
OVFL            .equ    %1 << 0         #< overflow flag

ESCI_SR_OFFSET  .equ    $0008
reg     ESCIA, SR, ESCI_SR_OFFSET       #< status register
reg     ESCIB, SR, ESCI_SR_OFFSET
# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------