version 17
set more off
* version / set：建立清楚的运行环境
clear
version 17
local old_more "`c(more)'"
local old_linesize = c(linesize)
local old_type "`c(type)'"
set more off
set linesize 100
set type double
set obs 3
generate value = _n / 10
describe value
list, noobs
set type `old_type'
set linesize `old_linesize'
set more `old_more'
