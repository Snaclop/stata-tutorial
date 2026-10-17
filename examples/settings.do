version 17
set more off
* version / set：建立清楚的运行环境
sysuse auto, clear
version 17
local old_more "`c(more)'"
local old_linesize = c(linesize)
local old_type "`c(type)'"
set more off
set linesize 100
set type double
generate price_thousand = price / 1000
describe price_thousand
list make price price_thousand in 1/5, noobs
set type `old_type'
set linesize `old_linesize'
set more `old_more'
