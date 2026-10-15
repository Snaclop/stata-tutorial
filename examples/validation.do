version 17
set more off
* assert 与 isid：让数据规则可以检查
clear
input byte id int year double a b total score
1 2024 10 20 30 85
1 2025 12 21 33 .
2 2024 8 17 25 92
end
isid id year
assert !missing(id, year)
assert total == a + b
assert inrange(score, 0, 100) if !missing(score)
count if missing(score)
list id year score if missing(score), noobs
