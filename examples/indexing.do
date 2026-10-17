version 17
set more off
* _n、_N 与下标：编号和引用
sysuse auto, clear
generate int id = _n
sort price id
generate int price_rank = _n
generate int max_price = price[_N]
generate int previous_price = price[_n-1]
generate byte class = cond(_n <= _N/2, 1, 2)
label define tutorial_price_half 1 "低价一半" 2 "高价一半"
label values class tutorial_price_half
bysort class (price id): generate int groupid = _n
by class: generate int group_size = _N
tabulate class
list id make class price price_rank groupid group_size if groupid <= 3, sepby(class) noobs
