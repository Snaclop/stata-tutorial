version 17
set more off
* 数学函数：对数、平方根和取整
sysuse auto, clear
generate double log_price = ln(price) if price > 0 & !missing(price)
generate double root_weight = sqrt(weight) if weight >= 0 & !missing(weight)
generate double centered_mpg = (mpg - 25) / 10
generate trunc_mpg = int(centered_mpg)
generate down_mpg = floor(centered_mpg)
generate up_mpg = ceil(centered_mpg)
list make log_price root_weight centered_mpg trunc_mpg down_mpg up_mpg in 1/5, noobs
