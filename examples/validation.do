version 17
set more off
* assert 与 isid：让数据规则可以检查
sysuse auto, clear
isid make
assert !missing(make, price, mpg)
assert price > 0
assert inlist(foreign, 0, 1)
assert inrange(rep78, 1, 5) if !missing(rep78)
count if missing(rep78)
list make rep78 if missing(rep78), noobs
