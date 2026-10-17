version 17
set more off
* 事件研究：设定基准期与检查政策前趋势
clear
set seed 20261019
set obs 80
generate int id = _n
generate byte treat = (id <= 40)
generate double unit_effect = rnormal()
expand 6
bysort id: generate int year = 2011 + _n
generate byte post = (year >= 2015)
generate byte did = treat * post
generate double y = 10 + unit_effect + .5*(year-2012) + 2*did + .5*rnormal()
isid id year
generate int event_time = year - 2015
forvalues k = 2/3 {
    generate byte lead`k' = treat * (event_time == -`k')
}
forvalues k = 0/2 {
    generate byte lag`k' = treat * (event_time == `k')
}
xtset id year
xtreg y lead3 lead2 lag0 lag1 lag2 i.year, fe vce(cluster id)
test lead3 lead2
lincom lag0
list id year event_time lead3 lead2 lag0 lag1 lag2 in 1/6, noobs
