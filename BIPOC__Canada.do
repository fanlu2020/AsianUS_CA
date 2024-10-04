cd "C:\Users\Fan\Documents\FanLu\Academic_Fan\Davis\Intersectionality"
clear
use bipoc_FL.dta
use bipoc_FLworking.dta //for analysis


tab race
tab gender
tab winner

keep if raceindig==1

gen ethnic=.

replace ethnic=1 if race=="South Asian"| race=="South Asian "

replace ethnic=2 if race=="Southeast Asian"| race=="Southeast Asian "

replace ethnic=3 if race=="East Asian"| race=="East Asian "

label variable ethnic "1=South Asian 2=Southeast Asian 3=East Asian"

*Everyone
tab gender ethnic, col

*Winners
tab gender ethnic if winner==1, col


