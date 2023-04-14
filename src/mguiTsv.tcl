proc mguiTsvName { } {
 global env mguiVariables
 return [format "%s/%s.tsv" $env(MGUI_TSV) $mguiVariables(DTS_E_S_VAL)]
}

proc mguiTsvOpen { N } {
 if { [file exists $N]==1 && [tk_dialog .confirm "File Exists" "$N\nalready exists! Overwrite it?" \
      question 0 Yes No]==1 } { return -1 }
 if { [catch { set F [open $N w+ 501] } M] == 1 } { return -1 }
 return $F
}

proc mguiTsvClose { F } { close $F }

proc mguiTsvWriteHeader { F } {
 global env mguiVariables
 if { $F < 0 } { return }
 set header ""
 append header "#username\t"
 append header "telescope\t"
 append header "instrument\t"
 append header "object_name\t"
 append header "ra\t"
 append header "dec\t"
 append header "filter\t"
 append header "exp_time\t"
 append header "num_exp\t"
 append header "airmass\t"
 append header "lunarphase\t"
 append header "priority\t"
 append header "photometric\t"
 append header "guiding\t"
 append header "non_sidereal\t"
 append header "begin\t"
 append header "end\t"
 append header "binning\t"
 append header "dither\t"
 append header "cadence\t"
 append header "non_sidereal_json"
 mguiInform ${header}
 puts $F ${header}
}

proc mguiTsvWriteDitherRandomWalk { F } {
 global env mguiVariables
 if { $F < 0 } { return }
 set O [mguiGetRandomOffsets $mguiVariables(DTS_E_WS_VAL) -$mguiVariables(DTS_E_RO_VAL) \
        $mguiVariables(DTS_E_RO_VAL) -$mguiVariables(DTS_E_DO_VAL) $mguiVariables(DTS_E_DO_VAL)]
 mguiTsvWriteDither $F $O
}

proc mguiTsvWriteDitherRAxDec { F } {
 global env mguiVariables
 if { $F < 0 } { return }
 set O [mguiGetRADecOffsets $mguiVariables(DTS_E_RO_VAL) $mguiVariables(DTS_E_DO_VAL) \
        $mguiVariables(DTS_E_RS_VAL) $mguiVariables(DTS_E_DS_VAL)]
 mguiTsvWriteDither $F $O
}

proc mguiTsvWriteDitherFromFile { F } {
 global env mguiVariables
 if { $F < 0 } { return }
 set O [mguiGetFileOffsets $mguiVariables(DTS_E_FN_VAL)]
 mguiTsvWriteDither $F $O
}

proc mguiTsvWriteDither { F O } {
 global env mguiGlobals mguiVariables mguiWidgets
 if { $F < 0 } { return }
 for { set i 0 } { $i < $mguiGlobals(NFILTERS) } { incr i } {
  if { $mguiVariables(DTS_C_F${i}_VAL) == 1 } {

   set obs ""
   append obs "# $mguiVariables(DTS_E_R_VAL) $mguiVariables(DTS_E_D_VAL) $mguiGlobals(EPOCH) "
   append obs "$mguiVariables(DTS_R_D_VAL) $mguiVariables(DTS_R_B${i}_VAL) $mguiVariables(DTS_E_X${i}_VAL) "
   append obs "$mguiVariables(DTS_E_N${i}_VAL) $mguiVariables(DTS_T_F${i}_VAL) : "
   append obs "$mguiVariables(DTS_E_O_VAL) original field center"
   mguiInform ${obs}
   puts $F ${obs}

   for { set j 0 } { $j < [llength $O] } { incr j } {

    # get offset(s)
    set oRA [lindex [lindex $O $j] 0]
    set oDec [lindex [lindex $O $j] 1]

    # now figure the new field center
    if { [string trim $mguiVariables(DTS_R_D_VAL)] == "RandomWalk" } {
     if { $mguiGlobals(TRW)==0 || $j==0 } {
      set aRA [RA_from_asec [expr ${oRA} + [RA_to_asec $mguiVariables(DTS_E_R_VAL)]]]
      set aDec [Dec_from_asec [expr ${oDec} + [Dec_to_asec $mguiVariables(DTS_E_D_VAL)]]]
     } else {
      set aRA [RA_from_asec [expr ${oRA} + [RA_to_asec ${aRA}]]]
      set aDec [Dec_from_asec [expr ${oDec} + [Dec_to_asec ${aDec}]]]
     }
    } else {
     if { $j == 0 } {
      set aRA [RA_from_asec [expr ${oRA} + [RA_to_asec $mguiVariables(DTS_E_R_VAL)]]]
      set aDec [Dec_from_asec [expr ${oDec} + [Dec_to_asec $mguiVariables(DTS_E_D_VAL)]]]
     } else {
      set aRA [RA_from_asec [expr ${oRA} + [RA_to_asec ${aRA}]]]
      set aDec [Dec_from_asec [expr ${oDec} + [Dec_to_asec ${aDec}]]]
     }
    }

    set obs ""
    append obs "# ${aRA} ${aDec} $mguiGlobals(EPOCH) "
    append obs "$mguiVariables(DTS_R_D_VAL) $mguiVariables(DTS_R_B${i}_VAL) $mguiVariables(DTS_E_X${i}_VAL) "
    append obs "$mguiVariables(DTS_E_N${i}_VAL) $mguiVariables(DTS_T_F${i}_VAL) : "
    append obs "$mguiVariables(DTS_E_O_VAL) after offsets (${oRA}, ${oDec}) arcsec applied"
    mguiInform ${obs}
    puts $F ${obs}

    set msg ""
    append msg $mguiVariables(DTS_E_U_VAL) "\t"
    append msg $mguiGlobals(TELESCOPE) "\t"
    append msg $mguiGlobals(INSTRUMENT) "\t"
    append msg [format "%s_%s_%s" $mguiVariables(DTS_E_O_VAL) $mguiVariables(DTS_R_B${i}_VAL) \
                $mguiVariables(DTS_T_F${i}_VAL)] "_p${j}\t"
    append msg ${aRA} "\t"
    append msg ${aDec} "\t"
    append msg $mguiVariables(DTS_T_F${i}_VAL) "\t"
    append msg $mguiVariables(DTS_E_X${i}_VAL) "\t"
    append msg $mguiVariables(DTS_E_N${i}_VAL) "\t"
    append msg $mguiVariables(DTS_E_A_VAL) "\t"
    append msg $mguiGlobals(MOON) "\t"
    append msg $mguiGlobals(PRIORITY) "\t"
    append msg $mguiGlobals(PHOTOMETRIC) "\t"
    append msg $mguiGlobals(GUIDING) "\t"
    append msg $mguiGlobals(NONSIDEREAL) "\t"
    append msg $mguiVariables(DTS_E_B_VAL) "\t"
    append msg $mguiVariables(DTS_E_E_VAL) "\t"
    append msg $mguiVariables(DTS_R_B${i}_VAL) "\t"
    append msg $mguiVariables(DTS_R_D_VAL) "\t"
    append msg $mguiGlobals(CADENCE) "\t"
    append msg $mguiGlobals(JSON)
    mguiInform "${msg}"
    puts $F "${msg}"
   }
  }
 }
}

proc mguiTsvWriteNoDither { F } {
 global env mguiGlobals mguiVariables mguiWidgets
 if { ${F} < 0 } { return }
 for { set i 0 } { $i < $mguiGlobals(NFILTERS) } { incr i } {
  if { $mguiVariables(DTS_C_F${i}_VAL) == 1 } {
   set obs ""
   append obs "# $mguiVariables(DTS_E_R_VAL) $mguiVariables(DTS_E_D_VAL) $mguiGlobals(EPOCH) $mguiVariables(DTS_R_D_VAL) "
   append obs "$mguiVariables(DTS_R_B${i}_VAL) $mguiVariables(DTS_E_X${i}_VAL) $mguiVariables(DTS_E_N${i}_VAL) "
   append obs "$mguiVariables(DTS_T_F${i}_VAL) : $mguiVariables(DTS_E_O_VAL)"
   mguiInform ${obs}
   puts $F ${obs}
   set msg ""
   append msg $mguiVariables(DTS_E_U_VAL) "\t"
   append msg $mguiGlobals(TELESCOPE) "\t"
   append msg $mguiGlobals(INSTRUMENT) "\t"
   append msg [format "%s_%s_%s" $mguiVariables(DTS_E_O_VAL) $mguiVariables(DTS_R_B${i}_VAL) \
               $mguiVariables(DTS_T_F${i}_VAL)] "\t"
   append msg $mguiVariables(DTS_E_R_VAL) "\t"
   append msg $mguiVariables(DTS_E_D_VAL) "\t"
   append msg $mguiVariables(DTS_T_F${i}_VAL) "\t"
   append msg $mguiVariables(DTS_E_X${i}_VAL) "\t"
   append msg $mguiVariables(DTS_E_N${i}_VAL) "\t"
   append msg $mguiVariables(DTS_E_A_VAL) "\t"
   append msg $mguiGlobals(MOON) "\t"
   append msg $mguiGlobals(PRIORITY) "\t"
   append msg $mguiGlobals(PHOTOMETRIC) "\t"
   append msg $mguiGlobals(GUIDING) "\t"
   append msg $mguiGlobals(NONSIDEREAL) "\t"
   append msg $mguiVariables(DTS_E_B_VAL) "\t"
   append msg $mguiVariables(DTS_E_E_VAL) "\t"
   append msg $mguiVariables(DTS_R_B${i}_VAL) "\t"
   append msg $mguiVariables(DTS_R_D_VAL) "\t"
   append msg $mguiGlobals(CADENCE) "\t"
   append msg $mguiGlobals(JSON)
   mguiInform "${msg}"
   puts $F "${msg}"
  }
 }
}
