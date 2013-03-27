# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com> see 'license.txt' for terms
# -----------------------------------------------------------------------------
            .ifndef     _REG_I_
_REG_I_     .equ        1
# -----------------------------------------------------------------------------
#   creates a simple base equate in the form of: <scope>_BASE
#   for ex:
#       reg_base    INTC, $fff48000
#   expands to:
#       INTC_BASE   .equ    $fff48000
# -----------------------------------------------------------------------------
reg_base:   .macro  scope, addr
scope&&_BASE                .equ    addr
.endm

# -----------------------------------------------------------------------------
#   creates a simple base equate in the form of:
#       <scope>_<name>_OFFSET
#       <scope>_<name>
#   for ex:
#       reg         INTC, MSR, $0000
#   expands to:
#       INTC_MCR_OFFSET     .equ    $0000
#       INTC_MCR            .equ    INTC_BASE+INTC_MCR_OFFSET
#
#   which means that you need to define a base for this to be useful
#
# -----------------------------------------------------------------------------
reg:        .macro  scope, name, offset
scope&&_&&name&&_OFFSET     .equ    offset
scope&&_&&name&&            .equ    scope&&_BASE + scope&&_&&name&&_OFFSET
.endm
# -----------------------------------------------------------------------------
            .endif
# -----------------------------------------------------------------------------