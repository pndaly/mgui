proc checkRA { RA } {
 return [regexp "^(0\[0-9]|1\[0-9]|2\[0-3]):\[0-5]\[0-9]:\[0-5]\[0-9](\.\[0-9])$" ${RA}]
}

proc checkDec { Dec } {
 return [regexp "^(\[+-]?\[0-8]\[0-9]):\[0-5]\[0-9]:\[0-5]\[0-9](\.\[0-9])$" ${Dec}]
}

proc checkFloat { f } {
 return [string is double ${f}]
}

proc RA_to_asec { RA } {
 if { [checkRA ${RA}] == 0 } { return -1 }
 set X [split ${RA} ":"]
 set H [format "%f" [lindex ${X} 0]]
 set M [format "%f" [lindex ${X} 1]]
 set S [format "%f" [lindex ${X} 2]]
 return [expr [expr ${H} * 15.0 * 3600.0] + [expr ${M} * 15.0 * 60.0] + [expr ${S} * 15.0]]
}

proc Dec_to_asec { Dec } {
 if { [checkDec ${Dec}] == 0 } { return -1 }
 set sign 1.0
 if { [string first "-" ${Dec}] == 0 } { set sign -1.0 }
 set X [split ${Dec} ":"]
 set D [format "%f" [lindex ${X} 0]]
 set M [format "%f" [lindex ${X} 1]]
 set S [format "%f" [lindex ${X} 2]]
 return [expr ${sign} * ([expr abs(${D}) * 3600.0] + [expr ${M} * 60.0] + [expr ${S} * 1.0])]
}

proc RA_from_asec { asec } {
 if { [checkFloat ${asec}] == 0 } { return "" }
 set Vs [expr ${asec} / 15.0]
 set Vh [expr ${Vs} / 3600.0]
 set X [split ${Vh} "."]
 set H [lindex ${X} 0]
 set R [expr ${Vh} - ${H}]
 set Vm [expr ${R} * 60.0]
 set X [split ${Vm} "."]
 set M [lindex ${X} 0]
 set R [expr ${Vm} - ${M}]
 set Vs [expr ${R} * 60.0]
 return [format "%02s:%02s:%04.1f" ${H} ${M} ${Vs}]
}

proc Dec_from_asec { asec } {
 if { [checkFloat ${asec}] == 0 } { return "" }
 set sign "+"
 if { [string first "-" ${asec}] == 0 } { 
  set sign "-"
 }
 set Vd [expr abs(${asec}) / 3600.0]
 set X [split ${Vd} "."]
 set D [lindex ${X} 0]
 set R [expr ${Vd} - ${D}]
 set Vm [expr ${R} * 60.0]
 set X [split ${Vm} "."]
 set M [lindex ${X} 0]
 set R [expr ${Vm} - ${M}]
 set S [expr ${R} * 60.0]
 return [format "%1s%02s:%02s:%04.1f" ${sign} ${D} ${M} ${S}]
}

proc testRADec { } {
 # RA
 set RA 12:34:56.7
 set asec [RA_to_asec ${RA}]
 puts "RA: ${RA} ${asec}"
 puts "RA: ${asec} [RA_from_asec ${asec}]"
 set RA 01:02:03.4
 set asec [RA_to_asec ${RA}]
 puts "RA: ${RA} ${asec}"
 puts "RA: ${asec} [RA_from_asec ${asec}]"
 set RA 00:00:00.0
 set asec [RA_to_asec ${RA}]
 puts "RA: ${RA} ${asec}"
 puts "RA: ${asec} [RA_from_asec ${asec}]"
 set RA 23:59:59.9
 set asec [RA_to_asec ${RA}]
 puts "RA: ${RA} ${asec}"
 puts "RA: ${asec} [RA_from_asec ${asec}]"
 puts "RA: ${asec} [expr 86399.9 * 15.0] (day test)"
 # Dec
 set Dec 12:34:56.7
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec -12:34:56.7
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec 01:02:03.4
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec -01:02:03.4
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec 00:00:00.0
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec 45:46:47.8
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec -45:46:47.8
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec 89:59:59.9
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
 set Dec -89:59:59.9
 set asec [Dec_to_asec ${Dec}]
 puts "Dec: ${Dec} ${asec}"
 puts "Dec: ${asec} [Dec_from_asec ${asec}]"
}
