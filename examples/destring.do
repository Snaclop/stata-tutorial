version 17
set more off
* destring 与 encode：两种字符串转换
sysuse auto, clear
tostring price, generate(price_text)
destring price_text, generate(price_numeric)
generate str8 origin_text = "Domestic" if foreign == 0
replace origin_text = "Foreign" if foreign == 1
encode origin_text, generate(origin_id)
describe price price_text price_numeric origin_text origin_id
list make price_text price_numeric origin_text origin_id in 1/5, noobs
