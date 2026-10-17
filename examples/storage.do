version 17
set more off
* 存储类型：byte、long、float 与 double
sysuse auto, clear
generate float small_precision = 123456789
generate double high_precision = 123456789
generate double copied_later = small_precision
format small_precision high_precision copied_later %15.0f
list make small_precision high_precision copied_later in 1/3, noobs
describe small_precision high_precision copied_later
recast double small_precision
list make small_precision high_precision copied_later in 1/3, noobs
