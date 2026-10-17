version 17
set more off
* return list 与 r()：读取结果
sysuse auto, clear
summarize price, detail
return list
display r(mean)
display r(max) / r(min)
local price_mean = r(mean)
generate byte high_price = (price >= `price_mean') if !missing(price)
tabulate high_price
