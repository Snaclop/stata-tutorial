version 17
set more off
* 异常值与缩尾：先核查，再决定处理
sysuse auto, clear
quietly summarize price, detail
local iqr = r(p75) - r(p25)
local lo = r(p25) - 1.5 * `iqr'
local hi = r(p75) + 1.5 * `iqr'
local p10 = r(p10)
local p90 = r(p90)
generate byte outlier_iqr = (price < `lo' | price > `hi') if !missing(price)
clonevar price_w = price
replace price_w = `p10' if price < `p10' & !missing(price)
replace price_w = `p90' if price > `p90' & !missing(price)
tabulate outlier_iqr
list make price price_w if price != price_w, noobs
