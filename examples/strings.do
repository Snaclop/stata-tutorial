version 17
set more off
* subinstr：替换字符串中的指定内容
sysuse auto, clear
generate make_compact = subinstr(make, " ", "", .)
generate make_first = subinstr(make, " ", "-", 1)
list make make_compact make_first in 1/5, noobs
