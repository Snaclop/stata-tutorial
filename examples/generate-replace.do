version 17
set more off
* generate 与 replace：创建和修改
sysuse auto, clear
generate double price_sq = price^2
generate double rep78new = rep78
summarize rep78
local repair_mean = r(mean)
replace rep78new = `repair_mean' if missing(rep78new)
list make rep78 rep78new if missing(rep78), noobs
summarize rep78 rep78new price_sq
