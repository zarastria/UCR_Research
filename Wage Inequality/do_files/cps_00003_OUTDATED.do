* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
set mem 100m
set matsize 1000
quietly infix              ///
  int     year      1-4    ///
  long    serial    5-9    ///
  float   hwtsupp   10-19  ///
  byte    statefip  20-21  ///
  byte    month     22-23  ///
  float   wtsupp    24-31  ///
  byte    age       32-33  ///
  byte    sex       34-34  ///
  byte    marst     35-35  ///
  int     educ      36-38  ///
  int     occ       39-42  ///
  byte    durunemp  43-44  ///
  long    incwage   45-50  ///
  using `"cps_00003.dat"'

replace hwtsupp  = hwtsupp  / 10000
replace wtsupp   = wtsupp   / 100

format hwtsupp  %10.4f
format wtsupp   %8.2f

label var year     `"Survey year"'
label var serial   `"Household serial number"'
label var hwtsupp  `"Household weight, Supplement"'
label var statefip `"State (FIPS code)"'
label var month    `"Month"'
label var wtsupp   `"Supplement Weight"'
label var age      `"Age"'
label var sex      `"Sex"'
label var marst    `"Marital status"'
label var educ     `"Educational attainment recode"'
label var occ      `"Occupation"'
label var durunemp `"Continuous weeks unemployed"'
label var incwage  `"Wage and salary income"'

label define hwtsupp_lbl 0000000000 `"0000000000"'
label values hwtsupp hwtsupp_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 69 `"Nebraska-North Dakota-South Dakota"', add
label define statefip_lbl 70 `"Maine-Massachusetts-New Hampshire-Rhode Island-Vermont"', add
label define statefip_lbl 71 `"Michigan-Wisconsin"', add
label define statefip_lbl 72 `"Minnesota-Iowa"', add
label define statefip_lbl 73 `"Nebraska-North Dakota-South Dakota-Kansas"', add
label define statefip_lbl 74 `"Delaware-Virginia"', add
label define statefip_lbl 75 `"North Carolina-South Carolina"', add
label define statefip_lbl 76 `"Alabama-Mississippi"', add
label define statefip_lbl 77 `"Arkansas-Oklahoma"', add
label define statefip_lbl 78 `"Arizona-New Mexico-Colorado"', add
label define statefip_lbl 79 `"Idaho-Wyoming-Utah-Montana-Nevada"', add
label define statefip_lbl 80 `"Alaska-Washington-Hawaii"', add
label define statefip_lbl 81 `"New Hampshire-Maine-Vermont-Rhode Island"', add
label define statefip_lbl 83 `"South Carolina-Georgia"', add
label define statefip_lbl 84 `"Kentucky-Tennessee"', add
label define statefip_lbl 85 `"Arkansas-Louisiana-Oklahoma"', add
label define statefip_lbl 87 `"Iowa-N Dakota-S Dakota-Nebraska-Kansas-Minnesota-Missouri"', add
label define statefip_lbl 88 `"Washington-Oregon-Alaska-Hawaii"', add
label define statefip_lbl 89 `"Montana-Wyoming-Colorado-New Mexico-Utah-Nevada-Arizona"', add
label define statefip_lbl 90 `"Delaware-Maryland-Virginia-West Virginia"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define age_lbl 00 `"Under 1 year"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define marst_lbl 1 `"Married, spouse present"'
label define marst_lbl 2 `"Married, spouse absent"', add
label define marst_lbl 3 `"Separated"', add
label define marst_lbl 4 `"Divorced"', add
label define marst_lbl 5 `"Widowed"', add
label define marst_lbl 6 `"Never married/single"', add
label define marst_lbl 9 `"Unknown"', add
label values marst marst_lbl

label define educ_lbl 000 `"NIU or no schooling"'
label define educ_lbl 001 `"NIU"', add
label define educ_lbl 002 `"None or preschool"', add
label define educ_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_lbl 011 `"Grade 1"', add
label define educ_lbl 012 `"Grade 2"', add
label define educ_lbl 013 `"Grade 3"', add
label define educ_lbl 014 `"Grade 4"', add
label define educ_lbl 020 `"Grades 5 or 6"', add
label define educ_lbl 021 `"Grade 5"', add
label define educ_lbl 022 `"Grade 6"', add
label define educ_lbl 030 `"Grades 7 or 8"', add
label define educ_lbl 031 `"Grade 7"', add
label define educ_lbl 032 `"Grade 8"', add
label define educ_lbl 040 `"Grade 9"', add
label define educ_lbl 050 `"Grade 10"', add
label define educ_lbl 060 `"Grade 11"', add
label define educ_lbl 070 `"Grade 12"', add
label define educ_lbl 071 `"12th grade, no diploma"', add
label define educ_lbl 072 `"12th grade, diploma unclear"', add
label define educ_lbl 073 `"High school diploma or equivalent"', add
label define educ_lbl 080 `"1 year of college"', add
label define educ_lbl 081 `"Some college but no degree"', add
label define educ_lbl 090 `"2 years of college"', add
label define educ_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_lbl 092 `"Associate's degree, academic program"', add
label define educ_lbl 100 `"3 years of college"', add
label define educ_lbl 110 `"4 years of college"', add
label define educ_lbl 111 `"Bachelor's degree"', add
label define educ_lbl 120 `"5+ years of college"', add
label define educ_lbl 121 `"5 years of college"', add
label define educ_lbl 122 `"6+ years of college"', add
label define educ_lbl 123 `"Master's degree"', add
label define educ_lbl 124 `"Professional school degree"', add
label define educ_lbl 125 `"Doctorate degree"', add
label define educ_lbl 999 `"Missing/Unknown"', add
label values educ educ_lbl

label define occ_lbl 0000 `"0"'
label define occ_lbl 0001 `"1"', add
label define occ_lbl 0002 `"2"', add
label define occ_lbl 0003 `"3"', add
label define occ_lbl 0004 `"4"', add
label define occ_lbl 0005 `"5"', add
label define occ_lbl 0006 `"6"', add
label define occ_lbl 0007 `"7"', add
label define occ_lbl 0008 `"8"', add
label define occ_lbl 0009 `"9"', add
label define occ_lbl 0010 `"10"', add
label define occ_lbl 0011 `"11"', add
label define occ_lbl 0012 `"12"', add
label define occ_lbl 0013 `"13"', add
label define occ_lbl 0014 `"14"', add
label define occ_lbl 0015 `"15"', add
label define occ_lbl 0016 `"16"', add
label define occ_lbl 0017 `"17"', add
label define occ_lbl 0018 `"18"', add
label define occ_lbl 0019 `"19"', add
label define occ_lbl 0020 `"20"', add
label define occ_lbl 0021 `"21"', add
label define occ_lbl 0022 `"22"', add
label define occ_lbl 0023 `"23"', add
label define occ_lbl 0024 `"24"', add
label define occ_lbl 0025 `"25"', add
label define occ_lbl 0026 `"26"', add
label define occ_lbl 0027 `"27"', add
label define occ_lbl 0028 `"28"', add
label define occ_lbl 0029 `"29"', add
label define occ_lbl 0030 `"30"', add
label define occ_lbl 0031 `"31"', add
label define occ_lbl 0032 `"32"', add
label define occ_lbl 0033 `"33"', add
label define occ_lbl 0034 `"34"', add
label define occ_lbl 0035 `"35"', add
label define occ_lbl 0036 `"36"', add
label define occ_lbl 0037 `"37"', add
label define occ_lbl 0099 `"99"', add
label values occ occ_lbl

label define durunemp_lbl 00 `"0"'
label define durunemp_lbl 98 `"98"', add
label values durunemp durunemp_lbl

label define incwage_lbl 999999 `"999999"'
label values incwage incwage_lbl

/*ssc install outreg*/

drop if durunemp == 0 | age > 65 | age < 25
gen age2 = age^2
gen educ2 = educ^2

/*=============================================================
wage disparity across state occupation and marital status

sort statefip occ marst
by statefip occ marst: egen incwage_10 = pctile(incwage), p(10)
by statefip occ marst: egen incwage_50 = pctile(incwage), p(50)
by statefip occ marst: egen incwage_75 = pctile(incwage), p(75)
by statefip occ marst: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Naive regressions*
reg durunemp wagedist_10_90
reg durunemp wagedist_10_50
reg durunemp wagedist_50_90
reg durunemp wagedist_50_75
reg durunemp wagedist_75_90
reg durunemp wagedist_10_75

*semi-Naive regresions*
reg durunemp wagedist_10_90 age sex educ educ2
reg durunemp wagedist_10_50 age sex educ educ2
reg durunemp wagedist_50_90 age sex educ educ2
reg durunemp wagedist_50_75 age sex educ educ2
reg durunemp wagedist_75_90 age sex educ educ2
reg durunemp wagedist_10_75 age sex educ educ2

============================================================*/

/*=============================================================
wage disparity across state and occupation*/

sort statefip occ
by statefip occ: egen incwage_10 = pctile(incwage), p(10)
by statefip occ: egen incwage_50 = pctile(incwage), p(50)
by statefip occ: egen incwage_75 = pctile(incwage), p(75)
by statefip occ: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75

*Naive regressions*
reg durunemp wagedist_10_90
reg durunemp wagedist_10_50
reg durunemp wagedist_50_90
reg durunemp wagedist_50_75
reg durunemp wagedist_75_90

*semi-Naive regresions*
reg durunemp wagedist_10_90 age sex educ educ2
reg durunemp wagedist_10_50 age sex educ educ2
reg durunemp wagedist_50_90 age sex educ educ2
reg durunemp wagedist_50_75 age sex educ educ2
reg durunemp wagedist_75_90 age sex educ educ2

/*============================================================*/

/*=============================================================
wage disparity across state

sort statefip
by statefip: egen incwage_10 = pctile(incwage), p(10)
by statefip: egen incwage_50 = pctile(incwage), p(50)
by statefip: egen incwage_75 = pctile(incwage), p(75)
by statefip: egen incwage_90 = pctile(incwage), p(90)
============================================================*/

/*=============================================================
wage disparity across occupation

sort occ
by occ: egen incwage_10 = pctile(incwage), p(10)
by occ: egen incwage_50 = pctile(incwage), p(50)
by occ: egen incwage_75 = pctile(incwage), p(75)
by occ: egen incwage_90 = pctile(incwage), p(90)
============================================================*/

/*============================================================
wage disparity across marital status

sort marst
by marst: egen incwage_10 = pctile(incwage), p(10)
by marst: egen incwage_50 = pctile(incwage), p(50)
by marst: egen incwage_75 = pctile(incwage), p(75)
by marst: egen incwage_90 = pctile(incwage), p(90)
============================================================*/



