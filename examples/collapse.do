version 17
set more off
* collapse：把明细表汇总成分组表
sysuse auto, clear
recast double price
collapse (count) car_count=price (sum) total_price=price ///
    (mean) mean_price=price (sd) sd_price=price, by(foreign)
generate double average_price = total_price / car_count
list, noobs
