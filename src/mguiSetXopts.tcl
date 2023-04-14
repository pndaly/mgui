proc mguiSetXopts { } {
 global env mguiXopts
 if { [file exists $env(MGUI_XOPT)] == 0 } { return }
 set D [open $env(MGUI_XOPT) r]
 while { [gets $D T] >= 0 } { if { ([llength $T]==2) && ([string index $T 0]!="#") } {
  set mguiXopts([lindex $T 0]) [lindex $T 1] }
 }
 close $D
 foreach O [array names mguiXopts {x*}] { option add *[string range $O 1 end] $mguiXopts($O) }
}
