version 17
set more off
* set：建立运行环境
sysuse auto, clear
local old_type "`c(type)'"
set more off
set type double
generate price_thousand = price / 1000
describe price_thousand
list make price price_thousand in 1/5, noobs
set type `old_type'
