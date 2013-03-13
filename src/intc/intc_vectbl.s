# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
        .include    "intc.i"
# -----------------------------------------------------------------------------
        .section    .debug
        .file       "intc_vectbl.s"
        .type       intc_vectbl, @object
        .type       vec_default, @function
# -----------------------------------------------------------------------------
#   @public
#   vector address table for all external interrupts
# -----------------------------------------------------------------------------
        .section    .vectbl, data
        .public     intc_vectbl
intc_vectbl:
        vector      0    ;< 
        vector      1    ;< 
        vector      2    ;< 
        vector      3    ;< 
        vector      4    ;< 
        vector      5    ;< 
        vector      6    ;< 
        vector      7    ;< 
        vector      8    ;< 
        vector      9    ;< 
        vector      10   ;< 
        vector      11   ;< 
        vector      12   ;< 
        vector      13   ;< 
        vector      14   ;< 
        vector      15   ;< 
        vector      16   ;< 
        vector      17   ;< 
        vector      18   ;< 
        vector      19   ;< 
        vector      20   ;< 
        vector      21   ;< 
        vector      22   ;< 
        vector      23   ;< 
        vector      24   ;< 
        vector      25   ;< 
        vector      26   ;< 
        vector      27   ;< 
        vector      28   ;< 
        vector      29   ;< 
        vector      30   ;< 
        vector      31   ;< 
        vector      32   ;< 
        vector      33   ;< 
        vector      34   ;< 
        vector      35   ;< 
        vector      36   ;< 
        vector      37   ;< 
        vector      38   ;< 
        vector      39   ;< 
        vector      40   ;< 
        vector      41   ;< 
        vector      42   ;< 
        vector      43   ;< 
        vector      44   ;< 
        vector      45   ;< 
        vector      46   ;< 
        vector      47   ;< 
        vector      48   ;< 
        vector      49   ;< 
        vector      50   ;< 
        vector      51   ;< 
        vector      52   ;< 
        vector      53   ;< 
        vector      54   ;< 
        vector      55   ;< 
        vector      56   ;< 
        vector      57   ;< 
        vector      58   ;< 
        vector      59   ;< 
        vector      60   ;< 
        vector      61   ;< 
        vector      62   ;< 
        vector      63   ;< 
        vector      64   ;< 
        vector      65   ;< 
        vector      66   ;< 
        vector      67   ;< 
        vector      68   ;< 
        vector      69   ;< 
        vector      70   ;< 
        vector      71   ;< 
        vector      72   ;< 
        vector      73   ;< 
        vector      74   ;< 
        vector      75   ;< 
        vector      76   ;< 
        vector      77   ;< 
        vector      78   ;< 
        vector      79   ;< 
        vector      80   ;< 
        vector      81   ;< 
        vector      82   ;< 
        vector      83   ;< 
        vector      84   ;< 
        vector      85   ;< 
        vector      86   ;< 
        vector      87   ;< 
        vector      88   ;< 
        vector      89   ;< 
        vector      90   ;< 
        vector      91   ;< 
        vector      92   ;< 
        vector      93   ;< 
        vector      94   ;< 
        vector      95   ;< 
        vector      96   ;< 
        vector      97   ;< 
        vector      98   ;< 
        vector      99   ;< 
        vector      100  ;< 
        vector      101  ;< 
        vector      102  ;< 
        vector      103  ;< 
        vector      104  ;< 
        vector      105  ;< 
        vector      106  ;< 
        vector      107  ;< 
        vector      108  ;< 
        vector      109  ;< 
        vector      110  ;< 
        vector      111  ;< 
        vector      112  ;< 
        vector      113  ;< 
        vector      114  ;< 
        vector      115  ;< 
        vector      116  ;< 
        vector      117  ;< 
        vector      118  ;< 
        vector      119  ;< 
        vector      120  ;< 
        vector      121  ;< 
        vector      122  ;< 
        vector      123  ;< 
        vector      124  ;< 
        vector      125  ;< 
        vector      126  ;< 
        vector      127  ;< 
        vector      128  ;< 
        vector      129  ;< 
        vector      130  ;< 
        vector      131  ;< 
        vector      132  ;< 
        vector      133  ;< 
        vector      134  ;< 
        vector      135  ;< 
        vector      136  ;< 
        vector      137  ;< 
        vector      138  ;< 
        vector      139  ;< 
        vector      140  ;< 
        vector      141  ;< 
        vector      142  ;< 
        vector      143  ;< 
        vector      144  ;< 
        vector      145  ;< 
        vector      146  ;< 
        vector      147  ;< 
        vector      148  ;< 
        vector      149  ;< 
        vector      150  ;< 
        vector      151  ;< 
        vector      152  ;< 
        vector      153  ;< 
        vector      154  ;< 
        vector      155  ;< 
        vector      156  ;< 
        vector      157  ;< 
        vector      158  ;< 
        vector      159  ;< 
        vector      160  ;< 
        vector      161  ;< 
        vector      162  ;< 
        vector      163  ;< 
        vector      164  ;< 
        vector      165  ;< 
        vector      166  ;< 
        vector      167  ;< 
        vector      168  ;< 
        vector      169  ;< 
        vector      170  ;< 
        vector      171  ;< 
        vector      172  ;< 
        vector      173  ;< 
        vector      174  ;< 
        vector      175  ;< 
        vector      176  ;< 
        vector      177  ;< 
        vector      178  ;< 
        vector      179  ;< 
        vector      180  ;< 
        vector      181  ;< 
        vector      182  ;< 
        vector      183  ;< 
        vector      184  ;< 
        vector      185  ;< 
        vector      186  ;< 
        vector      187  ;< 
        vector      188  ;< 
        vector      189  ;< 
        vector      190  ;< 
        vector      191  ;< 
        vector      192  ;< 
        vector      193  ;< 
        vector      194  ;< 
        vector      195  ;< 
        vector      196  ;< 
        vector      197  ;< 
        vector      198  ;< 
        vector      199  ;< 
        vector      200  ;< 
        vector      201  ;< 
        vector      202  ;< 
        vector      203  ;< 
        vector      204  ;< 
        vector      205  ;< 
        vector      206  ;< 
        vector      207  ;< 
        vector      208  ;< 
        vector      209  ;< 
        vector      210  ;< 
        vector      211  ;< 
        vector      212  ;< 
        vector      213  ;< 
        vector      214  ;< 
        vector      215  ;< 
        vector      216  ;< 
        vector      217  ;< 
        vector      218  ;< 
        vector      219  ;< 
        vector      220  ;< 
        vector      221  ;< 
        vector      222  ;< 
        vector      223  ;< 
        vector      224  ;< 
        vector      225  ;< 
        vector      226  ;< 
        vector      227  ;< 
        vector      228  ;< 
        vector      229  ;< 
        vector      230  ;< 
        vector      231  ;< 
        vector      232  ;< 
        vector      233  ;< 
        vector      234  ;< 
        vector      235  ;< 
        vector      236  ;< 
        vector      237  ;< 
        vector      238  ;< 
        vector      239  ;< 
        vector      240  ;< 
        vector      241  ;< 
        vector      242  ;< 
        vector      243  ;< 
        vector      244  ;< 
        vector      245  ;< 
        vector      246  ;< 
        vector      247  ;< 
        vector      248  ;< 
        vector      249  ;< 
        vector      250  ;< 
        vector      251  ;< 
        vector      252  ;< 
        vector      253  ;< 
        vector      254  ;< 
        vector      255  ;< 
        vector      256  ;< 
        vector      257  ;< 
        vector      258  ;< 
        vector      259  ;< 
        vector      260  ;< 
        vector      261  ;< 
        vector      262  ;< 
        vector      263  ;< 
        vector      264  ;< 
        vector      265  ;< 
        vector      266  ;< 
        vector      267  ;< 
        vector      268  ;< 
        vector      269  ;< 
        vector      270  ;< 
        vector      271  ;< 
        vector      272  ;< 
        vector      273  ;< 
        vector      274  ;< 
        vector      275  ;< 
        vector      276  ;< 
        vector      277  ;< 
        vector      278  ;< 
        vector      279  ;< 
        vector      280  ;< 
        vector      281  ;< 
        vector      282  ;< 
        vector      283  ;< 
        vector      284  ;< 
        vector      285  ;< 
        vector      286  ;< 
        vector      287  ;< 
        vector      288  ;< 
        vector      289  ;< 
        vector      290  ;< 
        vector      291  ;< 
        vector      292  ;< 
        vector      293  ;< 
        vector      294  ;< 
        vector      295  ;< 
        vector      296  ;< 
        vector      297  ;< 
        vector      298  ;< 
        vector      299  ;< 
        vector      300  ;< 
        vector      301  ;< 
        vector      302  ;< 
        vector      303  ;< 
        vector      304  ;< 
        vector      305  ;< 
        vector      306  ;< 
        vector      307  ;< 
        vector      308  ;< 
        vector      309  ;< 
        vector      310  ;< 
        vector      311  ;< 
        vector      312  ;< 
        vector      313  ;< 
        vector      314  ;< 
        vector      315  ;< 
        vector      316  ;< 
        vector      317  ;< 
        vector      318  ;< 
        vector      319  ;< 
        vector      320  ;< 
        vector      321  ;< 
        vector      322  ;< 
        vector      323  ;< 
        vector      324  ;< 
        vector      325  ;< 
        vector      326  ;< 
        vector      327  ;< 
        vector      328  ;< 
        vector      329  ;< 
        vector      330  ;< 
        vector      331  ;< 
        vector      332  ;< 
        vector      333  ;< 
        vector      334  ;< 
        vector      335  ;< 
        vector      336  ;< 
        vector      337  ;< 
        vector      338  ;< 
        vector      339  ;< 
        vector      340  ;< 
        vector      341  ;< 
        vector      342  ;< 
        vector      343  ;< 
        vector      344  ;< 
        vector      345  ;< 
        vector      346  ;< 
        vector      347  ;< 
        vector      348  ;< 
        vector      349  ;< 
        vector      350  ;< 
        vector      351  ;< 
        vector      352  ;< 
        vector      353  ;< 
        vector      354  ;< 
        vector      355  ;< 
        vector      356  ;< 
        vector      357  ;< 
        vector      358  ;< 
        vector      359  ;< 
        vector      360  ;< 
        vector      361  ;< 
        vector      362  ;<

# -----------------------------------------------------------------------------
#   @public
#   default vector handler for above table
# -----------------------------------------------------------------------------
        .section    .text_vle
        .public     vec_default
        .weak       vec_default
vec_default:
        trap
        se_blr
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