version 17
set more off
* if 与 in：选择观测
sysuse auto, clear
list make price in 1/5, noobs
list make price in 1/5 if price > 4000 & price < 7000, noobs
count if price >= 15000 | price <= 3300
summarize price if foreign == 1
count if rep78 > 4 & !missing(rep78)
