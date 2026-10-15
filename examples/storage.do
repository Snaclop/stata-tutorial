version 17
set more off
* 存储类型：byte、long、float 与 double
clear
set obs 1
generate float small_precision = 123456789
generate double high_precision = 123456789
generate double copied_later = small_precision
generate str3 code = "001"
format small_precision high_precision copied_later %15.0f
list, noobs
describe
recast double small_precision
list, noobs
