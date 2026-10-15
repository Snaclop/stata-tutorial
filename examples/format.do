version 17
set more off
* format：控制小数位和显示方式
clear
input double amount
1234.567
8.234
end
generate double original = amount
format amount %12.2fc
list amount, noobs
assert amount == original
generate double rounded = round(amount, .01)
format original %12.3f
format rounded %12.2f
list amount original rounded, noobs
display %9.3f 10/3
