version 17
set more off
* use、sysuse 与 input
clear
input int id str12 city double gdp
1 "甲市" 120.5
2 "乙市" 230.8
3 "丙市" 160.2
end
describe
list, noobs
