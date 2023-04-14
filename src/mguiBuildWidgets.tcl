proc mguiBuildWidgets { W } {
 # global(s)
 global mguiWidgets mguiVersions

 # create top level (tl)
 set tl [frame ${W}.main]

 # create top frame (tf), middle frame (mf), bottom frame (bf) and lower frame (lf)
 set tf [frame ${tl}.ft]
 set mf [frame ${tl}.fm -relief sunken -bd 2]
 set bf [frame ${tl}.fb -relief sunken -bd 2]
 set lf [frame ${tl}.fl -relief sunken -bd 2]
 pack $tf $mf $bf $lf -fill both -expand yes -side top

 # tf: create scrolling region for output (TW=text_pane SB=scroll_bar)
 set mguiWidgets(SB) [scrollbar ${tf}.scrollbar -orient vertical -relief sunken -bd 2]
 set mguiWidgets(TW) [text ${tf}.text -state disabled -wrap word -relief sunken -bd 2 -width 0]
 $mguiWidgets(SB) configure -command "$mguiWidgets(TW) yview"
 $mguiWidgets(TW) configure -yscroll "$mguiWidgets(SB) set"
 pack $mguiWidgets(SB) -side right -fill y
 pack $mguiWidgets(TW) -side right -fill both -expand yes

 # mf: script window
 mguiScriptWindow ${mf}

 # bf: create command(s)
 set mguiWidgets(CMD_B_SAVE) [button ${bf}.s -width 20 -text "Save" -bg lavender -fg black]
 set mguiWidgets(CMD_B_EXIT) [button ${bf}.e -width 20 -text "Exit" -bg thistle  -fg black]
 pack $mguiWidgets(CMD_B_SAVE) $mguiWidgets(CMD_B_EXIT) -expand yes -fill both -side left 

 # lf: copyright etc
 set mguiVersions(BANNER) ""
 append mguiVersions(BANNER) "$mguiVersions(MODULE) "
 append mguiVersions(BANNER) "v$mguiVersions(VERSION) "
 append mguiVersion(BANNER)  "$mguiVersions(OWNER), "
 append mguiVersions(BANNER) "Contact: $mguiVersions(AUTHOR) ($mguiVersions(EMAIL))"
 pack [label ${lf}.l -fg blue -textvariable mguiVersions(BANNER) -font -adobe-helvetica-italic-r-normal--*-110-*] \
      -expand yes -fill both -side left

 # return
 return $tl
}
