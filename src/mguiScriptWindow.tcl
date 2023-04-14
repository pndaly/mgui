proc mguiScriptWindow { W } { 
 global env mguiGlobals mguiWidgets mguiVariables

 # create frame(s)
 set F1 [frame ${W}.f1 -relief sunken -bd 2]
 set F2 [frame ${W}.f2 -relief sunken -bd 2]
 set F3 [frame ${W}.f3 -relief sunken -bd 2]
 set F4 [frame ${W}.f4 -relief sunken -bd 2]
 set F5 [frame ${W}.f5 -relief sunken -bd 2]
 set F6 [frame ${W}.f6 -relief sunken -bd 2]
 set F7 [frame ${W}.f7 -relief sunken -bd 2]
 pack ${F1} ${F2} ${F3} ${F4} ${F5} ${F6} ${F7} -side top -fill both -expand yes

 # populate frame(s)
 mguiScriptF1 ${F1}
 mguiScriptF2 ${F2}
 mguiScriptF3 ${F3}
 mguiScriptF4 ${F4}
 mguiScriptF5 ${F5}
 mguiScriptF6 ${F6}
 mguiScriptF7 ${F7}

 # initalize
 mguiScriptDisable
 set mguiVariables(DTS_C_F0) 0
 set mguiVariables(DTS_C_F1) 0
 set mguiVariables(DTS_C_F2) 0
 set mguiVariables(DTS_C_F3) 0
 set mguiVariables(DTS_C_F4) 0
 set mguiVariables(DTS_C_F5) 0
 set mguiVariables(DTS_C_F6) 0
 set mguiVariables(DTS_C_F7) 0
 mguiDelTrace
 mguiAddTrace

 # disable/enable widget(s)
 mguiScriptEnable
 mguiReadVariables
}

proc mguiScriptF1 { W } {
 global mguiGlobals
 pack [label ${W}.l1 -bg lightblue -fg black -text "Observation Configuration" -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label ${W}.l2 -bg lightblue -fg blue -text "Telescope: $mguiGlobals(TELESCOPE)  Instrument: $mguiGlobals(INSTRUMENT)  Epoch: $mguiGlobals(EPOCH)  Moon: $mguiGlobals(MOON)"] \
      [label ${W}.l3 -bg lightblue -fg blue -text "Cadence: $mguiGlobals(CADENCE)  Guiding: $mguiGlobals(GUIDING)  Photometric: $mguiGlobals(PHOTOMETRIC)"] \
      [label ${W}.l4 -bg lightblue -fg blue -text "Non-Sidereal: $mguiGlobals(NONSIDEREAL)  Priority: $mguiGlobals(PRIORITY)  JSON: $mguiGlobals(JSON)"] \
      -expand yes -fill both -side top
}

proc mguiScriptF2 { W } {
 global mguiGlobals mguiWidgets mguiVariables
 set mguiWidgets(DTS_E_U) [entry ${W}.u -width 10 -textvariable mguiVariables(DTS_E_U_VAL)]
 set mguiWidgets(DTS_E_O) [entry ${W}.o -width 15 -textvariable mguiVariables(DTS_E_O_VAL)]
 set mguiWidgets(DTS_E_S) [entry ${W}.s -width 15 -textvariable mguiVariables(DTS_E_S_VAL)]
 set mguiWidgets(DTS_E_B) [entry ${W}.b -width 25 -textvariable mguiVariables(DTS_E_B_VAL)]
 set mguiWidgets(DTS_E_E) [entry ${W}.e -width 25 -textvariable mguiVariables(DTS_E_E_VAL)]
 pack [label ${W}.lu -bg lightblue -text "User:"] $mguiWidgets(DTS_E_U) \
      [label ${W}.lo -bg lightblue -text "Object:"] $mguiWidgets(DTS_E_O) \
      [label ${W}.ls -bg lightblue -text "Script:"] $mguiWidgets(DTS_E_S) \
      [label ${W}.lb -bg lightblue -text "Begin:"] $mguiWidgets(DTS_E_B) \
      [label ${W}.le -bg lightblue -text "End:"] $mguiWidgets(DTS_E_E) \
      -side left -expand yes -fill both
}

proc mguiScriptF3 { W } {
 global mguiGlobals mguiWidgets mguiVariables
 set mguiWidgets(DTS_E_R) [entry ${W}.r -width 15 -textvariable mguiVariables(DTS_E_R_VAL)]
 set mguiWidgets(DTS_E_D) [entry ${W}.d -width 15 -textvariable mguiVariables(DTS_E_D_VAL)]
 set mguiWidgets(DTS_E_A) [entry ${W}.a -width 10 -textvariable mguiVariables(DTS_E_A_VAL)]
 pack [label ${W}.lr -bg lightblue -text "RA (hh:mm:ss.s):"] $mguiWidgets(DTS_E_R) \
      [label ${W}.ld -bg lightblue -text "Dec (+/-dd:mm:ss.s):"] $mguiWidgets(DTS_E_D) \
      [label ${W}.lj -bg lightblue -text "Maximum Airmass:"] $mguiWidgets(DTS_E_A) \
      -side left -expand yes -fill both
}

proc mguiScriptF4 { W } {
 global mguiGlobals mguiWidgets mguiVariables
 pack [label ${W}.l -text "Filter(s):" -bg lightblue] -side left -fill both -expand yes
 set mguiWidgets(DTS_C_F0) [checkbutton ${W}.f0 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F0_VAL) -textvariable mguiVariables(DTS_T_F0_VAL)]
 set mguiWidgets(DTS_C_F1) [checkbutton ${W}.f1 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F1_VAL) -textvariable mguiVariables(DTS_T_F1_VAL)]
 set mguiWidgets(DTS_C_F2) [checkbutton ${W}.f2 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F2_VAL) -textvariable mguiVariables(DTS_T_F2_VAL)]
 set mguiWidgets(DTS_C_F3) [checkbutton ${W}.f3 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F3_VAL) -textvariable mguiVariables(DTS_T_F3_VAL)]
 set mguiWidgets(DTS_C_F4) [checkbutton ${W}.f4 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F4_VAL) -textvariable mguiVariables(DTS_T_F4_VAL)]
 set mguiWidgets(DTS_C_F5) [checkbutton ${W}.f5 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F5_VAL) -textvariable mguiVariables(DTS_T_F5_VAL)]
 set mguiWidgets(DTS_C_F6) [checkbutton ${W}.f6 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F6_VAL) -textvariable mguiVariables(DTS_T_F6_VAL)]
 set mguiWidgets(DTS_C_F7) [checkbutton ${W}.f7 -fg blue -bg lightblue -variable mguiVariables(DTS_C_F7_VAL) -textvariable mguiVariables(DTS_T_F7_VAL)]
 pack $mguiWidgets(DTS_C_F0) $mguiWidgets(DTS_C_F1) $mguiWidgets(DTS_C_F2) $mguiWidgets(DTS_C_F3) \
      $mguiWidgets(DTS_C_F4) $mguiWidgets(DTS_C_F5) $mguiWidgets(DTS_C_F6) $mguiWidgets(DTS_C_F7) \
       -side left -fill both -expand yes
}

proc mguiScriptF5 { W } {
 global mguiGlobals mguiWidgets mguiVariables

 # frame(s)
 set mguiWidgets(DTS_F_W0) [frame ${W}.w0]
 set mguiWidgets(DTS_F_W1) [frame ${W}.w1]
 set mguiWidgets(DTS_F_W2) [frame ${W}.w2]
 set mguiWidgets(DTS_F_W3) [frame ${W}.w3]
 set mguiWidgets(DTS_F_W4) [frame ${W}.w4]
 set mguiWidgets(DTS_F_W5) [frame ${W}.w5]
 set mguiWidgets(DTS_F_W6) [frame ${W}.w6]
 set mguiWidgets(DTS_F_W7) [frame ${W}.w7]
 pack $mguiWidgets(DTS_F_W0) $mguiWidgets(DTS_F_W1) $mguiWidgets(DTS_F_W2) $mguiWidgets(DTS_F_W3) \
      $mguiWidgets(DTS_F_W4) $mguiWidgets(DTS_F_W5) $mguiWidgets(DTS_F_W6) $mguiWidgets(DTS_F_W7) \
      -side top -expand yes -fill both

 # U
 set mguiWidgets(DTS_E_X0) [entry $mguiWidgets(DTS_F_W0).x0 -width 10 -textvariable mguiVariables(DTS_E_X0_VAL)]
 set mguiWidgets(DTS_E_N0) [entry $mguiWidgets(DTS_F_W0).n0 -width 10 -textvariable mguiVariables(DTS_E_N0_VAL)]
 set mguiWidgets(DTS_R_B01) [radiobutton $mguiWidgets(DTS_F_W0).r01 -bg lightblue -variable mguiVariables(DTS_R_B0_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B02) [radiobutton $mguiWidgets(DTS_F_W0).r02 -bg lightblue -variable mguiVariables(DTS_R_B0_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B03) [radiobutton $mguiWidgets(DTS_F_W0).r03 -bg lightblue -variable mguiVariables(DTS_R_B0_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B04) [radiobutton $mguiWidgets(DTS_F_W0).r04 -bg lightblue -variable mguiVariables(DTS_R_B0_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W0).lf0 -bg lightblue -text "U" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W0).lx0 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X0) \
      [label $mguiWidgets(DTS_F_W0).li0 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N0) \
      [label $mguiWidgets(DTS_F_W0).lb0 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B01) $mguiWidgets(DTS_R_B02) $mguiWidgets(DTS_R_B03) $mguiWidgets(DTS_R_B04) \
      -side left -expand yes -fill both

 # B
 set mguiWidgets(DTS_E_X1) [entry $mguiWidgets(DTS_F_W1).x1 -width 10 -textvariable mguiVariables(DTS_E_X1_VAL)]
 set mguiWidgets(DTS_E_N1) [entry $mguiWidgets(DTS_F_W1).n1 -width 10 -textvariable mguiVariables(DTS_E_N1_VAL)]
 set mguiWidgets(DTS_R_B11) [radiobutton $mguiWidgets(DTS_F_W1).r11 -bg lightblue -variable mguiVariables(DTS_R_B1_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B12) [radiobutton $mguiWidgets(DTS_F_W1).r12 -bg lightblue -variable mguiVariables(DTS_R_B1_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B13) [radiobutton $mguiWidgets(DTS_F_W1).r13 -bg lightblue -variable mguiVariables(DTS_R_B1_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B14) [radiobutton $mguiWidgets(DTS_F_W1).r14 -bg lightblue -variable mguiVariables(DTS_R_B1_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W1).lf1 -bg lightblue -text "B" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W1).lx1 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X1) \
      [label $mguiWidgets(DTS_F_W1).li1 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N1) \
      [label $mguiWidgets(DTS_F_W1).lb1 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B11) $mguiWidgets(DTS_R_B12) $mguiWidgets(DTS_R_B13) $mguiWidgets(DTS_R_B14) \
      -side left -expand yes -fill both

 # V
 set mguiWidgets(DTS_E_X2) [entry $mguiWidgets(DTS_F_W2).x2 -width 10 -textvariable mguiVariables(DTS_E_X2_VAL)]
 set mguiWidgets(DTS_E_N2) [entry $mguiWidgets(DTS_F_W2).n2 -width 10 -textvariable mguiVariables(DTS_E_N2_VAL)]
 set mguiWidgets(DTS_R_B21) [radiobutton $mguiWidgets(DTS_F_W2).r21 -bg lightblue -variable mguiVariables(DTS_R_B2_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B22) [radiobutton $mguiWidgets(DTS_F_W2).r22 -bg lightblue -variable mguiVariables(DTS_R_B2_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B23) [radiobutton $mguiWidgets(DTS_F_W2).r23 -bg lightblue -variable mguiVariables(DTS_R_B2_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B24) [radiobutton $mguiWidgets(DTS_F_W2).r24 -bg lightblue -variable mguiVariables(DTS_R_B2_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W2).lf2 -bg lightblue -text "V" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W2).lx2 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X2) \
      [label $mguiWidgets(DTS_F_W2).li2 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N2) \
      [label $mguiWidgets(DTS_F_W2).lb2 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B21) $mguiWidgets(DTS_R_B22) $mguiWidgets(DTS_R_B23) $mguiWidgets(DTS_R_B24) \
      -side left -expand yes -fill both

 # R
 set mguiWidgets(DTS_E_X3) [entry $mguiWidgets(DTS_F_W3).x3 -width 10 -textvariable mguiVariables(DTS_E_X3_VAL)]
 set mguiWidgets(DTS_E_N3) [entry $mguiWidgets(DTS_F_W3).n3 -width 10 -textvariable mguiVariables(DTS_E_N3_VAL)]
 set mguiWidgets(DTS_R_B31) [radiobutton $mguiWidgets(DTS_F_W3).r31 -bg lightblue -variable mguiVariables(DTS_R_B3_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B32) [radiobutton $mguiWidgets(DTS_F_W3).r32 -bg lightblue -variable mguiVariables(DTS_R_B3_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B33) [radiobutton $mguiWidgets(DTS_F_W3).r33 -bg lightblue -variable mguiVariables(DTS_R_B3_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B34) [radiobutton $mguiWidgets(DTS_F_W3).r34 -bg lightblue -variable mguiVariables(DTS_R_B3_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W3).lf3 -bg lightblue -text "R" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W3).lx3 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X3) \
      [label $mguiWidgets(DTS_F_W3).li3 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N3) \
      [label $mguiWidgets(DTS_F_W3).lb3 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B31) $mguiWidgets(DTS_R_B32) $mguiWidgets(DTS_R_B33) $mguiWidgets(DTS_R_B34) \
      -side left -expand yes -fill both

 # I
 set mguiWidgets(DTS_E_X4) [entry $mguiWidgets(DTS_F_W4).x4 -width 10 -textvariable mguiVariables(DTS_E_X4_VAL)]
 set mguiWidgets(DTS_E_N4) [entry $mguiWidgets(DTS_F_W4).n4 -width 10 -textvariable mguiVariables(DTS_E_N4_VAL)]
 set mguiWidgets(DTS_R_B41) [radiobutton $mguiWidgets(DTS_F_W4).r41 -bg lightblue -variable mguiVariables(DTS_R_B4_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B42) [radiobutton $mguiWidgets(DTS_F_W4).r42 -bg lightblue -variable mguiVariables(DTS_R_B4_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B43) [radiobutton $mguiWidgets(DTS_F_W4).r43 -bg lightblue -variable mguiVariables(DTS_R_B4_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B44) [radiobutton $mguiWidgets(DTS_F_W4).r44 -bg lightblue -variable mguiVariables(DTS_R_B4_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W4).lf4 -bg lightblue -text "I" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W4).lx4 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X4) \
      [label $mguiWidgets(DTS_F_W4).li4 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N4) \
      [label $mguiWidgets(DTS_F_W4).lb4 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B41) $mguiWidgets(DTS_R_B42) $mguiWidgets(DTS_R_B43) $mguiWidgets(DTS_R_B44) \
      -side left -expand yes -fill both

 # Clear
 set mguiWidgets(DTS_E_X5) [entry $mguiWidgets(DTS_F_W5).x5 -width 10 -textvariable mguiVariables(DTS_E_X5_VAL)]
 set mguiWidgets(DTS_E_N5) [entry $mguiWidgets(DTS_F_W5).n5 -width 10 -textvariable mguiVariables(DTS_E_N5_VAL)]
 set mguiWidgets(DTS_R_B51) [radiobutton $mguiWidgets(DTS_F_W5).r51 -bg lightblue -variable mguiVariables(DTS_R_B5_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B52) [radiobutton $mguiWidgets(DTS_F_W5).r52 -bg lightblue -variable mguiVariables(DTS_R_B5_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B53) [radiobutton $mguiWidgets(DTS_F_W5).r53 -bg lightblue -variable mguiVariables(DTS_R_B5_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B54) [radiobutton $mguiWidgets(DTS_F_W5).r54 -bg lightblue -variable mguiVariables(DTS_R_B5_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W5).lf5 -bg lightblue -text "Clear" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W5).lx5 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X5) \
      [label $mguiWidgets(DTS_F_W5).li5 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N5) \
      [label $mguiWidgets(DTS_F_W5).lb5 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B51) $mguiWidgets(DTS_R_B52) $mguiWidgets(DTS_R_B53) $mguiWidgets(DTS_R_B54) \
      -side left -expand yes -fill both

 # Open
 set mguiWidgets(DTS_E_X6) [entry $mguiWidgets(DTS_F_W6).x6 -width 10 -textvariable mguiVariables(DTS_E_X6_VAL)]
 set mguiWidgets(DTS_E_N6) [entry $mguiWidgets(DTS_F_W6).n6 -width 10 -textvariable mguiVariables(DTS_E_N6_VAL)]
 set mguiWidgets(DTS_R_B61) [radiobutton $mguiWidgets(DTS_F_W6).r61 -bg lightblue -variable mguiVariables(DTS_R_B6_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B62) [radiobutton $mguiWidgets(DTS_F_W6).r62 -bg lightblue -variable mguiVariables(DTS_R_B6_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B63) [radiobutton $mguiWidgets(DTS_F_W6).r63 -bg lightblue -variable mguiVariables(DTS_R_B6_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B64) [radiobutton $mguiWidgets(DTS_F_W6).r64 -bg lightblue -variable mguiVariables(DTS_R_B6_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W6).lf6 -bg lightblue -text "Open" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W6).lx6 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X6) \
      [label $mguiWidgets(DTS_F_W6).li6 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N6) \
      [label $mguiWidgets(DTS_F_W6).lb6 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B61) $mguiWidgets(DTS_R_B62) $mguiWidgets(DTS_R_B63) $mguiWidgets(DTS_R_B64) \
      -side left -expand yes -fill both

 # Halpha
 set mguiWidgets(DTS_E_X7) [entry $mguiWidgets(DTS_F_W7).x7 -width 10 -textvariable mguiVariables(DTS_E_X7_VAL)]
 set mguiWidgets(DTS_E_N7) [entry $mguiWidgets(DTS_F_W7).n7 -width 10 -textvariable mguiVariables(DTS_E_N7_VAL)]
 set mguiWidgets(DTS_R_B71) [radiobutton $mguiWidgets(DTS_F_W7).r71 -bg lightblue -variable mguiVariables(DTS_R_B7_VAL) -value NoBin -text NoBin]
 set mguiWidgets(DTS_R_B72) [radiobutton $mguiWidgets(DTS_F_W7).r72 -bg lightblue -variable mguiVariables(DTS_R_B7_VAL) -value 2x2 -text 2x2]
 set mguiWidgets(DTS_R_B73) [radiobutton $mguiWidgets(DTS_F_W7).r73 -bg lightblue -variable mguiVariables(DTS_R_B7_VAL) -value 3x3 -text 3x3]
 set mguiWidgets(DTS_R_B74) [radiobutton $mguiWidgets(DTS_F_W7).r74 -bg lightblue -variable mguiVariables(DTS_R_B7_VAL) -value 4x4 -text 4x4]
 pack [label $mguiWidgets(DTS_F_W7).lf7 -bg lightblue -text "Halpha" -width 5 -font -adobe-helvetica-bold-r-normal--*-180-*] \
      [label $mguiWidgets(DTS_F_W7).lx7 -bg lightblue -text "Exposure Time:"] $mguiWidgets(DTS_E_X7) \
      [label $mguiWidgets(DTS_F_W7).li7 -bg lightblue -text "Num Expsoures:"] $mguiWidgets(DTS_E_N7) \
      [label $mguiWidgets(DTS_F_W7).lb7 -bg lightblue -text "Binning:"] \
      $mguiWidgets(DTS_R_B71) $mguiWidgets(DTS_R_B72) $mguiWidgets(DTS_R_B73) $mguiWidgets(DTS_R_B74) \
      -side left -expand yes -fill both

}

proc mguiScriptF6 { W } {
 global mguiGlobals mguiWidgets mguiVariables
 set mguiWidgets(DTS_R_D1) [radiobutton ${W}.d1 -bg lightblue -variable mguiVariables(DTS_R_D_VAL) -value NoDither   -text "No Dither"]
 set mguiWidgets(DTS_R_D2) [radiobutton ${W}.d2 -bg lightblue -variable mguiVariables(DTS_R_D_VAL) -value RandomWalk -text "Random Walk"]
 set mguiWidgets(DTS_R_D3) [radiobutton ${W}.d3 -bg lightblue -variable mguiVariables(DTS_R_D_VAL) -value RAxDec     -text "RA x Dec"]
 set mguiWidgets(DTS_R_D4) [radiobutton ${W}.d4 -bg lightblue -variable mguiVariables(DTS_R_D_VAL) -value FromFile   -text "From File"]
 pack [label ${W}.ld -bg lightblue -text "Dither: "] $mguiWidgets(DTS_R_D1) $mguiWidgets(DTS_R_D2) $mguiWidgets(DTS_R_D3) $mguiWidgets(DTS_R_D4)  -side left -expand yes -fill both
}

proc mguiScriptF7 { W } {
 global mguiGlobals mguiWidgets mguiVariables
 set mguiWidgets(DTS_E_RO) [entry ${W}.ro -width 10 -textvariable mguiVariables(DTS_E_RO_VAL)]
 set mguiWidgets(DTS_E_DO) [entry ${W}.do -width 10 -textvariable mguiVariables(DTS_E_DO_VAL)]
 set mguiWidgets(DTS_E_RS) [entry ${W}.rs -width 10 -textvariable mguiVariables(DTS_E_RS_VAL)]
 set mguiWidgets(DTS_E_DS) [entry ${W}.ds -width 10 -textvariable mguiVariables(DTS_E_DS_VAL)]
 set mguiWidgets(DTS_E_WS) [entry ${W}.ws -width 10 -textvariable mguiVariables(DTS_E_WS_VAL)]
 set mguiWidgets(DTS_E_FN) [entry ${W}.fn -width 50 -textvariable mguiVariables(DTS_E_FN_VAL)]
 pack [label ${W}.lro -bg lightblue -text "RA Offset (arcsec): "] $mguiWidgets(DTS_E_RO) \
      [label ${W}.ldo -bg lightblue -text "Dec Offset (arcsec): "] $mguiWidgets(DTS_E_DO) \
      [label ${W}.lrs -bg lightblue -text "RA Step(s): "] $mguiWidgets(DTS_E_RS) \
      [label ${W}.lds -bg lightblue -text "Dec Step(s): "] $mguiWidgets(DTS_E_DS) \
      [label ${W}.lws -bg lightblue -text "Random Walk Step(s): "] $mguiWidgets(DTS_E_WS) \
      [label ${W}.lfn -bg lightblue -text "Offsets Filename: "] $mguiWidgets(DTS_E_FN) \
      -side left -expand yes -fill both
}

proc mguiScriptDisable { } {
 global mguiWidgets
 $mguiWidgets(DTS_C_F0) configure -state disabled
 $mguiWidgets(DTS_C_F1) configure -state disabled
 $mguiWidgets(DTS_C_F2) configure -state disabled
 $mguiWidgets(DTS_C_F3) configure -state disabled
 $mguiWidgets(DTS_C_F4) configure -state disabled
 $mguiWidgets(DTS_C_F5) configure -state disabled
 $mguiWidgets(DTS_C_F6) configure -state disabled
 $mguiWidgets(DTS_C_F7) configure -state disabled
 $mguiWidgets(DTS_E_A)  configure -state disabled
 $mguiWidgets(DTS_E_B)  configure -state disabled
 $mguiWidgets(DTS_E_DO) configure -state disabled
 $mguiWidgets(DTS_E_DS) configure -state disabled
 $mguiWidgets(DTS_E_D)  configure -state disabled
 $mguiWidgets(DTS_E_E)  configure -state disabled
 $mguiWidgets(DTS_E_FN) configure -state disabled
 $mguiWidgets(DTS_E_N0) configure -state disabled
 $mguiWidgets(DTS_E_N1) configure -state disabled
 $mguiWidgets(DTS_E_N2) configure -state disabled
 $mguiWidgets(DTS_E_N3) configure -state disabled
 $mguiWidgets(DTS_E_N4) configure -state disabled
 $mguiWidgets(DTS_E_N5) configure -state disabled
 $mguiWidgets(DTS_E_N6) configure -state disabled
 $mguiWidgets(DTS_E_N7) configure -state disabled
 $mguiWidgets(DTS_E_O)  configure -state disabled
 $mguiWidgets(DTS_E_RO) configure -state disabled
 $mguiWidgets(DTS_E_RS) configure -state disabled
 $mguiWidgets(DTS_E_R)  configure -state disabled
 $mguiWidgets(DTS_E_S)  configure -state disabled
 $mguiWidgets(DTS_E_U)  configure -state disabled
 $mguiWidgets(DTS_E_WS) configure -state disabled
 $mguiWidgets(DTS_E_X0) configure -state disabled
 $mguiWidgets(DTS_E_X1) configure -state disabled
 $mguiWidgets(DTS_E_X2) configure -state disabled
 $mguiWidgets(DTS_E_X3) configure -state disabled
 $mguiWidgets(DTS_E_X4) configure -state disabled
 $mguiWidgets(DTS_E_X5) configure -state disabled
 $mguiWidgets(DTS_E_X6) configure -state disabled
 $mguiWidgets(DTS_E_X7) configure -state disabled
 $mguiWidgets(DTS_R_B01) configure -state disabled
 $mguiWidgets(DTS_R_B02) configure -state disabled
 $mguiWidgets(DTS_R_B03) configure -state disabled
 $mguiWidgets(DTS_R_B04) configure -state disabled
 $mguiWidgets(DTS_R_B11) configure -state disabled
 $mguiWidgets(DTS_R_B12) configure -state disabled
 $mguiWidgets(DTS_R_B13) configure -state disabled
 $mguiWidgets(DTS_R_B14) configure -state disabled
 $mguiWidgets(DTS_R_B21) configure -state disabled
 $mguiWidgets(DTS_R_B22) configure -state disabled
 $mguiWidgets(DTS_R_B23) configure -state disabled
 $mguiWidgets(DTS_R_B24) configure -state disabled
 $mguiWidgets(DTS_R_B31) configure -state disabled
 $mguiWidgets(DTS_R_B32) configure -state disabled
 $mguiWidgets(DTS_R_B33) configure -state disabled
 $mguiWidgets(DTS_R_B34) configure -state disabled
 $mguiWidgets(DTS_R_B41) configure -state disabled
 $mguiWidgets(DTS_R_B42) configure -state disabled
 $mguiWidgets(DTS_R_B43) configure -state disabled
 $mguiWidgets(DTS_R_B44) configure -state disabled
 $mguiWidgets(DTS_R_B51) configure -state disabled
 $mguiWidgets(DTS_R_B52) configure -state disabled
 $mguiWidgets(DTS_R_B53) configure -state disabled
 $mguiWidgets(DTS_R_B54) configure -state disabled
 $mguiWidgets(DTS_R_B61) configure -state disabled
 $mguiWidgets(DTS_R_B62) configure -state disabled
 $mguiWidgets(DTS_R_B63) configure -state disabled
 $mguiWidgets(DTS_R_B64) configure -state disabled
 $mguiWidgets(DTS_R_B71) configure -state disabled
 $mguiWidgets(DTS_R_B72) configure -state disabled
 $mguiWidgets(DTS_R_B73) configure -state disabled
 $mguiWidgets(DTS_R_B74) configure -state disabled
 $mguiWidgets(DTS_R_D1)  configure -state disabled
 $mguiWidgets(DTS_R_D2)  configure -state disabled
 $mguiWidgets(DTS_R_D3)  configure -state disabled
 $mguiWidgets(DTS_R_D4)  configure -state disabled
}

proc mguiScriptEnable { } {
 global mguiWidgets
 $mguiWidgets(DTS_C_F0) configure -state normal
 $mguiWidgets(DTS_C_F1) configure -state normal
 $mguiWidgets(DTS_C_F2) configure -state normal
 $mguiWidgets(DTS_C_F3) configure -state normal
 $mguiWidgets(DTS_C_F4) configure -state normal
 $mguiWidgets(DTS_C_F5) configure -state normal
 $mguiWidgets(DTS_C_F6) configure -state normal
 $mguiWidgets(DTS_C_F7) configure -state normal
 $mguiWidgets(DTS_E_A)  configure -state normal
 $mguiWidgets(DTS_E_B)  configure -state normal
 $mguiWidgets(DTS_E_DO) configure -state disabled
 $mguiWidgets(DTS_E_DS) configure -state disabled
 $mguiWidgets(DTS_E_D)  configure -state normal
 $mguiWidgets(DTS_E_E)  configure -state normal
 $mguiWidgets(DTS_E_FN) configure -state disabled
 $mguiWidgets(DTS_E_N0) configure -state disabled
 $mguiWidgets(DTS_E_N1) configure -state disabled
 $mguiWidgets(DTS_E_N2) configure -state disabled
 $mguiWidgets(DTS_E_N3) configure -state disabled
 $mguiWidgets(DTS_E_N4) configure -state disabled
 $mguiWidgets(DTS_E_N5) configure -state disabled
 $mguiWidgets(DTS_E_N6) configure -state disabled
 $mguiWidgets(DTS_E_N7) configure -state disabled
 $mguiWidgets(DTS_E_O)  configure -state normal
 $mguiWidgets(DTS_E_RO) configure -state disabled
 $mguiWidgets(DTS_E_RS) configure -state disabled
 $mguiWidgets(DTS_E_R)  configure -state normal
 $mguiWidgets(DTS_E_S)  configure -state normal
 $mguiWidgets(DTS_E_U)  configure -state normal
 $mguiWidgets(DTS_E_WS) configure -state disabled
 $mguiWidgets(DTS_E_X0) configure -state disabled
 $mguiWidgets(DTS_E_X1) configure -state disabled
 $mguiWidgets(DTS_E_X2) configure -state disabled
 $mguiWidgets(DTS_E_X3) configure -state disabled
 $mguiWidgets(DTS_E_X4) configure -state disabled
 $mguiWidgets(DTS_E_X5) configure -state disabled
 $mguiWidgets(DTS_E_X6) configure -state disabled
 $mguiWidgets(DTS_E_X7) configure -state disabled
 $mguiWidgets(DTS_R_B01) configure -state disabled
 $mguiWidgets(DTS_R_B02) configure -state disabled
 $mguiWidgets(DTS_R_B03) configure -state disabled
 $mguiWidgets(DTS_R_B04) configure -state disabled
 $mguiWidgets(DTS_R_B11) configure -state disabled
 $mguiWidgets(DTS_R_B12) configure -state disabled
 $mguiWidgets(DTS_R_B13) configure -state disabled
 $mguiWidgets(DTS_R_B14) configure -state disabled
 $mguiWidgets(DTS_R_B21) configure -state disabled
 $mguiWidgets(DTS_R_B22) configure -state disabled
 $mguiWidgets(DTS_R_B23) configure -state disabled
 $mguiWidgets(DTS_R_B24) configure -state disabled
 $mguiWidgets(DTS_R_B31) configure -state disabled
 $mguiWidgets(DTS_R_B32) configure -state disabled
 $mguiWidgets(DTS_R_B33) configure -state disabled
 $mguiWidgets(DTS_R_B34) configure -state disabled
 $mguiWidgets(DTS_R_B41) configure -state disabled
 $mguiWidgets(DTS_R_B42) configure -state disabled
 $mguiWidgets(DTS_R_B43) configure -state disabled
 $mguiWidgets(DTS_R_B44) configure -state disabled
 $mguiWidgets(DTS_R_B51) configure -state disabled
 $mguiWidgets(DTS_R_B52) configure -state disabled
 $mguiWidgets(DTS_R_B53) configure -state disabled
 $mguiWidgets(DTS_R_B54) configure -state disabled
 $mguiWidgets(DTS_R_B61) configure -state disabled
 $mguiWidgets(DTS_R_B62) configure -state disabled
 $mguiWidgets(DTS_R_B63) configure -state disabled
 $mguiWidgets(DTS_R_B64) configure -state disabled
 $mguiWidgets(DTS_R_B71) configure -state disabled
 $mguiWidgets(DTS_R_B72) configure -state disabled
 $mguiWidgets(DTS_R_B73) configure -state disabled
 $mguiWidgets(DTS_R_B74) configure -state disabled
 $mguiWidgets(DTS_R_D1)  configure -state normal
 $mguiWidgets(DTS_R_D2)  configure -state normal
 $mguiWidgets(DTS_R_D3)  configure -state normal
 $mguiWidgets(DTS_R_D4)  configure -state normal
}

proc mguiScriptSave { } {
 global mguiVariables mguiWidgets
 mguiScriptGet
 set F [mguiTsvOpen [mguiTsvName]]
 mguiTsvWriteHeader $F

 # dither: random walk
 if { [string compare $mguiVariables(DTS_R_D_VAL) "RandomWalk"] == 0 } {
  mguiTsvWriteDitherRandomWalk $F

 # dither: RA x Dec
 } elseif { [string compare $mguiVariables(DTS_R_D_VAL) "RAxDec"] == 0 } {
  mguiTsvWriteDitherRAxDec $F

 # dither: From File
 } elseif { [string compare $mguiVariables(DTS_R_D_VAL) "FromFile"] == 0 } {
  mguiTsvWriteDitherFromFile $F

 # dither: NoBin
 } else {
  mguiTsvWriteNoDither $F
 }

 # close and save variables
 mguiTsvClose $F
 mguiWriteVariables
}

proc mguiScriptGet { } {
 global env mguiVariables mguiWidgets
 set mguiVariables(DTS_E_A_VAL)  [$mguiWidgets(DTS_E_A) get]
 set mguiVariables(DTS_E_B_VAL)  [$mguiWidgets(DTS_E_B) get]
 set mguiVariables(DTS_E_DO_VAL) [$mguiWidgets(DTS_E_DO) get]
 set mguiVariables(DTS_E_DS_VAL) [$mguiWidgets(DTS_E_DS) get]
 set mguiVariables(DTS_E_D_VAL)  [$mguiWidgets(DTS_E_D) get]
 set mguiVariables(DTS_E_E_VAL)  [$mguiWidgets(DTS_E_E) get]
 set mguiVariables(DTS_E_FN_VAL) [$mguiWidgets(DTS_E_FN) get]
 set mguiVariables(DTS_E_N0_VAL) [$mguiWidgets(DTS_E_N0) get]
 set mguiVariables(DTS_E_N1_VAL) [$mguiWidgets(DTS_E_N1) get]
 set mguiVariables(DTS_E_N2_VAL) [$mguiWidgets(DTS_E_N2) get]
 set mguiVariables(DTS_E_N3_VAL) [$mguiWidgets(DTS_E_N3) get]
 set mguiVariables(DTS_E_N4_VAL) [$mguiWidgets(DTS_E_N4) get]
 set mguiVariables(DTS_E_N5_VAL) [$mguiWidgets(DTS_E_N5) get]
 set mguiVariables(DTS_E_N6_VAL) [$mguiWidgets(DTS_E_N6) get]
 set mguiVariables(DTS_E_N7_VAL) [$mguiWidgets(DTS_E_N7) get]
 set mguiVariables(DTS_E_O_VAL)  [$mguiWidgets(DTS_E_O) get]
 set mguiVariables(DTS_E_RO_VAL) [$mguiWidgets(DTS_E_RO) get]
 set mguiVariables(DTS_E_RS_VAL) [$mguiWidgets(DTS_E_RS) get]
 set mguiVariables(DTS_E_R_VAL)  [$mguiWidgets(DTS_E_R) get]
 set mguiVariables(DTS_E_S_VAL)  [$mguiWidgets(DTS_E_S) get]
 set mguiVariables(DTS_E_U_VAL)  [$mguiWidgets(DTS_E_U) get]
 set mguiVariables(DTS_E_WS_VAL) [$mguiWidgets(DTS_E_WS) get]
 set mguiVariables(DTS_E_X0_VAL) [$mguiWidgets(DTS_E_X0) get]
 set mguiVariables(DTS_E_X1_VAL) [$mguiWidgets(DTS_E_X1) get]
 set mguiVariables(DTS_E_X2_VAL) [$mguiWidgets(DTS_E_X2) get]
 set mguiVariables(DTS_E_X3_VAL) [$mguiWidgets(DTS_E_X3) get]
 set mguiVariables(DTS_E_X4_VAL) [$mguiWidgets(DTS_E_X4) get]
 set mguiVariables(DTS_E_X5_VAL) [$mguiWidgets(DTS_E_X5) get]
 set mguiVariables(DTS_E_X6_VAL) [$mguiWidgets(DTS_E_X6) get]
 set mguiVariables(DTS_E_X7_VAL) [$mguiWidgets(DTS_E_X7) get]
}

#proc mguiDisable { } {
# global mguiGlobals
# for { set i 0 } { $i < $mguiGlobals(NFILTERS) } { incr i } { mguiDisableElement ${i} }
#}

proc mguiDisableElement { N } {
 global mguiWidgets
 $mguiWidgets(DTS_E_N${N})  configure -state disabled
 $mguiWidgets(DTS_E_X${N})  configure -state disabled
 $mguiWidgets(DTS_R_B${N}1) configure -state disabled
 $mguiWidgets(DTS_R_B${N}2) configure -state disabled
 $mguiWidgets(DTS_R_B${N}3) configure -state disabled
 $mguiWidgets(DTS_R_B${N}4) configure -state disabled
}

#proc mguiEnable { } {
# global mguiGlobals
# for { set i 0 } { $i < $mguiGlobals(NFILTERS) } { incr i } { mguiEnableElement $i }
#}

proc mguiEnableElement { N } {
 global mguiWidgets
 $mguiWidgets(DTS_E_N${N})  configure -state normal
 $mguiWidgets(DTS_E_X${N})  configure -state normal
 $mguiWidgets(DTS_R_B${N}1) configure -state normal
 $mguiWidgets(DTS_R_B${N}2) configure -state normal
 $mguiWidgets(DTS_R_B${N}3) configure -state normal
 $mguiWidgets(DTS_R_B${N}4) configure -state normal
}

proc mguiAddTrace { } {
 global mguiGlobals mguiVariables
 trace variable mguiGlobals(HTW) w mguiTextWidgetTrace
 trace variable mguiVariables(DTS_R_D_VAL) w mguiDitherTrace
 for { set i 0 } { $i < $mguiGlobals(NFILTERS) } { incr i } { trace variable mguiVariables(DTS_C_F${i}_VAL) w mguiFilterTrace }
}

proc mguiDelTrace { } {
 global mguiGlobals mguiVariables
 trace vdelete mguiGlobals(HTW) w mguiTextWidgetTrace
 trace vdelete mguiVariables(DTS_R_D_VAL) w mguiDitherTrace
 for { set i 0 } { $i < $mguiGlobals(NFILTERS) } { incr i } { trace vdelete mguiVariables(DTS_C_F${i}_VAL) w mguiFilterTrace }
}

proc mguiDitherTrace { name element op } {
 global mguiWidgets
 if { ${element} != "" } { set name ${name}(${element}) }
 upvar ${name} x
 if { [string compare ${x} "RandomWalk"] == 0 } {
  $mguiWidgets(DTS_E_RO) configure -state normal
  $mguiWidgets(DTS_E_DO) configure -state normal
  $mguiWidgets(DTS_E_RS) configure -state disabled
  $mguiWidgets(DTS_E_DS) configure -state disabled
  $mguiWidgets(DTS_E_WS) configure -state normal
  $mguiWidgets(DTS_E_FN) configure -state disabled
 } elseif { [string compare ${x} "RAxDec"] == 0 } {
  $mguiWidgets(DTS_E_RO) configure -state normal
  $mguiWidgets(DTS_E_DO) configure -state normal
  $mguiWidgets(DTS_E_RS) configure -state normal
  $mguiWidgets(DTS_E_DS) configure -state normal
  $mguiWidgets(DTS_E_WS) configure -state disabled
  $mguiWidgets(DTS_E_FN) configure -state disabled
 } elseif { [string compare ${x} "FromFile"] == 0 } {
  $mguiWidgets(DTS_E_RO) configure -state disabled
  $mguiWidgets(DTS_E_DO) configure -state disabled
  $mguiWidgets(DTS_E_RS) configure -state disabled
  $mguiWidgets(DTS_E_DS) configure -state disabled
  $mguiWidgets(DTS_E_WS) configure -state disabled
  $mguiWidgets(DTS_E_FN) configure -state normal
 } else {
  $mguiWidgets(DTS_E_RO) configure -state disabled
  $mguiWidgets(DTS_E_DO) configure -state disabled
  $mguiWidgets(DTS_E_RS) configure -state disabled
  $mguiWidgets(DTS_E_DS) configure -state disabled
  $mguiWidgets(DTS_E_WS) configure -state disabled
  $mguiWidgets(DTS_E_FN) configure -state disabled
 }
}

proc mguiFilterTrace { name element op } {
 global env mguiGlobals mguiWidgets mguiVariables
 if { ${element} != "" } { set name ${name}(${element}) }
 upvar ${name} x
 set N [string index [string trim [lindex [split ${element} "_"] 2]] end]
 if { ${x} == $mguiGlobals(TRUE) } {
  mguiEnableElement $N
 } else {
  mguiDisableElement $N
 }
}

proc mguiTextWidgetTrace { name element op } {
 global env mguiGlobals mguiWidgets mguiVariables
 if { ${element} != "" } { set name ${name}(${element}) }
 if { $mguiGlobals(HTW) == $mguiGlobals(TRUE) } {
  pack forget [winfo parent $mguiWidgets(TW)]
 } else {
  pack [winfo parent $mguiWidgets(TW)] -in [winfo parent [winfo parent $mguiWidgets(TW)]] -side top -fill both -expand yes 
 }
}
