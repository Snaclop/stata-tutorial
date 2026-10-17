version 17
set more off
* tsset 与 L. / F. / D.：按时间取值
sysuse auto, clear
keep in 1/6
* 人为行序只用于演示时间算子的查找规则，不是真实时间序列。
generate int obs_order = _n
drop if obs_order == 3
tsset obs_order
generate int lag_price = L.price
generate int change = D.price
list make obs_order price lag_price change, noobs
