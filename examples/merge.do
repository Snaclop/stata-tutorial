version 17
set more off
* merge：按键匹配数据
clear
tempfile cityinfo
input byte city str8 region
1 "North"
2 "South"
end
isid city
save "`cityinfo'"
clear
input byte id byte city int spending
1 1 120
2 1 150
3 2 180
4 3 100
end
isid id
merge m:1 city using "`cityinfo'", keepusing(region) generate(match_status)
tabulate match_status
list, noobs
