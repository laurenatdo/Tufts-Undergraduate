clear
*Combining all of the data
use "/Users/LaurenDo/Documents/Tufts Junior/EC 136 - McMillan/Research Paper/AB_Wave_1.dta"
append using "/Users/LaurenDo/Documents/Tufts Junior/EC 136 - McMillan/Research Paper/AB_Wave_3.dta"
append using "/Users/LaurenDo/Documents/Tufts Junior/EC 136 - McMillan/Research Paper/AB_Wave_4.dta"
*Defining period dummy variables
gen pdum_1=1 if period==1
gen pdum_3=1 if period==3
gen pdum_4=1 if period==4
replace pdum_1=0 if period==3|period==4
replace pdum_3=0 if period==1|period==4
replace pdum_4=0 if period==1|period==3
*Saving new master data set
save "/Users/LaurenDo/Documents/Tufts Junior/EC 136 - McMillan/Research Paper/AB_Wave_All.dta"
*Regressing satisfaction of government against perception of life (all data)
reg gov_q econ_q safe_q health_q edu_q
*Regressing satisfaction of government against perception of life (Wave 4)
reg gov_q econ_q safe_q health_q edu_q if period==4
*Regress using period dummies
reg gov_q econ_q safe_q health_q pdum_3 pdum_4


