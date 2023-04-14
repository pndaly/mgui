proc mguiGetRandomOffsets { N Rl Ru Dl Du } {

 # initial offset should always be the field center
 set OF {0.0\t0.0}

 # generate random offsets for Rl < RA < Ru and Dl < Dec < Du
 for { set i 0 } { $i < ${N} } { incr i } {
  lappend OF [format "%.1f\t%.1f" [mguiRandom ${Rl} ${Ru}] [mguiRandom ${Dl} ${Du}]]
 }

 # return offset(s)
 return ${OF}
}

proc mguiGetFileOffsets { F } {

 # initial offset should always be the field center
 set OF {0.0\t0.0}

 # get file
 set FN [glob -nocomplain ${F}]
 if { ${FN} == "" } {
  mguiInform "ERROR: ${F} doesn't exist"
  return ${OF}
 }

 # read offset(s) from file
 set FP [open ${FN} r]
 while { [gets ${FP} T] > 0 } {
  if { [string index ${T} 0] != "#" } { lappend OF ${T} }
 } 
 close ${FP}

 # return offset(s)
 return ${OF}
}

proc mguiGetRADecOffsets { Roff Doff N M } {

 # initial offset should always be the field center
 set OF {0.0\t0.0}

 # set default(s)
 set DTHIR [expr ${Roff}*(${N}-1)/(-2)]
 set DTHID [expr ${Doff}*(${M}-1)/(-2)]
 set DTHHR ${DTHIR}
 set DTHHD ${DTHID}
 set NOCOFFT "${DTHIR} ${DTHID}"
 lappend OF ${NOCOFFT}

 # do RA x Dec
 set Rdir 1
 set Ddir 1
 for { set Didx 1 } { ${Didx} <= ${M} } { incr Didx } {
  for { set Ridx 1 } { ${Ridx} <= ${N} } { incr Ridx } {
   if { ${Ridx} > 1 } {
    set NOCOFFT "[expr ${Roff} * ${Rdir}] 0"
    set DTHHR [expr ${DTHHR} + [expr ${Roff} * ${Rdir}]]
    lappend OF ${NOCOFFT}
   }
  }
  if { ${Didx} < ${M} } {
   set NOCOFFT "0 ${Doff}" 
   set DTHHD [expr ${DTHHD} + [expr ${Doff} * ${Ddir}]]
   lappend OF ${NOCOFFT}
  }
  set Rdir [expr ${Rdir} * -1] 
 }

 # final field center offset
 set NOCOFFT "[expr ${DTHHR} * (-1)] [expr ${DTHHD} * (-1)]"
 lappend OF ${NOCOFFT}

 # return offset(s)
 return ${OF}
}

proc mguiRandom { L U } {
 return [format "%.1f" [expr { (rand()*(${U}-${L}+1))+${L} }]]
}
