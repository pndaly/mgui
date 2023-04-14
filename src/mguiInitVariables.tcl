proc mguiReadVariables { } {
 global env mguiComments mguiVariables

 # get file
 set F [format "%s/%s" $env(MGUI_CFG) mgui.vars]
 set FN [glob -nocomplain ${F}]
 if { ${FN} == "" } { return }

 # open and read file
 set FR [open ${FN} r]
 while {[gets ${FR} T] >= 0} {
  if { [string index $T 0] != "#" } {
   set X [split $T "\\"]
   set var [string trim [lindex ${X} 0]]
   set com [string trim [lindex ${X} 1]]
   set val [string trim [lindex ${X} 2]]
   set mguiComments(${var})  ${com}
   set mguiVariables(${var}) ${val}
  }
 }

 # close file
 close $FR
}

proc mguiWriteVariables { } {
 global env mguiComments mguiVariables

 # create new file
 set F [format "%s/%s" $env(MGUI_CFG) mgui.vars]
 set FN [glob -nocomplain ${F}]
 if { ${FN} != "" } { exec rm -f ${FN} }

 # write file
 set FW [open ${FN} w]
 puts ${FW} "# +\n# [mguiGetTime]\n# -"
 foreach E [lsort [array names mguiVariables]] {
  if { [string first "_VAL" ${E}] > 0 } {
   puts ${FW} [format "%-16s\\%-16s\\%s" ${E} $mguiComments(${E}) $mguiVariables(${E})]
  }
 }

 # close
 flush ${FW}
 close ${FW}
}
