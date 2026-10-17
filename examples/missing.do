version 17
set more off
* 缺失值与 missing()
sysuse auto, clear
count if rep78 > 4
count if rep78 > 4 & !missing(rep78)
count if missing(rep78)
summarize rep78
list make rep78 if missing(rep78), noobs
