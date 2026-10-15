version 17
set more off
* egen：生成全样本与分组统计量
clear
input byte id class double score
1 1 60
2 1 80
3 1 .
4 2 90
5 2 100
end
egen double overall = mean(score)
bysort class: egen double class_mean = mean(score)
by class: egen class_n = count(score)
by class: generate class_rows = _N
by class: egen double class_total = total(score)
generate double centered = score - class_mean
list, noobs sepby(class)
