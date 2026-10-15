version 17
set more off
* destring 与 encode：两种字符串转换
clear
input str8 amount_text str5 share_text str5 region
"1,250" "25%" "North"
"800" "50%" "South"
"" "" "North"
end
destring amount_text, generate(amount) ignore(",")
destring share_text, generate(share) percent
encode region, generate(region_id)
describe
list, noobs
list region region_id, nolabel noobs
