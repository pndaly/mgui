proc mguiInitGlobals { } {
 global env mguiGlobals mguiVariables mguiVersions tcl_version tk_version

 set mguiGlobals(FALSE)   0
 set mguiGlobals(TRUE)    1
 set mguiGlobals(NOTSET)  -1
 set mguiGlobals(SYSLEV)  .$env(MGUI_TELESCOPE)
 set mguiGlobals(SYSTEM)  $env(MGUI_TELESCOPE)
 set mguiGlobals(DELAY)   500
 set mguiGlobals(FILTERS) {U B V R I Clear Open Halpha}
 set mguiGlobals(NFILTERS) [llength $mguiGlobals(FILTERS)]
 set mguiGlobals(TRW)     1
 set mguiGlobals(HTW)     0
 set mguiGlobals(RSEED)   [expr srand([pid])]

 # currently static but might change in the future
 set mguiGlobals(CADENCE)     Once
 set mguiGlobals(GUIDING)     False
 set mguiGlobals(INSTRUMENT)  Mont4k
 set mguiGlobals(JSON)        "'{}'"
 set mguiGlobals(EPOCH)       2000.0
 set mguiGlobals(MOON)        Any
 set mguiGlobals(NONSIDEREAL) False
 set mguiGlobals(PHOTOMETRIC) False
 set mguiGlobals(PRIORITY)    Routine
 set mguiGlobals(TELESCOPE)   Kuiper

 # version(s)
 set mguiVersions(TCL)      $tcl_version
 set mguiVersions(TK)       $tk_version
 set mguiVersions(AUTHOR)   "Philip N. Daly"
 set mguiVersions(EMAIL)    "pndaly@arizona.edu"
 set mguiVersions(DATE)     "13 April, 2023"
 set mguiVersions(VERSION)  20230413
 set mguiVersions(MODULE)   MGUI
 set mguiVersions(OWNER)    "(C) 2023-Present Steward Observatory (UA)"
 set mguiVersions(HELP)     ""
 append mguiVersions(HELP)  $mguiVersions(MODULE) ":\n"
 append mguiVersions(HELP)  "v" $mguiVersions(VERSION) "\n"
 append mguiVersions(HELP)  $mguiVersions(OWNER) "\n"
 append mguiVersions(HELP)  "Author:\t" $mguiVersions(AUTHOR) "\n"
 append mguiVersions(HELP)  "E-mail:\t" $mguiVersions(EMAIL) "\n"
 append mguiVersions(HELP)  "Date:\t" $mguiVersions(DATE) "\n"
 append mguiVersions(HELP)  "Tcl:\tv" $mguiVersions(TCL) "\n"
 append mguiVersions(HELP)  "Tk:\tv" $mguiVersions(TK) "\n"
}
