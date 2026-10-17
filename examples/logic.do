version 17
set more off
* cond、inlist 与 inrange
sysuse auto, clear
generate byte repair_ok = cond(missing(rep78), ., rep78 >= 3)
generate byte selected = inlist(rep78, 1, 5) if !missing(rep78)
generate byte legal_mpg = inrange(mpg, 12, 41)
list make rep78 repair_ok selected legal_mpg in 1/5, noobs
list make rep78 repair_ok if missing(rep78), noobs
