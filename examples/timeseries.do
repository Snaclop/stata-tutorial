version 17
set more off
* tsset 与 L. / F. / D.：按时间取值
clear
input int year int sales
2020 100
2021 120
2023 150
2024 180
end
tsset year
generate lag_sales = L.sales
generate change = D.sales
list, noobs
