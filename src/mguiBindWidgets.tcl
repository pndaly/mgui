proc mguiBindWidgets { } {
 global mguiGlobals mguiWidgets
 $mguiWidgets(CMD_B_SAVE) configure -command mguiScriptSave
 $mguiWidgets(CMD_B_EXIT) configure -command "mguiExit $mguiGlobals(SYSLEV) 0"
 $mguiWidgets(TW) tag configure errs -background pink -foreground red -relief raised
}
