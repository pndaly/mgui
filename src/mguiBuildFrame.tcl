proc mguiBuildFrame { W } {
 # global(s)
 global env mguiGlobals mguiLocals mguiWidgets mguiVersions

 # top level
 toplevel $W
 wm withdraw $W
 frame ${W}.mb
 pack ${W}.mb -fill x

 # file menu
 menubutton ${W}.mb.file -text File -menu ${W}.mb.file.menu
 pack ${W}.mb.file -side left
 menu ${W}.mb.file.menu
 ${W}.mb.file.menu add command -label "Clear Text Widget"  -command mguiClear
 ${W}.mb.file.menu add separator
 ${W}.mb.file.menu add command -label "Show Environment"   -command "mguiShow environment"
 ${W}.mb.file.menu add command -label "Show Globals"       -command "mguiShow globals"
 ${W}.mb.file.menu add command -label "Show Variables"     -command "mguiShow variables"
 ${W}.mb.file.menu add command -label "Show Widgets"       -command "mguiShow widgets"
 ${W}.mb.file.menu add separator
 ${W}.mb.file.menu add command -label Exit                 -command "mguiExit $mguiGlobals(SYSLEV) 0"

 # options menu
 menubutton ${W}.mb.options -text Options -menu ${W}.mb.options.menu
 pack ${W}.mb.options -side left
 menu ${W}.mb.options.menu
 ${W}.mb.options.menu add checkbutton -label "True Random Walk" -variable mguiGlobals(TRW)
 ${W}.mb.options.menu add checkbutton -label "Hide Text Widget" -variable mguiGlobals(HTW)

 # help menu
 menubutton ${W}.mb.help -text Help -menu ${W}.mb.help.menu
 pack ${W}.mb.help -side right
 menu ${W}.mb.help.menu
 ${W}.mb.help.menu add command -label "About MGUI..." -command "mguiAbout $W"

 # build the widget tree and bind it
 pack [mguiBuildWidgets $W]

 # set wm parameters
 wm title      $W "MGUI Mont4K - Kuiper 61-inch Telescope"
 wm iconname   $W mgui
 wm iconbitmap $W @$env(MGUI_CFG)/mgui.xbm
 wm minsize    $W 500 375
 wm protocol   $W WM_DELETE_WINDOW "mguiExit $mguiGlobals(SYSLEV) 0"

 # initialise the task
 after $mguiGlobals(DELAY)
 update idletasks
 wm withdraw .
 wm deiconify $W
 return $W
}
