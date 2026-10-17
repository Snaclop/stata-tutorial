version 17
set more off
* egen：生成全样本与分组统计量
sysuse auto, clear
egen double overall_price = mean(price)
bysort foreign: egen double mean_price = mean(price)
bysort foreign: egen double total_price = total(price)
bysort foreign: egen int car_count = count(price)
egen int group_id = group(foreign rep78), missing
sort foreign make
list make foreign price mean_price total_price car_count in 1/5, noobs
tabulate foreign, summarize(price)
