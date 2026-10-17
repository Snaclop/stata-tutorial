version 17
set more off
* DID：处理组、对照组与政策前后
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
regress y i.treat##i.post, vce(cluster id)
estimates store did_pooled
xtset id year
xtreg y did i.year, fe vce(cluster id)
estimates store did_fe
display "DID estimate = " _b[did]
tabulate treat post
estimates table did_pooled did_fe, b(%9.3f) se(%9.3f) stats(N)
