cd "C:\Users\Fan\Documents\FanLu\Academic_Fan\Davis\Intersectionality"
clear
use bipoc_FLworking.dta

tab race
tab gender
tab winner

keep if raceindig==1

gen ethnic=0

replace ethnic=1 if race=="South Asian"| race=="South Asian "

replace ethnic=2 if race=="East Asian"| race=="East Asian "

replace ethnic=3 if race=="Southeast Asian"| race=="Southeast Asian "

*label variable ethnic "0=other 1=Pacific Isl 2=South Asian 3=Southeast Asian 4=East Asian"

label variable ethnic "1=South Asian 2=Southeast Asian 3=East Asian"

*Everyone
tab gender ethnic, col

*Winners
tab gender ethnic if winner==1, col


compress
*** memory saving device 
save "bipoc_FLworking.dta",replace


/*Proportion of females	in U.S. 
	
East Asian (Chinese, Taiwanese, Japanese, Korean)	0.542936662
South Asian 	0.481570792
Southeast Asian	0.540554773
Asian	0.521640346 

*Propotion of females in Canada
	South Asian	East Asian	Southeast Asian	Total	
Total	2100730	2125400	1189265	5415395	
Female	1037230	1125585	650885	2813700	
proportion	0.493747412	0.529587372	0.547300223	0.519574288	
