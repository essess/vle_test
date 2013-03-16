# -----------------------------------------------------------------------------
# Copyright (c) 2013, Sean Stasiak. All rights reserved.
# Developed by: Sean Stasiak <sstasiak@gmail.com>
# Refer to license terms at the bottom of this file
# -----------------------------------------------------------------------------
              .include    "reg.i"
              .ifndef     _INTC_REGS_I_
_INTC_REGS_I_ .equ        1
# -----------------------------------------------------------------------------
reg_base    INTC, $fff48000         #< interrupt controller
# -----------------------------------------------------------------------------
                                    #  hardware vector enable
HVEN        .equ    %1<<0           #< hardware vector mode
SVEN        .equ    %0<<0           #< software vector mode
                                    #  vector table entry size
VTES_8      .equ    %1<<5           #< 8 bytes per entry
VTES_4      .equ    %0<<5           #< 4 bytes per entry

reg         INTC, MCR, $0000        #< module configuration register
# -----------------------------------------------------------------------------
                                    #  priority
PRI_15      .equ    15<<0           #< highest
PRI_14      .equ    14<<0           #
PRI_13      .equ    13<<0           #
PRI_12      .equ    12<<0           #
PRI_11      .equ    11<<0           #
PRI_10      .equ    10<<0           #
PRI_9       .equ    9<<0            #
PRI_8       .equ    8<<0            #
PRI_7       .equ    7<<0            #
PRI_6       .equ    6<<0            #
PRI_5       .equ    5<<0            #
PRI_4       .equ    4<<0            #
PRI_3       .equ    3<<0            #
PRI_2       .equ    2<<0            #
PRI_1       .equ    1<<0            #
PRI_0       .equ    0<<0            #< lowest

reg         INTC, CPR, $0008        #< current priority register
# -----------------------------------------------------------------------------
reg         INTC, IACKR, $0010      #< interrupt acknowledge register
# -----------------------------------------------------------------------------
reg         INTC, EOIR, $0018       #< end of interrupt register
# -----------------------------------------------------------------------------
                                    #
SET         .equ    %1<<1           #< set flag
CLR         .equ    %1<<0           #< clr flag
IS_SET      .equ    CLR             #< rd of clr flag determines assert status

reg         INTC, SSCIR0_3, $0020  #< software set/clear interrupt register
reg         INTC, SSCIR3,   $0023
reg         INTC, SSCIR2,   $0022
reg         INTC, SSCIR1,   $0021
reg         INTC, SSCIR0,   $0020

reg         INTC, SSCIR4_7, $0024
reg         INTC, SSCIR7,   $0027
reg         INTC, SSCIR6,   $0026
reg         INTC, SSCIR5,   $0025
reg         INTC, SSCIR4,   $0024
# -----------------------------------------------------------------------------
reg         INTC, PSR0_3,   $0040   #< priority select register
reg         INTC, PSR3,     $0043
reg         INTC, PSR2,     $0042
reg         INTC, PSR1,     $0041
reg         INTC, PSR0,     $0040

reg         INTC, PSR4_7,   $0044
reg         INTC, PSR7,     $0047
reg         INTC, PSR6,     $0046
reg         INTC, PSR5,     $0045
reg         INTC, PSR4,     $0044

reg         INTC, PSR8_11,  $0048
reg         INTC, PSR11,    $004b
reg         INTC, PSR10,    $004a
reg         INTC, PSR9,     $0049
reg         INTC, PSR8,     $0048

reg         INTC, PSR12_15,  $004c
reg         INTC, PSR15,     $004f
reg         INTC, PSR14,     $004e
reg         INTC, PSR13,     $004d
reg         INTC, PSR12,     $004c

reg         INTC, PSR16_19,  $0050
reg         INTC, PSR19,     $0053
reg         INTC, PSR18,     $0052
reg         INTC, PSR17,     $0051
reg         INTC, PSR16,     $0050

reg         INTC, PSR20_23,  $0054
reg         INTC, PSR23,     $0057
reg         INTC, PSR22,     $0056
reg         INTC, PSR21,     $0055
reg         INTC, PSR20,     $0054

reg         INTC, PSR24_27,  $0058
reg         INTC, PSR27,     $005b
reg         INTC, PSR26,     $005a
reg         INTC, PSR25,     $0059
reg         INTC, PSR24,     $0058

reg         INTC, PSR28_31,  $005c
reg         INTC, PSR31,     $005f
reg         INTC, PSR30,     $005e
reg         INTC, PSR29,     $005d
reg         INTC, PSR28,     $005c

reg         INTC, PSR32_35,  $0060
reg         INTC, PSR35,     $0063
reg         INTC, PSR34,     $0062
reg         INTC, PSR33,     $0061
reg         INTC, PSR32,     $0060

reg         INTC, PSR36_39,  $0064
reg         INTC, PSR39,     $0067
reg         INTC, PSR38,     $0066
reg         INTC, PSR37,     $0065
reg         INTC, PSR36,     $0064

reg         INTC, PSR40_43,  $0068
reg         INTC, PSR43,     $006b
reg         INTC, PSR42,     $006a
reg         INTC, PSR41,     $0069
reg         INTC, PSR40,     $0068

reg         INTC, PSR44_47,  $006c
reg         INTC, PSR47,     $006f
reg         INTC, PSR46,     $006e
reg         INTC, PSR45,     $006d
reg         INTC, PSR44,     $006c

reg         INTC, PSR48_51,  $0070
reg         INTC, PSR51,     $0073
reg         INTC, PSR50,     $0072
reg         INTC, PSR49,     $0071
reg         INTC, PSR48,     $0070

reg         INTC, PSR52_55,  $0074
reg         INTC, PSR55,     $0077
reg         INTC, PSR54,     $0076
reg         INTC, PSR53,     $0075
reg         INTC, PSR52,     $0074

reg         INTC, PSR56_59,  $0078
reg         INTC, PSR59,     $007b
reg         INTC, PSR58,     $007a
reg         INTC, PSR57,     $0079
reg         INTC, PSR56,     $0078

reg         INTC, PSR60_63,  $007c
reg         INTC, PSR63,     $007f
reg         INTC, PSR62,     $007e
reg         INTC, PSR61,     $007d
reg         INTC, PSR60,     $007c

reg         INTC, PSR64_67,  $0080
reg         INTC, PSR67,     $0083
reg         INTC, PSR66,     $0082
reg         INTC, PSR65,     $0081
reg         INTC, PSR64,     $0080

reg         INTC, PSR68_71,  $0084
reg         INTC, PSR71,     $0087
reg         INTC, PSR70,     $0086
reg         INTC, PSR69,     $0085
reg         INTC, PSR68,     $0084

reg         INTC, PSR72_75,  $0088
reg         INTC, PSR75,     $008b
reg         INTC, PSR74,     $008a
reg         INTC, PSR73,     $0089
reg         INTC, PSR72,     $0088

reg         INTC, PSR76_79,  $008c
reg         INTC, PSR79,     $008f
reg         INTC, PSR78,     $008e
reg         INTC, PSR77,     $008d
reg         INTC, PSR76,     $008c

reg         INTC, PSR80_83,  $0090
reg         INTC, PSR83,     $0093
reg         INTC, PSR82,     $0092
reg         INTC, PSR81,     $0091
reg         INTC, PSR80,     $0090

reg         INTC, PSR84_87,  $0094
reg         INTC, PSR87,     $0097
reg         INTC, PSR86,     $0096
reg         INTC, PSR85,     $0095
reg         INTC, PSR84,     $0094

reg         INTC, PSR88_91,  $0098
reg         INTC, PSR91,     $009b
reg         INTC, PSR90,     $009a
reg         INTC, PSR89,     $0099
reg         INTC, PSR88,     $0098

reg         INTC, PSR92_95,  $009c
reg         INTC, PSR95,     $009f
reg         INTC, PSR94,     $009e
reg         INTC, PSR93,     $009d
reg         INTC, PSR92,     $009c

reg         INTC, PSR96_99,  $00a0
reg         INTC, PSR99,     $00a3
reg         INTC, PSR98,     $00a2
reg         INTC, PSR97,     $00a1
reg         INTC, PSR96,     $00a0

reg         INTC, PSR100_103, $00a4
reg         INTC, PSR103,     $00a7
reg         INTC, PSR102,     $00a6
reg         INTC, PSR101,     $00a5
reg         INTC, PSR100,     $00a4

reg         INTC, PSR104_107, $00a8
reg         INTC, PSR107,     $00ab
reg         INTC, PSR106,     $00aa
reg         INTC, PSR105,     $00a9
reg         INTC, PSR104,     $00a8

reg         INTC, PSR108_111, $00ac
reg         INTC, PSR111,     $00af
reg         INTC, PSR110,     $00ae
reg         INTC, PSR109,     $00ad
reg         INTC, PSR108,     $00ac

reg         INTC, PSR112_115, $00b0
reg         INTC, PSR115,     $00b3
reg         INTC, PSR114,     $00b2
reg         INTC, PSR113,     $00b1
reg         INTC, PSR112,     $00b0

reg         INTC, PSR116_119, $00b4
reg         INTC, PSR119,     $00b7
reg         INTC, PSR118,     $00b6
reg         INTC, PSR117,     $00b5
reg         INTC, PSR116,     $00b4

reg         INTC, PSR120_123, $00b8
reg         INTC, PSR123,     $00bb
reg         INTC, PSR122,     $00ba
reg         INTC, PSR121,     $00b9
reg         INTC, PSR120,     $00b8

reg         INTC, PSR124_127, $00bc
reg         INTC, PSR127,     $00bf
reg         INTC, PSR126,     $00be
reg         INTC, PSR125,     $00bd
reg         INTC, PSR124,     $00bc

reg         INTC, PSR128_131, $00c0
reg         INTC, PSR131,     $00c3
reg         INTC, PSR130,     $00c2
reg         INTC, PSR129,     $00c1
reg         INTC, PSR128,     $00c0

reg         INTC, PSR132_135, $00c4
reg         INTC, PSR135,     $00c7
reg         INTC, PSR134,     $00c6
reg         INTC, PSR133,     $00c5
reg         INTC, PSR132,     $00c4

reg         INTC, PSR136_139, $00c8
reg         INTC, PSR139,     $00cb
reg         INTC, PSR138,     $00ca
reg         INTC, PSR137,     $00c9
reg         INTC, PSR136,     $00c8

reg         INTC, PSR140_143, $00cc
reg         INTC, PSR143,     $00cf
reg         INTC, PSR142,     $00ce
reg         INTC, PSR141,     $00cd
reg         INTC, PSR140,     $00cc

reg         INTC, PSR144_147, $00d0
reg         INTC, PSR147,     $00d3
reg         INTC, PSR146,     $00d2
reg         INTC, PSR145,     $00d1
reg         INTC, PSR144,     $00d0

reg         INTC, PSR148_151, $00d4
reg         INTC, PSR151,     $00d7
reg         INTC, PSR150,     $00d6
reg         INTC, PSR149,     $00d5
reg         INTC, PSR148,     $00d4

reg         INTC, PSR152_155, $00d8
reg         INTC, PSR155,     $00db
reg         INTC, PSR154,     $00da
reg         INTC, PSR153,     $00d9
reg         INTC, PSR152,     $00d8

reg         INTC, PSR156_159, $00dc
reg         INTC, PSR159,     $00df
reg         INTC, PSR158,     $00de
reg         INTC, PSR157,     $00dd
reg         INTC, PSR156,     $00dc

reg         INTC, PSR160_163, $00e0
reg         INTC, PSR163,     $00e3
reg         INTC, PSR162,     $00e2
reg         INTC, PSR161,     $00e1
reg         INTC, PSR160,     $00e0

reg         INTC, PSR164_167, $00e4
reg         INTC, PSR167,     $00e7
reg         INTC, PSR166,     $00e6
reg         INTC, PSR165,     $00e5
reg         INTC, PSR164,     $00e4

reg         INTC, PSR168_171, $00e8
reg         INTC, PSR171,     $00eb
reg         INTC, PSR170,     $00ea
reg         INTC, PSR169,     $00e9
reg         INTC, PSR168,     $00e8

reg         INTC, PSR172_175, $00ec
reg         INTC, PSR175,     $00ef
reg         INTC, PSR174,     $00ee
reg         INTC, PSR173,     $00ed
reg         INTC, PSR172,     $00ec

reg         INTC, PSR176_179, $00f0
reg         INTC, PSR179,     $00f3
reg         INTC, PSR178,     $00f2
reg         INTC, PSR177,     $00f1
reg         INTC, PSR176,     $00f0

reg         INTC, PSR180_183, $00f4
reg         INTC, PSR183,     $00f7
reg         INTC, PSR182,     $00f6
reg         INTC, PSR181,     $00f5
reg         INTC, PSR180,     $00f4

reg         INTC, PSR184_187, $00f8
reg         INTC, PSR187,     $00fb
reg         INTC, PSR186,     $00fa
reg         INTC, PSR185,     $00f9
reg         INTC, PSR184,     $00f8

reg         INTC, PSR188_191, $00fc
reg         INTC, PSR191,     $00ff
reg         INTC, PSR190,     $00fe
reg         INTC, PSR189,     $00fd
reg         INTC, PSR188,     $00fc

reg         INTC, PSR192_195, $0100
reg         INTC, PSR195,     $0103
reg         INTC, PSR194,     $0102
reg         INTC, PSR193,     $0101
reg         INTC, PSR192,     $0100

reg         INTC, PSR196_199, $0104
reg         INTC, PSR199,     $0107
reg         INTC, PSR198,     $0106
reg         INTC, PSR197,     $0105
reg         INTC, PSR196,     $0104

reg         INTC, PSR200_203, $0108
reg         INTC, PSR203,     $010b
reg         INTC, PSR202,     $010a
reg         INTC, PSR201,     $0109
reg         INTC, PSR200,     $0108

reg         INTC, PSR204_207, $010c
reg         INTC, PSR207,     $010f
reg         INTC, PSR206,     $010e
reg         INTC, PSR205,     $010d
reg         INTC, PSR204,     $010c

reg         INTC, PSR208_211, $0110
reg         INTC, PSR211,     $0113
reg         INTC, PSR210,     $0112
reg         INTC, PSR209,     $0111
reg         INTC, PSR208,     $0110

reg         INTC, PSR212_215, $0114
reg         INTC, PSR215,     $0117
reg         INTC, PSR214,     $0116
reg         INTC, PSR213,     $0115
reg         INTC, PSR212,     $0114

reg         INTC, PSR216_219, $0118
reg         INTC, PSR219,     $011b
reg         INTC, PSR218,     $011a
reg         INTC, PSR217,     $0119
reg         INTC, PSR216,     $0118

reg         INTC, PSR220_223, $011c
reg         INTC, PSR223,     $011f
reg         INTC, PSR222,     $011e
reg         INTC, PSR221,     $011d
reg         INTC, PSR220,     $011c

reg         INTC, PSR224_227, $0120
reg         INTC, PSR227,     $0123
reg         INTC, PSR226,     $0122
reg         INTC, PSR225,     $0121
reg         INTC, PSR224,     $0120

reg         INTC, PSR228_231, $0124
reg         INTC, PSR231,     $0127
reg         INTC, PSR230,     $0126
reg         INTC, PSR229,     $0125
reg         INTC, PSR228,     $0124

reg         INTC, PSR232_235, $0128
reg         INTC, PSR235,     $012b
reg         INTC, PSR234,     $012a
reg         INTC, PSR233,     $0129
reg         INTC, PSR232,     $0128

reg         INTC, PSR236_239, $012c
reg         INTC, PSR239,     $012f
reg         INTC, PSR238,     $012e
reg         INTC, PSR237,     $012d
reg         INTC, PSR236,     $012c

reg         INTC, PSR240_243, $0130
reg         INTC, PSR243,     $0133
reg         INTC, PSR242,     $0132
reg         INTC, PSR241,     $0131
reg         INTC, PSR240,     $0130

reg         INTC, PSR244_247, $0134
reg         INTC, PSR247,     $0137
reg         INTC, PSR246,     $0136
reg         INTC, PSR245,     $0135
reg         INTC, PSR244,     $0134

reg         INTC, PSR248_251, $0138
reg         INTC, PSR251,     $013b
reg         INTC, PSR250,     $013a
reg         INTC, PSR249,     $0139
reg         INTC, PSR248,     $0138

reg         INTC, PSR252_255, $013c
reg         INTC, PSR255,     $013f
reg         INTC, PSR254,     $013e
reg         INTC, PSR253,     $013d
reg         INTC, PSR252,     $013c

reg         INTC, PSR256_259, $0140
reg         INTC, PSR259,     $0143
reg         INTC, PSR258,     $0142
reg         INTC, PSR257,     $0141
reg         INTC, PSR256,     $0140

reg         INTC, PSR260_263, $0144
reg         INTC, PSR263,     $0147
reg         INTC, PSR262,     $0146
reg         INTC, PSR261,     $0145
reg         INTC, PSR260,     $0144

reg         INTC, PSR264_267, $0148
reg         INTC, PSR267,     $014b
reg         INTC, PSR266,     $014a
reg         INTC, PSR265,     $0149
reg         INTC, PSR264,     $0148

reg         INTC, PSR268_271, $014c
reg         INTC, PSR271,     $014f
reg         INTC, PSR270,     $014e
reg         INTC, PSR269,     $014d
reg         INTC, PSR268,     $014c

reg         INTC, PSR272_275, $0150
reg         INTC, PSR275,     $0153
reg         INTC, PSR274,     $0152
reg         INTC, PSR273,     $0151
reg         INTC, PSR272,     $0150

reg         INTC, PSR276_279, $0154
reg         INTC, PSR279,     $0157
reg         INTC, PSR278,     $0156
reg         INTC, PSR277,     $0155
reg         INTC, PSR276,     $0154

reg         INTC, PSR280_283, $0158
reg         INTC, PSR283,     $015b
reg         INTC, PSR282,     $015a
reg         INTC, PSR281,     $0159
reg         INTC, PSR280,     $0158

reg         INTC, PSR284_287, $015c
reg         INTC, PSR287,     $015f
reg         INTC, PSR286,     $015e
reg         INTC, PSR285,     $015d
reg         INTC, PSR284,     $015c

reg         INTC, PSR288_291, $0160
reg         INTC, PSR291,     $0163
reg         INTC, PSR290,     $0162
reg         INTC, PSR289,     $0161
reg         INTC, PSR288,     $0160

reg         INTC, PSR292_295, $0164
reg         INTC, PSR295,     $0167
reg         INTC, PSR294,     $0166
reg         INTC, PSR293,     $0165
reg         INTC, PSR292,     $0164

reg         INTC, PSR296_299, $0168
reg         INTC, PSR299,     $016b
reg         INTC, PSR298,     $016a
reg         INTC, PSR297,     $0169
reg         INTC, PSR296,     $0168

reg         INTC, PSR300_303, $016c
reg         INTC, PSR303,     $016f
reg         INTC, PSR302,     $016e
reg         INTC, PSR301,     $016d
reg         INTC, PSR300,     $016c

reg         INTC, PSR304_307, $0170
reg         INTC, PSR307,     $0173
reg         INTC, PSR306,     $0172
reg         INTC, PSR305,     $0171
reg         INTC, PSR304,     $0170

reg         INTC, PSR308_311, $0174
reg         INTC, PSR311,     $0177
reg         INTC, PSR310,     $0176
reg         INTC, PSR309,     $0175
reg         INTC, PSR308,     $0174

reg         INTC, PSR312_315, $0178
reg         INTC, PSR315,     $017b
reg         INTC, PSR314,     $017a
reg         INTC, PSR313,     $0179
reg         INTC, PSR312,     $0178

reg         INTC, PSR316_319, $017c
reg         INTC, PSR319,     $017f
reg         INTC, PSR318,     $017e
reg         INTC, PSR317,     $017d
reg         INTC, PSR316,     $017c

reg         INTC, PSR320_323, $0180
reg         INTC, PSR323,     $0183
reg         INTC, PSR322,     $0182
reg         INTC, PSR321,     $0181
reg         INTC, PSR320,     $0180

reg         INTC, PSR324_327, $0184
reg         INTC, PSR327,     $0187
reg         INTC, PSR326,     $0186
reg         INTC, PSR325,     $0185
reg         INTC, PSR324,     $0184

reg         INTC, PSR328_331, $0188
reg         INTC, PSR331,     $018b
reg         INTC, PSR330,     $018a
reg         INTC, PSR329,     $0189
reg         INTC, PSR328,     $0188

reg         INTC, PSR332_335, $018c
reg         INTC, PSR335,     $018f
reg         INTC, PSR334,     $018e
reg         INTC, PSR333,     $018d
reg         INTC, PSR332,     $018c

reg         INTC, PSR336_339, $0190
reg         INTC, PSR339,     $0193
reg         INTC, PSR338,     $0192
reg         INTC, PSR337,     $0191
reg         INTC, PSR336,     $0190

reg         INTC, PSR340_343, $0194
reg         INTC, PSR343,     $0197
reg         INTC, PSR342,     $0196
reg         INTC, PSR341,     $0195
reg         INTC, PSR340,     $0194

reg         INTC, PSR344_347, $0198
reg         INTC, PSR347,     $019b
reg         INTC, PSR346,     $019a
reg         INTC, PSR345,     $0199
reg         INTC, PSR344,     $0198

reg         INTC, PSR348_351, $019c
reg         INTC, PSR351,     $019f
reg         INTC, PSR350,     $019e
reg         INTC, PSR349,     $019d
reg         INTC, PSR348,     $019c

reg         INTC, PSR352_355, $01a0
reg         INTC, PSR355,     $01a3
reg         INTC, PSR354,     $01a2
reg         INTC, PSR353,     $01a1
reg         INTC, PSR352,     $01a0

reg         INTC, PSR356_359, $01a4
reg         INTC, PSR359,     $01a7
reg         INTC, PSR358,     $01a6
reg         INTC, PSR357,     $01a5
reg         INTC, PSR356,     $01a4

reg         INTC, PSR360_363, $01a8
reg         INTC, PSR363,     $01ab
reg         INTC, PSR362,     $01aa
reg         INTC, PSR361,     $01a9
reg         INTC, PSR360,     $01a8

reg         INTC, PSR364_367, $01ac
reg         INTC, PSR367,     $01af
reg         INTC, PSR366,     $01ae
reg         INTC, PSR365,     $01ad
reg         INTC, PSR364,     $01ac

reg         INTC, PSR368_371, $01b0
reg         INTC, PSR371,     $01b3
reg         INTC, PSR370,     $01b2
reg         INTC, PSR369,     $01b1
reg         INTC, PSR368,     $01b0

reg         INTC, PSR372_375, $01b4
reg         INTC, PSR375,     $01b7
reg         INTC, PSR374,     $01b6
reg         INTC, PSR373,     $01b5
reg         INTC, PSR372,     $01b4

reg         INTC, PSR376_379, $01b8
reg         INTC, PSR379,     $01bb
reg         INTC, PSR378,     $01ba
reg         INTC, PSR377,     $01b9
reg         INTC, PSR376,     $01b8

reg         INTC, PSR380_383, $01bc
reg         INTC, PSR383,     $01bf
reg         INTC, PSR382,     $01be
reg         INTC, PSR381,     $01bd
reg         INTC, PSR380,     $01bc

reg         INTC, PSR384_387, $01c0
reg         INTC, PSR387,     $01c3
reg         INTC, PSR386,     $01c2
reg         INTC, PSR385,     $01c1
reg         INTC, PSR384,     $01c0

reg         INTC, PSR388_391, $01c4
reg         INTC, PSR391,     $01c7
reg         INTC, PSR390,     $01c6
reg         INTC, PSR389,     $01c5
reg         INTC, PSR388,     $01c4

reg         INTC, PSR392_395, $01c8
reg         INTC, PSR395,     $01cb
reg         INTC, PSR394,     $01ca
reg         INTC, PSR393,     $01c9
reg         INTC, PSR392,     $01c8

reg         INTC, PSR396_399, $01cc
reg         INTC, PSR399,     $01cf
reg         INTC, PSR398,     $01ce
reg         INTC, PSR397,     $01cd
reg         INTC, PSR396,     $01cc

reg         INTC, PSR400_403, $01d0
reg         INTC, PSR403,     $01d3
reg         INTC, PSR402,     $01d2
reg         INTC, PSR401,     $01d1
reg         INTC, PSR400,     $01d0

reg         INTC, PSR404_407, $01d4
reg         INTC, PSR407,     $01d7
reg         INTC, PSR406,     $01d6
reg         INTC, PSR405,     $01d5
reg         INTC, PSR404,     $01d4

reg         INTC, PSR408_411, $01d8
reg         INTC, PSR411,     $01db
reg         INTC, PSR410,     $01da
reg         INTC, PSR409,     $01d9
reg         INTC, PSR408,     $01d8

reg         INTC, PSR412_415, $01dc
reg         INTC, PSR415,     $01df
reg         INTC, PSR414,     $01de
reg         INTC, PSR413,     $01dd
reg         INTC, PSR412,     $01dc

reg         INTC, PSR416_419, $01e0
reg         INTC, PSR419,     $01e3
reg         INTC, PSR418,     $01e2
reg         INTC, PSR417,     $01e1
reg         INTC, PSR416,     $01e0

reg         INTC, PSR420_423, $01e4
reg         INTC, PSR423,     $01e7
reg         INTC, PSR422,     $01e6
reg         INTC, PSR421,     $01e5
reg         INTC, PSR420,     $01e4

reg         INTC, PSR424_427, $01e8
reg         INTC, PSR427,     $01eb
reg         INTC, PSR426,     $01ea
reg         INTC, PSR425,     $01e9
reg         INTC, PSR424,     $01e8

reg         INTC, PSR428_431, $01ec
reg         INTC, PSR431,     $01ef
reg         INTC, PSR430,     $01ee
reg         INTC, PSR429,     $01ed
reg         INTC, PSR428,     $01ec

reg         INTC, PSR432_435, $01f0
reg         INTC, PSR435,     $01f3
reg         INTC, PSR434,     $01f2
reg         INTC, PSR433,     $01f1
reg         INTC, PSR432,     $01f0

reg         INTC, PSR436_439, $01f4
reg         INTC, PSR439,     $01f7
reg         INTC, PSR438,     $01f6
reg         INTC, PSR437,     $01f5
reg         INTC, PSR436,     $01f4

reg         INTC, PSR440_443, $01f8
reg         INTC, PSR443,     $01fb
reg         INTC, PSR442,     $01fa
reg         INTC, PSR441,     $01f9
reg         INTC, PSR440,     $01f8

reg         INTC, PSR444_447, $01fc
reg         INTC, PSR447,     $01ff
reg         INTC, PSR446,     $01fe
reg         INTC, PSR445,     $01fd
reg         INTC, PSR444,     $01fc

reg         INTC, PSR448_451, $0200
reg         INTC, PSR451,     $0203
reg         INTC, PSR450,     $0202
reg         INTC, PSR449,     $0201
reg         INTC, PSR448,     $0200

reg         INTC, PSR452_455, $0204
reg         INTC, PSR455,     $0207
reg         INTC, PSR454,     $0206
reg         INTC, PSR453,     $0205
reg         INTC, PSR452,     $0204

reg         INTC, PSR456_459, $0208
reg         INTC, PSR459,     $020b
reg         INTC, PSR458,     $020a
reg         INTC, PSR457,     $0209
reg         INTC, PSR456,     $0208

reg         INTC, PSR460_463, $020c
reg         INTC, PSR463,     $020f
reg         INTC, PSR462,     $020e
reg         INTC, PSR461,     $020d
reg         INTC, PSR460,     $020c

reg         INTC, PSR464_467, $0210
reg         INTC, PSR467,     $0213
reg         INTC, PSR466,     $0212
reg         INTC, PSR465,     $0211
reg         INTC, PSR464,     $0210

reg         INTC, PSR468_471, $0214
reg         INTC, PSR471,     $0217
reg         INTC, PSR470,     $0216
reg         INTC, PSR469,     $0215
reg         INTC, PSR468,     $0214

reg         INTC, PSR472_475, $0218
reg         INTC, PSR475,     $021b
reg         INTC, PSR474,     $021a
reg         INTC, PSR473,     $0219
reg         INTC, PSR472,     $0218

reg         INTC, PSR476_479, $021c
reg         INTC, PSR479,     $021f
reg         INTC, PSR478,     $021e
reg         INTC, PSR477,     $021d
reg         INTC, PSR476,     $021c

reg         INTC, PSR480_483, $0220
reg         INTC, PSR483,     $0223
reg         INTC, PSR482,     $0222
reg         INTC, PSR481,     $0221
reg         INTC, PSR480,     $0220

reg         INTC, PSR484_487, $0224
reg         INTC, PSR487,     $0227
reg         INTC, PSR486,     $0226
reg         INTC, PSR485,     $0225
reg         INTC, PSR484,     $0224

reg         INTC, PSR488_491, $0228
reg         INTC, PSR491,     $022b
reg         INTC, PSR490,     $022a
reg         INTC, PSR489,     $0229
reg         INTC, PSR488,     $0228

reg         INTC, PSR492_495, $022c
reg         INTC, PSR495,     $022f
reg         INTC, PSR494,     $022e
reg         INTC, PSR493,     $022d
reg         INTC, PSR492,     $022c

reg         INTC, PSR496_499, $0230
reg         INTC, PSR499,     $0233
reg         INTC, PSR498,     $0232
reg         INTC, PSR497,     $0231
reg         INTC, PSR496,     $0230

reg         INTC, PSR500_503, $0234
reg         INTC, PSR503,     $0237
reg         INTC, PSR502,     $0236
reg         INTC, PSR501,     $0235
reg         INTC, PSR500,     $0234

reg         INTC, PSR504_507, $0238
reg         INTC, PSR507,     $023b
reg         INTC, PSR506,     $023a
reg         INTC, PSR505,     $0239
reg         INTC, PSR504,     $0238

reg         INTC, PSR508_511, $023c
reg         INTC, PSR511,     $023f
reg         INTC, PSR510,     $023e
reg         INTC, PSR509,     $023d
reg         INTC, PSR508,     $023c
# -----------------------------------------------------------------------------
            .endif
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