#!/bin/sh
# the next line restarts using wish \
exec `which wish` "$0" "$@"

# global(s)
global env mguiGlobals

# set paths
auto_mkindex $env(MGUI_SRC) $env(MGUI_SRC)/*.tcl
lappend auto_path $env(MGUI_SRC) $env(PWD)

# initialize
mguiInitGlobals
mguiSetXopts
  
# create widget(s)
mguiBuildFrame $mguiGlobals(SYSLEV)
mguiBindWidgets

# identify project
update idletasks
