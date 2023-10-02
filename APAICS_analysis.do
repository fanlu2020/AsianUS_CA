cd "C:\Users\Fan\Documents\FanLu\Academic_Fan\Davis\Intersectionality"
clear
use APAICS_FL.dta
use APAICS_FLworking.dta

tab fan_edited_ethnicity
tab gender

gen ethnic=0

*replace ethnic=0 if fan_edited_ethnicity=="Arab"|fan_edited_ethnicity=="Jordanian"|fan_edited_ethnicity=="Iranian"|fan_edited_ethnicity=="Mixed"|fan_edited_ethnicity=="Muslim"|fan_edited_ethnicity=="Chinese,Filipino"

*replace ethnic=1 if fan_edited_ethnicity=="Guamanian"|fan_edited_ethnicity=="Hawaiian"|fan_edited_ethnicity=="Northern  Mariana Island"|fan_edited_ethnicity=="Samoan"

replace ethnic=1 if fan_edited_ethnicity=="Bangladeshi"| fan_edited_ethnicity=="Bengali"|fan_edited_ethnicity=="Pakistani"|fan_edited_ethnicity=="Pakistani,Kashmiri"|fan_edited_ethnicity=="South Asian"|fan_edited_ethnicity=="Indian"|fan_edited_ethnicity=="Punjabi" ///
|fan_edited_ethnicity=="Bangladeshi " |fan_edited_ethnicity=="Indian,Punjabi "|fan_edited_ethnicity=="Sikh"

replace ethnic=2 if fan_edited_ethnicity=="Cambodian"| fan_edited_ethnicity=="Filipino"|fan_edited_ethnicity=="Hmong"|fan_edited_ethnicity=="Lao"|fan_edited_ethnicity=="Laotian"|fan_edited_ethnicity=="Vietnamese"|fan_edited_ethnicity=="Vietnamese,Laotian" ///
|fan_edited_ethnicity=="Filipinx"

replace ethnic=3 if fan_edited_ethnicity=="Chinese"|fan_edited_ethnicity=="Korean"|fan_edited_ethnicity=="Japanese"|fan_edited_ethnicity=="East Asian"|fan_edited_ethnicity=="Taiwanese"|fan_edited_ethnicity=="Hong Kong" |fan_edited_ethnicity=="Taiwanese" ///
|fan_edited_ethnicity=="Japanese, Korean"|fan_edited_ethnicity=="Japanese,Chinese"

*label variable ethnic "0=other 1=Pacific Isl 2=South Asian 3=Southeast Asian 4=East Asian"

label variable ethnic "1=South Asian 2=Southeast Asian 3=East Asian"

*Everyone
tab gender ethnic
tab gender ethnic if level=="Federal", col
tab gender ethnic if level=="State"|level=="Statewide", col
tab gender ethnic if level=="Local", col

*Winners
tab gender ethnic if generalresult=="Won", col
tab gender ethnic if generalresult=="Won" & level=="Federal", col
tab gender ethnic if generalresult=="Won" & level=="State"|level=="Statewide", col
tab gender ethnic if generalresult=="Won" & level=="Local", col


tab ethnic gender if generalresult=="Won", col // Win general


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


gen SA=0
replace SA=1 if ethnic==1

gen EA=0
replace EA=1 if ethnic==3


foreach v of var gender fan_edited_party level primaryresult incrunning generalresult {
        	encode `v', gen(E`v')
        }

recode Egender (2=0)(.=0), gen(female)

gen Dem=0
replace Dem=1 if Efan_edited_party==1


gen Rep=0
replace Rep=1 if Efan_edited_party==5

gen statelevel=0
replace statelevel=1 if Elevel==3| Elevel==4

gen localevel=0
replace localevel=1 if Elevel==2

gen challenge=0
replace challenge=1 if Eincrunning!=3 // non-incumbent: challenger or running in open seat

recode Eprimaryresult (5=1) (3=1) (else=0), gen (won_primary) // 5=won, 3=unopposed

recode Egeneralresult (2=.)(4=1)(else=0), gen (won_general)

tab primaryresult generalresult, missing

heckman won_general female Dem Rep SA EA challenge statelevel, select (won_primary female Dem Rep SA EA challenge statelevel) 

heckman won_general i.female##i.SA  i.female##i.EA Dem Rep challenge statelevel, select (won_primary  i.female##i.SA  i.female##i.EA Dem Rep challenge statelevel) 

logit won_general female Dem Rep SA EA challenge statelevel localevel

logit won_general i.female##i.SA i.female##i.EA Dem Rep challenge statelevel localevel

margins female#SA
margins female#EA
marginsplot

 */

compress
*** memory saving device 
save "APAICS_FLworking.dta",replace
