version 17
set more off
* recode：按阈值划分类别
clear
input age
38
39
40
42
43
.
end
recode age (min/39=1) (39/42=2) (42/max=3), generate(age_group)
generate group0=irecode(age,39,42)
list, noobs
