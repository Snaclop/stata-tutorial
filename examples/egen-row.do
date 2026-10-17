version 17
set more off
* egen rowmean：在同一行跨变量计算
sysuse auto, clear
* 用同一车型的价格构造两份教学报价，不混合不同单位。
generate double quote_low = price * .95
generate double quote_high = price * 1.05
replace quote_low = . if missing(rep78)
egen double price_mean = rowmean(price quote_low quote_high)
egen double price_min = rowmin(price quote_low quote_high)
egen double price_max = rowmax(price quote_low quote_high)
list make price quote_low quote_high price_mean price_min price_max in 1/5, noobs
list make price_mean if missing(quote_low), noobs
