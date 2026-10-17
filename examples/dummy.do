version 17
set more off
* 虚拟变量：0/1 编码
sysuse auto, clear
summarize price
local mean_price = r(mean)
generate byte pricerank = (price >= `mean_price') if !missing(price)
label define tutorial_price_rank 0 "低价" 1 "高价"
label values pricerank tutorial_price_rank
tabulate pricerank foreign, row
tabulate foreign, generate(origin_)
list make price pricerank origin_1 origin_2 in 1/5, noobs
