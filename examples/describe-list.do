version 17
set more off
* describe、list 与 count
sysuse auto, clear
describe
codebook make rep78
list make price mpg in 1/5, noobs
count if missing(rep78)
