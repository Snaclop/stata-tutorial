version 17
set more off
* xtset 与 xtreg：面板数据和固定效应
clear
set seed 20261021
set obs 100
generate int id = _n
generate double unit_effect = rnormal()
expand 5
bysort id: generate int year = 2015 + _n
generate double x = unit_effect + rnormal()
generate double y = 2 + 1.5*x + unit_effect + .2*(year-2016) + rnormal()
isid id year
xtset id year
xtdescribe
xtreg y x i.year, fe vce(cluster id)
estimates store panel_fe
xtreg y x i.year, re vce(cluster id)
estimates store panel_re
estimates table panel_fe panel_re, b(%9.3f) se(%9.3f) stats(N)
estimates restore panel_fe
