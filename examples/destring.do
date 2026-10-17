version 17
set more off
* destring 与 encode：两种字符串转换
sysuse auto, clear
tostring price, generate(price_text)
destring price_text, generate(price_numeric)
decode foreign, generate(origin_text)
encode origin_text, generate(origin_id)
describe price price_text price_numeric origin_text origin_id
list make price_text price_numeric origin_text origin_id in 1/5, noobs
