proc mguiAbout { W } {
 global mguiVersions
 tk_dialog ${W}.dialog "About $mguiVersions(MODULE)" $mguiVersions(HELP) info 0 Dismiss
 return 0
}

proc mguiClear { } {
 global mguiWidgets
 $mguiWidgets(TW) configure -state normal
 $mguiWidgets(TW) delete 1.0 end
 $mguiWidgets(TW) configure -state disabled
}

proc mguiStringMatch { P S } {
 global mguiWidgets
 if { $mguiWidgets(TW) != "" } {
  scan [$mguiWidgets(TW) index end] %d n
  for {set i 1} {$i < $n} {incr i} {
   $mguiWidgets(TW) delete 0.0 1.0
   $mguiWidgets(TW) mark set last $i.0
   while {[regexp -indices $P [$mguiWidgets(TW) get last "last lineend"] x]} {
    $mguiWidgets(TW) mark set first "last + [lindex $x 0] chars"
    $mguiWidgets(TW) mark set last "last + 1 chars + [lindex $x 1] chars"
    uplevel $S
   }
  }
 }
}

proc mguiInform { M } {
 global env mguiGlobals mguiWidgets
 if { $mguiWidgets(TW) != "" } {
  scan [$mguiWidgets(TW) index end] %d N
  if { $N > 250 } { mguiClear }
  $mguiWidgets(TW) configure -state normal
  $mguiWidgets(TW) insert end "$M\n"
  $mguiWidgets(TW) yview -pickplace end
  $mguiWidgets(TW) configure -state disabled
  mguiStringMatch ERROR " $mguiWidgets(TW) tag add errs first last "
 }
}

proc mguiSaveConfirm { W } {
if { [winfo exists $W] } { return [tk_dialog ${W}.confirm "Exit Application Dialogue" \
     "Exit and/or Save Current Setting(s)?" question 0 "Save and Exit" "Just Exit" Dismiss] }
}

proc mguiExit { W L } {
 global env
 switch [mguiSaveConfirm $W] {
  0 { mguiWriteVariables; exit $L }
  1 { exit $L }
  default { }
 }
}

proc mguiShow { I } {
 global env mguiComments mguiGlobals mguiStates mguiVariables mguiWidgets
 mguiClear
 switch -exact ${I} {
   environment { foreach E [lsort [array names env]]           { mguiInform "env($E) = $env($E)" } }
   globals     { foreach E [lsort [array names mguiGlobals]]   { mguiInform "mguiGlobals($E) = $mguiGlobals($E)" } }
   variables   { foreach E [lsort [array names mguiVariables]] { mguiInform "mguiVariables($E) = $mguiVariables($E)" } }
   widgets     { foreach E [lsort [array names mguiWidgets]]   { mguiInform "mguiWidgets($E) = $mguiWidgets($E)" } }
 }
}
