version 17
set more off
* import excel：读取 Excel 数据
clear
input str4 item quantity double price
"A001" 2 12.5
"A002" 3 8.25
"A003" 1 20
end
export excel using "tutorial_import.xlsx", sheet("scores") firstrow(variables) replace
clear
import excel using "tutorial_import.xlsx", describe
import excel using "tutorial_import.xlsx", sheet("scores") cellrange(A1:C4) firstrow case(lower) clear
describe
list, noobs
