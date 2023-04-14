proc mguiGetTime { } {
  return [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]
}

proc mguiNextDay { } {
  set x [format "%s" [mguiGetTime]]
  set s [clock scan $x -format {%Y-%m-%d %H:%M:%S}]
  set a [clock add $s 1 day]
  return [clock format $a -format {%Y-%m-%d %H:%M:%S}]
}

proc mguiNextWeek { } {
  set x [format "%s" [mguiGetTime]]
  set s [clock scan $x -format {%Y-%m-%d %H:%M:%S}]
  set a [clock add $s 7 day]
  return [clock format $a -format {%Y-%m-%d %H:%M:%S}]
}

proc mguiNextMonth { } {
  set x [format "%s" [mguiGetTime]]
  set s [clock scan $x -format {%Y-%m-%d %H:%M:%S}]
  set a [clock add $s 1 month]
  return [clock format $a -format {%Y-%m-%d %H:%M:%S}]
}

proc mguiNextYear { } {
  set x [format "%s" [mguiGetTime]]
  set s [clock scan $x -format {%Y-%m-%d %H:%M:%S}]
  set a [clock add $s 1 year]
  return [clock format $a -format {%Y-%m-%d %H:%M:%S}]
}
