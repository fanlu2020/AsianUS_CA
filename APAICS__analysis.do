cd "C:\Users\Fan\Documents\FanLu\Academic_Fan\Davis\Intersectionality"
clear
use combinedAPAICS_FLu2024.dta

tab fan_edited_ethnicity, missing
tab gender, missing

gen ethnic=.

replace ethnic=1 if fan_edited_ethnicity=="Bangladeshi"| fan_edited_ethnicity=="Bengali"|fan_edited_ethnicity=="Pakistani"|fan_edited_ethnicity=="Pakistani,Kashmiri"|fan_edited_ethnicity=="South Asian"|fan_edited_ethnicity=="Indian"|fan_edited_ethnicity=="Punjabi" ///
|fan_edited_ethnicity=="Bangladeshi "|fan_edited_ethnicity=="Indian,Punjabi"|fan_edited_ethnicity=="Sikh"|fan_edited_ethnicity=="Nepali"

replace ethnic=2 if fan_edited_ethnicity=="Cambodian"| fan_edited_ethnicity=="Filipino"|fan_edited_ethnicity=="Hmong"|fan_edited_ethnicity=="Laotian"|fan_edited_ethnicity=="Vietnamese"|fan_edited_ethnicity=="Vietnamese,Laotian"|fan_edited_ethnicity=="Chinese,Filipino" 

replace ethnic=3 if fan_edited_ethnicity=="Chinese"|fan_edited_ethnicity=="Korean"|fan_edited_ethnicity=="Japanese"|fan_edited_ethnicity=="East Asian"|fan_edited_ethnicity=="Taiwanese"|fan_edited_ethnicity=="Hong Kong" ///
|fan_edited_ethnicity=="Japanese,Korean"|fan_edited_ethnicity=="Taiwanese,Chinese"

/*
Alex Pan: Taiwanese/Chinese
TJ Cox: Chinese/Filipino, grouped as Filipino
Linh Song: Vietnamese/Laotian
Sam Kong: Japanese/Korean

*/

label variable ethnic "1=South Asian 2=Southeast Asian 3=East Asian"
tab ethnic

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


