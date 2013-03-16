# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "core\intc.i"
# -----------------------------------------------------------------------------
#   @public
#   Vector address table for all external interrupts. See the RM
#   for which is which. The reserved values are marked here though.
#   Load vectors at runtime with intc_reg_handler
# -----------------------------------------------------------------------------
        .section    .vectbl, data
        .public     intc_vectbl
intc_vectbl:
        vector      0    #< 
        vector      1    #< 
        vector      2    #< 
        vector      3    #< 
        vector      4    #< 
        vector      5    #< 
        vector      6    #< 
        vector      7    #< 
        vector      8    #< 
        vector      9    #< 
        vector      10   #< 
        vector      11   #< 
        vector      12   #< 
        vector      13   #< 
        vector      14   #< 
        vector      15   #< 
        vector      16   #< 
        vector      17   #< 
        vector      18   #< 
        vector      19   #< 
        vector      20   #< 
        vector      21   #< 
        vector      22   #< 
        vector      23   #< 
        vector      24   #< 
        vector      25   #< 
        vector      26   #< 
        vector      27   #< 
        vector      28   #< 
        vector      29   #< 
        vector      30   #< 
        vector      31   #< 
        vector      32   #< 
        vector      33   #< 
        vector      34   #< 
        vector      35   #< 
        vector      36   #< 
        vector      37   #< 
        vector      38   #< 
        vector      39   #< 
        vector      40   #< 
        vector      41   #< 
        vector      42   #< 
        vector      43   #< 
        vector      44   #< 
        vector      45   #< 
        vector      46   #< 
        vector      47   #< 
        vector      48   #< 
        vector      49   #< 
        vector      50   #< 
        vector      51   #< 
        vector      52   #< 
        vector      53   #< 
        vector      54   #< 
        vector      55   #< 
        vector      56   #< 
        vector      57   #< 
        vector      58   #< 
        vector      59   #< 
        vector      60   #< 
        vector      61   #< 
        vector      62   #< 
        vector      63   #< 
        vector      64   #< 
        vector      65   #< 
        vector      66   #< 
        vector      67   #< 
        vector      68   #< 
        vector      69   #< 
        vector      70   #< 
        vector      71   #< 
        vector      72   #< 
        vector      73   #< 
        vector      74   #< 
        vector      75   #< 
        vector      76   #< 
        vector      77   #< 
        vector      78   #< 
        vector      79   #< 
        vector      80   #< 
        vector      81   #< 
        vector      82   #< 
        vector      83   #< 
        vector      84   #< 
        vector      85   #< 
        vector      86   #< 
        vector      87   #< 
        vector      88   #< 
        vector      89   #< 
        vector      90   #< 
        vector      91   #< 
        vector      92   #< 
        vector      93   #< 
        vector      94   #< 
        vector      95   #< 
        vector      96   #< 
        vector      97   #< 
        vector      98   #< 
        vector      99   #< 
        vector      100  #< 
        vector      101  #< 
        vector      102  #< 
        vector      103  #< 
        vector      104  #< 
        vector      105  #< 
        vector      106  #< 
        vector      107  #< 
        vector      108  #< 
        vector      109  #< 
        vector      110  #< 
        vector      111  #< 
        vector      112  #< 
        vector      113  #< 
        vector      114  #< 
        vector      115  #< 
        vector      116  #< 
        vector      117  #< 
        vector      118  #< 
        vector      119  #< 
        vector      120  #< 
        vector      121  #< 
        vector      122  #< 
        vector      123  #< 
        vector      124  #< 
        vector      125  #< 
        vector      126  #< 
        vector      127  #< 
        vector      128  #< 
        vector      129  #< 
        vector      130  #< 
        vector      131  #< 
        vector      132  #< 
        vector      133  #< 
        vector      134  #< 
        vector      135  #< 
        vector      136  #< 
        vector      137  #< 
        vector      138  #< 
        vector      139  #< 
        vector      140  #< 
        vector      141  #< reserved
        vector      142  #< reserved
        vector      143  #< reserved
        vector      144  #< reserved
        vector      145  #< reserved
        vector      146  #< 
        vector      147  #< reserved
        vector      148  #< reserved
        vector      149  #< 
        vector      150  #< reserved
        vector      151  #< reserved
        vector      152  #< 
        vector      153  #< 
        vector      154  #< 
        vector      155  #< 
        vector      156  #< 
        vector      157  #< 
        vector      158  #< 
        vector      159  #< 
        vector      160  #< 
        vector      161  #< 
        vector      162  #< 
        vector      163  #< 
        vector      164  #< 
        vector      165  #< 
        vector      166  #< 
        vector      167  #< 
        vector      168  #< 
        vector      169  #< 
        vector      170  #< 
        vector      171  #< 
        vector      172  #< 
        vector      173  #< 
        vector      174  #< 
        vector      175  #< 
        vector      176  #< 
        vector      177  #< 
        vector      178  #< 
        vector      179  #< 
        vector      180  #< 
        vector      181  #< 
        vector      182  #< 
        vector      183  #< 
        vector      184  #< 
        vector      185  #< 
        vector      186  #< 
        vector      187  #< 
        vector      188  #< 
        vector      189  #< 
        vector      190  #< 
        vector      191  #< 
        vector      192  #< 
        vector      193  #< reserved
        vector      194  #< reserved
        vector      195  #< reserved
        vector      196  #< reserved
        vector      197  #< 
        vector      198  #< 
        vector      199  #< 
        vector      200  #< 
        vector      201  #< 
        vector      202  #< reserved
        vector      203  #< reserved
        vector      204  #< reserved
        vector      205  #< reserved
        vector      206  #< reserved
        vector      207  #< reserved
        vector      208  #< reserved
        vector      209  #< 
        vector      210  #< reserved
        vector      211  #< reserved
        vector      212  #< reserved
        vector      213  #< reserved
        vector      214  #< reserved
        vector      215  #< reserved
        vector      216  #< reserved
        vector      217  #< reserved
        vector      218  #< reserved
        vector      219  #< reserved
        vector      220  #< reserved
        vector      221  #< reserved
        vector      222  #< reserved
        vector      223  #< reserved
        vector      224  #< reserved
        vector      225  #< reserved
        vector      226  #< reserved
        vector      227  #< reserved
        vector      228  #< reserved
        vector      229  #< reserved
        vector      230  #< reserved
        vector      231  #< reserved
        vector      232  #< reserved
        vector      233  #< reserved
        vector      234  #< reserved
        vector      235  #< reserved
        vector      236  #< reserved
        vector      237  #< reserved
        vector      238  #< reserved
        vector      239  #< reserved
        vector      240  #< reserved
        vector      241  #< reserved
        vector      242  #< reserved
        vector      243  #< reserved
        vector      244  #< reserved
        vector      245  #< reserved
        vector      246  #< reserved
        vector      247  #< reserved
        vector      248  #< reserved
        vector      249  #< reserved
        vector      250  #< reserved
        vector      251  #< reserved
        vector      252  #< reserved
        vector      253  #< reserved
        vector      254  #< reserved
        vector      255  #< reserved
        vector      256  #< reserved
        vector      257  #< reserved
        vector      258  #< reserved
        vector      259  #< reserved
        vector      260  #< reserved
        vector      261  #< reserved
        vector      262  #< reserved
        vector      263  #< reserved
        vector      264  #< reserved
        vector      265  #< reserved
        vector      266  #< reserved
        vector      267  #< reserved
        vector      268  #< reserved
        vector      269  #< reserved
        vector      270  #< reserved
        vector      271  #< reserved
        vector      272  #< reserved
        vector      273  #< reserved
        vector      274  #< reserved
        vector      275  #< reserved
        vector      276  #< reserved
        vector      277  #< reserved
        vector      278  #< reserved
        vector      279  #< reserved
        vector      280  #< reserved
        vector      281  #< reserved
        vector      282  #< reserved
        vector      283  #< reserved
        vector      284  #< reserved
        vector      285  #< reserved
        vector      286  #< reserved
        vector      287  #< reserved
        vector      288  #< reserved
        vector      289  #< reserved
        vector      290  #< reserved
        vector      291  #< reserved
        vector      292  #< reserved
        vector      293  #< reserved
        vector      294  #< reserved
        vector      295  #< reserved
        vector      296  #< reserved
        vector      297  #< reserved
        vector      298  #< reserved
        vector      299  #< reserved
        vector      300  #< reserved
        vector      301  #< 
        vector      302  #< 
        vector      303  #< 
        vector      304  #< 
        vector      305  #< 
        vector      306  #< 
        vector      307  #< 
        vector      308  #< reserved
        vector      309  #< 
        vector      310  #< 
        vector      311  #< 
        vector      312  #< 
        vector      313  #< 
        vector      314  #< 
        vector      315  #< 
        vector      316  #< 
        vector      317  #< 
        vector      318  #< 
        vector      319  #< 
        vector      320  #< 
        vector      321  #< 
        vector      322  #< 
        vector      323  #< 
        vector      324  #< 
        vector      325  #< 
        vector      326  #< 
        vector      327  #< 
        vector      328  #< 
        vector      329  #< 
        vector      330  #< 
        vector      331  #< 
        vector      332  #< 
        vector      333  #< 
        vector      334  #< 
        vector      335  #< 
        vector      336  #< 
        vector      337  #< 
        vector      338  #< 
        vector      339  #< 
        vector      340  #< 
        vector      341  #< 
        vector      342  #< 
        vector      343  #< 
        vector      344  #< 
        vector      345  #< 
        vector      346  #< 
        vector      347  #< 
        vector      348  #< 
        vector      349  #< 
        vector      350  #< 
        vector      351  #< 
        vector      352  #< 
        vector      353  #< 
        vector      354  #< 
        vector      355  #< 
        vector      356  #< 
        vector      357  #< reserved
        vector      358  #< 
        vector      359  #< 
        vector      360  #< 
        vector      361  #< reserved
        vector      362  #< reserved
        vector      363  #< reserved

# -----------------------------------------------------------------------------
#   @public
#   default vector handler for above table
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     vec_default
        .weak       vec_default
vec_default:
        se_nop
        se_blr
.function   "vec_default", vec_default, .-vec_default
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