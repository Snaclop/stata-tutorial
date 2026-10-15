version 17
set more off
* duplicates：发现重复并谨慎去重
clear
input byte id int year double score
1 2024 80
1 2024 80
1 2025 90
2 2024 70
2 2024 75
end
duplicates report
duplicates tag id year score, generate(exactdup)
list if exactdup > 0, noobs
drop exactdup
duplicates drop
duplicates tag id year, generate(keydup)
list if keydup > 0, noobs
list, noobs
