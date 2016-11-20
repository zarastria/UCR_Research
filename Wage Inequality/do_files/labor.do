/************************************************************************* 
Research Project: Labor 240 & Labor 243
Allen Baumgardner
Sept. 18th 2012
University of California Riverside
*************************************************************************/

set more off

clear
set mem 100m
set matsize 1000

quietly{
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
  int     occ1990   39-41  ///
  byte    durunemp  42-43  ///
  long    incwage   44-49  ///
  using `"labordata.dat"'


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
label var occ1990  `"Occupation, 1990 basis"'
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

label define occ1990_lbl 003 `"Legislators"'
label define occ1990_lbl 004 `"Chief executives and public administrators"', add
label define occ1990_lbl 007 `"Financial managers"', add
label define occ1990_lbl 008 `"Human resources and labor relations managers"', add
label define occ1990_lbl 013 `"Managers and specialists in marketing, advertising, and public relations"', add
label define occ1990_lbl 014 `"Managers in education and related fields"', add
label define occ1990_lbl 015 `"Managers of medicine and health occupations"', add
label define occ1990_lbl 016 `"Postmasters and mail superintendents"', add
label define occ1990_lbl 017 `"Managers of food-serving and lodging establishments"', add
label define occ1990_lbl 018 `"Managers of properties and real estate"', add
label define occ1990_lbl 019 `"Funeral directors"', add
label define occ1990_lbl 021 `"Managers of service organizations, n.e.c."', add
label define occ1990_lbl 022 `"Managers and administrators, n.e.c."', add
label define occ1990_lbl 023 `"Accountants and auditors"', add
label define occ1990_lbl 024 `"Insurance underwriters"', add
label define occ1990_lbl 025 `"Other financial specialists"', add
label define occ1990_lbl 026 `"Management analysts"', add
label define occ1990_lbl 027 `"Personnel, HR, training, and labor relations specialists"', add
label define occ1990_lbl 028 `"Purchasing agents and buyers, of farm products"', add
label define occ1990_lbl 029 `"Buyers, wholesale and retail trade"', add
label define occ1990_lbl 033 `"Purchasing managers, agents and buyers, n.e.c."', add
label define occ1990_lbl 034 `"Business and promotion agents"', add
label define occ1990_lbl 035 `"Construction inspectors"', add
label define occ1990_lbl 036 `"Inspectors and compliance officers, outside construction"', add
label define occ1990_lbl 037 `"Management support occupations"', add
label define occ1990_lbl 043 `"Architects"', add
label define occ1990_lbl 044 `"Aerospace engineer"', add
label define occ1990_lbl 045 `"Metallurgical and materials engineers, variously phrased"', add
label define occ1990_lbl 047 `"Petroleum, mining, and geological engineers"', add
label define occ1990_lbl 048 `"Chemical engineers"', add
label define occ1990_lbl 053 `"Civil engineers"', add
label define occ1990_lbl 055 `"Electrical engineer"', add
label define occ1990_lbl 056 `"Industrial engineers"', add
label define occ1990_lbl 057 `"Mechanical engineers"', add
label define occ1990_lbl 059 `"Not-elsewhere-classified engineers"', add
label define occ1990_lbl 064 `"Computer systems analysts and computer scientists"', add
label define occ1990_lbl 065 `"Operations and systems researchers and analysts"', add
label define occ1990_lbl 066 `"Actuaries"', add
label define occ1990_lbl 067 `"Statisticians"', add
label define occ1990_lbl 068 `"Mathematicians and mathematical scientists"', add
label define occ1990_lbl 069 `"Physicists and astronomers"', add
label define occ1990_lbl 073 `"Chemists"', add
label define occ1990_lbl 074 `"Atmospheric and space scientists"', add
label define occ1990_lbl 075 `"Geologists"', add
label define occ1990_lbl 076 `"Physical scientists, n.e.c."', add
label define occ1990_lbl 077 `"Agricultural and food scientists"', add
label define occ1990_lbl 078 `"Biological scientists"', add
label define occ1990_lbl 079 `"Foresters and conservation scientists"', add
label define occ1990_lbl 083 `"Medical scientists"', add
label define occ1990_lbl 084 `"Physicians"', add
label define occ1990_lbl 085 `"Dentists"', add
label define occ1990_lbl 086 `"Veterinarians"', add
label define occ1990_lbl 087 `"Optometrists"', add
label define occ1990_lbl 088 `"Podiatrists"', add
label define occ1990_lbl 089 `"Other health and therapy"', add
label define occ1990_lbl 095 `"Registered nurses"', add
label define occ1990_lbl 096 `"Pharmacists"', add
label define occ1990_lbl 097 `"Dietitians and nutritionists"', add
label define occ1990_lbl 098 `"Respiratory therapists"', add
label define occ1990_lbl 099 `"Occupational therapists"', add
label define occ1990_lbl 103 `"Physical therapists"', add
label define occ1990_lbl 104 `"Speech therapists"', add
label define occ1990_lbl 105 `"Therapists, n.e.c."', add
label define occ1990_lbl 106 `"Physicians' assistants"', add
label define occ1990_lbl 113 `"Earth, environmental, and marine science instructors"', add
label define occ1990_lbl 114 `"Biological science instructors"', add
label define occ1990_lbl 115 `"Chemistry instructors"', add
label define occ1990_lbl 116 `"Physics instructors"', add
label define occ1990_lbl 118 `"Psychology instructors"', add
label define occ1990_lbl 119 `"Economics instructors"', add
label define occ1990_lbl 123 `"History instructors"', add
label define occ1990_lbl 125 `"Sociology instructors"', add
label define occ1990_lbl 127 `"Engineering instructors"', add
label define occ1990_lbl 128 `"Math instructors"', add
label define occ1990_lbl 139 `"Education instructors"', add
label define occ1990_lbl 145 `"Law instructors"', add
label define occ1990_lbl 147 `"Theology instructors"', add
label define occ1990_lbl 149 `"Home economics instructors"', add
label define occ1990_lbl 150 `"Humanities profs/instructors, college, nec"', add
label define occ1990_lbl 154 `"Subject instructors (HS/college)"', add
label define occ1990_lbl 155 `"Kindergarten and earlier school teachers"', add
label define occ1990_lbl 156 `"Primary school teachers"', add
label define occ1990_lbl 157 `"Secondary school teachers"', add
label define occ1990_lbl 158 `"Special education teachers"', add
label define occ1990_lbl 159 `"Teachers , n.e.c."', add
label define occ1990_lbl 163 `"Vocational and educational counselors"', add
label define occ1990_lbl 164 `"Librarians"', add
label define occ1990_lbl 165 `"Archivists and curators"', add
label define occ1990_lbl 166 `"Economists, market researchers, and survey researchers"', add
label define occ1990_lbl 167 `"Psychologists"', add
label define occ1990_lbl 168 `"Sociologists"', add
label define occ1990_lbl 169 `"Social scientists, n.e.c."', add
label define occ1990_lbl 173 `"Urban and regional planners"', add
label define occ1990_lbl 174 `"Social workers"', add
label define occ1990_lbl 175 `"Recreation workers"', add
label define occ1990_lbl 176 `"Clergy and religious workers"', add
label define occ1990_lbl 178 `"Lawyers "', add
label define occ1990_lbl 179 `"Judges"', add
label define occ1990_lbl 183 `"Writers and authors"', add
label define occ1990_lbl 184 `"Technical writers"', add
label define occ1990_lbl 185 `"Designers"', add
label define occ1990_lbl 186 `"Musician or composer"', add
label define occ1990_lbl 187 `"Actors, directors, producers"', add
label define occ1990_lbl 188 `"Art makers: painters, sculptors, craft-artists, and print-makers"', add
label define occ1990_lbl 189 `"Photographers"', add
label define occ1990_lbl 193 `"Dancers"', add
label define occ1990_lbl 194 `"Art/entertainment performers and related"', add
label define occ1990_lbl 195 `"Editors and reporters"', add
label define occ1990_lbl 198 `"Announcers"', add
label define occ1990_lbl 199 `"Athletes, sports instructors, and officials"', add
label define occ1990_lbl 200 `"Professionals, n.e.c."', add
label define occ1990_lbl 203 `"Clinical laboratory technologies and technicians"', add
label define occ1990_lbl 204 `"Dental hygenists"', add
label define occ1990_lbl 205 `"Health record tech specialists"', add
label define occ1990_lbl 206 `"Radiologic tech specialists"', add
label define occ1990_lbl 207 `"Licensed practical nurses"', add
label define occ1990_lbl 208 `"Health technologists and technicians, n.e.c."', add
label define occ1990_lbl 213 `"Electrical and electronic (engineering) technicians"', add
label define occ1990_lbl 214 `"Engineering technicians, n.e.c."', add
label define occ1990_lbl 215 `"Mechanical engineering technicians"', add
label define occ1990_lbl 217 `"Drafters"', add
label define occ1990_lbl 218 `"Surveyors, cartographers, mapping scientists and technicians"', add
label define occ1990_lbl 223 `"Biological technicians"', add
label define occ1990_lbl 224 `"Chemical technicians"', add
label define occ1990_lbl 225 `"Other science technicians"', add
label define occ1990_lbl 226 `"Airplane pilots and navigators"', add
label define occ1990_lbl 227 `"Air traffic controllers"', add
label define occ1990_lbl 228 `"Broadcast equipment operators"', add
label define occ1990_lbl 229 `"Computer software developers"', add
label define occ1990_lbl 233 `"Programmers of numerically controlled machine tools"', add
label define occ1990_lbl 234 `"Legal assistants, paralegals, legal support, etc"', add
label define occ1990_lbl 235 `"Technicians, n.e.c."', add
label define occ1990_lbl 243 `"Supervisors and proprietors of sales jobs"', add
label define occ1990_lbl 253 `"Insurance sales occupations"', add
label define occ1990_lbl 254 `"Real estate sales occupations"', add
label define occ1990_lbl 255 `"Financial services sales occupations"', add
label define occ1990_lbl 256 `"Advertising and related sales jobs"', add
label define occ1990_lbl 258 `"Sales engineers"', add
label define occ1990_lbl 274 `"Salespersons, n.e.c."', add
label define occ1990_lbl 275 `"Retail sales clerks"', add
label define occ1990_lbl 276 `"Cashiers"', add
label define occ1990_lbl 277 `"Door-to-door sales, street sales, and news vendors"', add
label define occ1990_lbl 283 `"Sales demonstrators / promoters / models"', add
label define occ1990_lbl 290 `"Sales workers--allocated (1990 internal census)"', add
label define occ1990_lbl 303 `"Office supervisors"', add
label define occ1990_lbl 308 `"Computer and peripheral equipment operators"', add
label define occ1990_lbl 313 `"Secretaries"', add
label define occ1990_lbl 314 `"Stenographers"', add
label define occ1990_lbl 315 `"Typists"', add
label define occ1990_lbl 316 `"Interviewers, enumerators, and surveyors"', add
label define occ1990_lbl 317 `"Hotel clerks"', add
label define occ1990_lbl 318 `"Transportation ticket and reservation agents"', add
label define occ1990_lbl 319 `"Receptionists"', add
label define occ1990_lbl 323 `"Information clerks, nec"', add
label define occ1990_lbl 326 `"Correspondence and order clerks"', add
label define occ1990_lbl 328 `"Human resources clerks, except payroll and timekeeping"', add
label define occ1990_lbl 329 `"Library assistants"', add
label define occ1990_lbl 335 `"File clerks"', add
label define occ1990_lbl 336 `"Records clerks"', add
label define occ1990_lbl 337 `"Bookkeepers and accounting and auditing clerks"', add
label define occ1990_lbl 338 `"Payroll and timekeeping clerks"', add
label define occ1990_lbl 343 `"Cost and rate clerks (financial records processing)"', add
label define occ1990_lbl 344 `"Billing clerks and related financial records processing"', add
label define occ1990_lbl 345 `"Duplication machine operators / office machine operators"', add
label define occ1990_lbl 346 `"Mail and paper handlers"', add
label define occ1990_lbl 347 `"Office machine operators, n.e.c."', add
label define occ1990_lbl 348 `"Telephone operators"', add
label define occ1990_lbl 349 `"Other telecom operators"', add
label define occ1990_lbl 354 `"Postal clerks, excluding mail carriers"', add
label define occ1990_lbl 355 `"Mail carriers for postal service"', add
label define occ1990_lbl 356 `"Mail clerks, outside of post office"', add
label define occ1990_lbl 357 `"Messengers"', add
label define occ1990_lbl 359 `"Dispatchers"', add
label define occ1990_lbl 361 `"Inspectors, n.e.c."', add
label define occ1990_lbl 364 `"Shipping and receiving clerks"', add
label define occ1990_lbl 365 `"Stock and inventory clerks"', add
label define occ1990_lbl 366 `"Meter readers"', add
label define occ1990_lbl 368 `"Weighers, measurers, and checkers"', add
label define occ1990_lbl 373 `"Material recording, scheduling, production, planning, and expediting clerks"', add
label define occ1990_lbl 375 `"Insurance adjusters, examiners, and investigators"', add
label define occ1990_lbl 376 `"Customer service reps, investigators and adjusters, except insurance"', add
label define occ1990_lbl 377 `"Eligibility clerks for government programs; social welfare"', add
label define occ1990_lbl 378 `"Bill and account collectors"', add
label define occ1990_lbl 379 `"General office clerks"', add
label define occ1990_lbl 383 `"Bank tellers"', add
label define occ1990_lbl 384 `"Proofreaders"', add
label define occ1990_lbl 385 `"Data entry keyers"', add
label define occ1990_lbl 386 `"Statistical clerks"', add
label define occ1990_lbl 387 `"Teacher's aides"', add
label define occ1990_lbl 389 `"Administrative support jobs, n.e.c."', add
label define occ1990_lbl 390 `"Professional, technical, and kindred workers--allocated (1990 internal census)"', add
label define occ1990_lbl 391 `"Clerical and kindred workers--allocated (1990 internal census)"', add
label define occ1990_lbl 405 `"Housekeepers, maids, butlers, stewards, and lodging quarters cleaners"', add
label define occ1990_lbl 407 `"Private household cleaners and servants"', add
label define occ1990_lbl 408 `"Private household workers--allocated (1990 internal census)"', add
label define occ1990_lbl 415 `"Supervisors of guards"', add
label define occ1990_lbl 417 `"Fire fighting, prevention, and inspection"', add
label define occ1990_lbl 418 `"Police, detectives, and private investigators"', add
label define occ1990_lbl 423 `"Other law enforcement: sheriffs, bailiffs, correctional institution officers"', add
label define occ1990_lbl 425 `"Crossing guards and bridge tenders"', add
label define occ1990_lbl 426 `"Guards, watchmen, doorkeepers"', add
label define occ1990_lbl 427 `"Protective services, n.e.c."', add
label define occ1990_lbl 434 `"Bartenders"', add
label define occ1990_lbl 435 `"Waiter/waitress"', add
label define occ1990_lbl 436 `"Cooks, variously defined"', add
label define occ1990_lbl 438 `"Food counter and fountain workers"', add
label define occ1990_lbl 439 `"Kitchen workers"', add
label define occ1990_lbl 443 `"Waiter's assistant"', add
label define occ1990_lbl 444 `"Misc food prep workers"', add
label define occ1990_lbl 445 `"Dental assistants"', add
label define occ1990_lbl 446 `"Health aides, except nursing"', add
label define occ1990_lbl 447 `"Nursing aides, orderlies, and attendants"', add
label define occ1990_lbl 448 `"Supervisors of cleaning and building service"', add
label define occ1990_lbl 453 `"Janitors"', add
label define occ1990_lbl 454 `"Elevator operators"', add
label define occ1990_lbl 455 `"Pest control occupations"', add
label define occ1990_lbl 456 `"Supervisors of personal service jobs, n.e.c."', add
label define occ1990_lbl 457 `"Barbers"', add
label define occ1990_lbl 458 `"Hairdressers and cosmetologists"', add
label define occ1990_lbl 459 `"Recreation facility attendants"', add
label define occ1990_lbl 461 `"Guides"', add
label define occ1990_lbl 462 `"Ushers"', add
label define occ1990_lbl 463 `"Public transportation attendants and inspectors"', add
label define occ1990_lbl 464 `"Baggage porters"', add
label define occ1990_lbl 465 `"Welfare service aides"', add
label define occ1990_lbl 468 `"Child care workers"', add
label define occ1990_lbl 469 `"Personal service occupations, nec"', add
label define occ1990_lbl 473 `"Farmers (owners and tenants)"', add
label define occ1990_lbl 474 `"Horticultural specialty farmers"', add
label define occ1990_lbl 475 `"Farm managers, except for horticultural farms"', add
label define occ1990_lbl 476 `"Managers of horticultural specialty farms"', add
label define occ1990_lbl 479 `"Farm workers"', add
label define occ1990_lbl 480 `"Farm laborers and farm foreman--allocated (1990 internal census)"', add
label define occ1990_lbl 483 `"Marine life cultivation workers"', add
label define occ1990_lbl 484 `"Nursery farming workers"', add
label define occ1990_lbl 485 `"Supervisors of agricultural occupations"', add
label define occ1990_lbl 486 `"Gardeners and groundskeepers"', add
label define occ1990_lbl 487 `"Animal caretakers except on farms"', add
label define occ1990_lbl 488 `"Graders and sorters of agricultural products"', add
label define occ1990_lbl 489 `"Inspectors of agricultural products"', add
label define occ1990_lbl 496 `"Timber, logging, and forestry workers"', add
label define occ1990_lbl 498 `"Fishers, hunters, and kindred"', add
label define occ1990_lbl 503 `"Supervisors of mechanics and repairers"', add
label define occ1990_lbl 505 `"Automobile mechanics"', add
label define occ1990_lbl 507 `"Bus, truck, and stationary engine mechanics"', add
label define occ1990_lbl 508 `"Aircraft mechanics"', add
label define occ1990_lbl 509 `"Small engine repairers"', add
label define occ1990_lbl 514 `"Auto body repairers"', add
label define occ1990_lbl 516 `"Heavy equipment and farm equipment mechanics"', add
label define occ1990_lbl 518 `"Industrial machinery repairers"', add
label define occ1990_lbl 519 `"Machinery maintenance occupations"', add
label define occ1990_lbl 523 `"Repairers of industrial electrical equipment "', add
label define occ1990_lbl 525 `"Repairers of data processing equipment"', add
label define occ1990_lbl 526 `"Repairers of household appliances and power tools"', add
label define occ1990_lbl 527 `"Telecom and line installers and repairers"', add
label define occ1990_lbl 533 `"Repairers of electrical equipment, n.e.c."', add
label define occ1990_lbl 534 `"Heating, air conditioning, and refigeration mechanics"', add
label define occ1990_lbl 535 `"Precision makers, repairers, and smiths"', add
label define occ1990_lbl 536 `"Locksmiths and safe repairers"', add
label define occ1990_lbl 538 `"Office machine repairers and mechanics"', add
label define occ1990_lbl 539 `"Repairers of mechanical controls and valves"', add
label define occ1990_lbl 543 `"Elevator installers and repairers"', add
label define occ1990_lbl 544 `"Millwrights"', add
label define occ1990_lbl 549 `"Mechanics and repairers, n.e.c."', add
label define occ1990_lbl 558 `"Supervisors of construction work"', add
label define occ1990_lbl 563 `"Masons, tilers, and carpet installers"', add
label define occ1990_lbl 567 `"Carpenters"', add
label define occ1990_lbl 573 `"Drywall installers"', add
label define occ1990_lbl 575 `"Electricians"', add
label define occ1990_lbl 577 `"Electric power installers and repairers"', add
label define occ1990_lbl 579 `"Painters, construction and maintenance"', add
label define occ1990_lbl 583 `"Paperhangers"', add
label define occ1990_lbl 584 `"Plasterers"', add
label define occ1990_lbl 585 `"Plumbers, pipe fitters, and steamfitters"', add
label define occ1990_lbl 588 `"Concrete and cement workers"', add
label define occ1990_lbl 589 `"Glaziers"', add
label define occ1990_lbl 593 `"Insulation workers"', add
label define occ1990_lbl 594 `"Paving, surfacing, and tamping equipment operators"', add
label define occ1990_lbl 595 `"Roofers and slaters"', add
label define occ1990_lbl 596 `"Sheet metal duct installers"', add
label define occ1990_lbl 597 `"Structural metal workers"', add
label define occ1990_lbl 598 `"Drillers of earth"', add
label define occ1990_lbl 599 `"Construction trades, n.e.c."', add
label define occ1990_lbl 614 `"Drillers of oil wells"', add
label define occ1990_lbl 615 `"Explosives workers"', add
label define occ1990_lbl 616 `"Miners"', add
label define occ1990_lbl 617 `"Other mining occupations"', add
label define occ1990_lbl 628 `"Production supervisors or foremen"', add
label define occ1990_lbl 634 `"Tool and die makers and die setters"', add
label define occ1990_lbl 637 `"Machinists"', add
label define occ1990_lbl 643 `"Boilermakers"', add
label define occ1990_lbl 644 `"Precision grinders and filers"', add
label define occ1990_lbl 645 `"Patternmakers and model makers"', add
label define occ1990_lbl 646 `"Lay-out workers"', add
label define occ1990_lbl 649 `"Engravers"', add
label define occ1990_lbl 653 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define occ1990_lbl 657 `"Cabinetmakers and bench carpenters"', add
label define occ1990_lbl 658 `"Furniture and wood finishers"', add
label define occ1990_lbl 659 `"Other precision woodworkers"', add
label define occ1990_lbl 666 `"Dressmakers and seamstresses"', add
label define occ1990_lbl 667 `"Tailors"', add
label define occ1990_lbl 668 `"Upholsterers"', add
label define occ1990_lbl 669 `"Shoe repairers"', add
label define occ1990_lbl 674 `"Other precision apparel and fabric workers"', add
label define occ1990_lbl 675 `"Hand molders and shapers, except jewelers "', add
label define occ1990_lbl 677 `"Optical goods workers"', add
label define occ1990_lbl 678 `"Dental laboratory and medical appliance technicians"', add
label define occ1990_lbl 679 `"Bookbinders"', add
label define occ1990_lbl 684 `"Other precision and craft workers"', add
label define occ1990_lbl 686 `"Butchers and meat cutters"', add
label define occ1990_lbl 687 `"Bakers"', add
label define occ1990_lbl 688 `"Batch food makers"', add
label define occ1990_lbl 693 `"Adjusters and calibrators"', add
label define occ1990_lbl 694 `"Water and sewage treatment plant operators"', add
label define occ1990_lbl 695 `"Power plant operators"', add
label define occ1990_lbl 696 `"Plant and system operators, stationary engineers "', add
label define occ1990_lbl 699 `"Other plant and system operators"', add
label define occ1990_lbl 703 `"Lathe, milling, and turning machine operatives"', add
label define occ1990_lbl 706 `"Punching and stamping press operatives"', add
label define occ1990_lbl 707 `"Rollers, roll hands, and finishers of metal"', add
label define occ1990_lbl 708 `"Drilling and boring machine operators"', add
label define occ1990_lbl 709 `"Grinding, abrading, buffing, and polishing workers"', add
label define occ1990_lbl 713 `"Forge and hammer operators"', add
label define occ1990_lbl 717 `"Fabricating machine operators, n.e.c."', add
label define occ1990_lbl 719 `"Molders, and casting machine operators"', add
label define occ1990_lbl 723 `"Metal platers"', add
label define occ1990_lbl 724 `"Heat treating equipment operators"', add
label define occ1990_lbl 726 `"Wood lathe, routing, and planing machine operators"', add
label define occ1990_lbl 727 `"Sawing machine operators and sawyers"', add
label define occ1990_lbl 728 `"Shaping and joining machine operator (woodworking)"', add
label define occ1990_lbl 729 `"Nail and tacking machine operators  (woodworking)"', add
label define occ1990_lbl 733 `"Other woodworking machine operators"', add
label define occ1990_lbl 734 `"Printing machine operators, n.e.c."', add
label define occ1990_lbl 735 `"Photoengravers and lithographers"', add
label define occ1990_lbl 736 `"Typesetters and compositors"', add
label define occ1990_lbl 738 `"Winding and twisting textile/apparel operatives"', add
label define occ1990_lbl 739 `"Knitters, loopers, and toppers textile operatives"', add
label define occ1990_lbl 743 `"Textile cutting machine operators"', add
label define occ1990_lbl 744 `"Textile sewing machine operators"', add
label define occ1990_lbl 745 `"Shoemaking machine operators"', add
label define occ1990_lbl 747 `"Pressing machine operators (clothing)"', add
label define occ1990_lbl 748 `"Laundry workers"', add
label define occ1990_lbl 749 `"Misc textile machine operators"', add
label define occ1990_lbl 753 `"Cementing and gluing maching operators"', add
label define occ1990_lbl 754 `"Packers, fillers, and wrappers"', add
label define occ1990_lbl 755 `"Extruding and forming machine operators"', add
label define occ1990_lbl 756 `"Mixing and blending machine operatives"', add
label define occ1990_lbl 757 `"Separating, filtering, and clarifying machine operators"', add
label define occ1990_lbl 759 `"Painting machine operators"', add
label define occ1990_lbl 763 `"Roasting and baking machine operators (food)"', add
label define occ1990_lbl 764 `"Washing, cleaning, and pickling machine operators"', add
label define occ1990_lbl 765 `"Paper folding machine operators"', add
label define occ1990_lbl 766 `"Furnace, kiln, and oven operators, apart from food"', add
label define occ1990_lbl 768 `"Crushing and grinding machine operators"', add
label define occ1990_lbl 769 `"Slicing and cutting machine operators"', add
label define occ1990_lbl 773 `"Motion picture projectionists"', add
label define occ1990_lbl 774 `"Photographic process workers"', add
label define occ1990_lbl 779 `"Machine operators, n.e.c."', add
label define occ1990_lbl 783 `"Welders and metal cutters"', add
label define occ1990_lbl 784 `"Solderers"', add
label define occ1990_lbl 785 `"Assemblers of electrical equipment"', add
label define occ1990_lbl 789 `"Hand painting, coating, and decorating occupations"', add
label define occ1990_lbl 796 `"Production checkers and inspectors"', add
label define occ1990_lbl 799 `"Graders and sorters in manufacturing"', add
label define occ1990_lbl 803 `"Supervisors of motor vehicle transportation"', add
label define occ1990_lbl 804 `"Truck, delivery, and tractor drivers"', add
label define occ1990_lbl 808 `"Bus drivers"', add
label define occ1990_lbl 809 `"Taxi cab drivers and chauffeurs"', add
label define occ1990_lbl 813 `"Parking lot attendants"', add
label define occ1990_lbl 815 `"Transport equipment operatives--allocated (1990 internal census)"', add
label define occ1990_lbl 823 `"Railroad conductors and yardmasters"', add
label define occ1990_lbl 824 `"Locomotive operators (engineers and firemen)"', add
label define occ1990_lbl 825 `"Railroad brake, coupler, and switch operators"', add
label define occ1990_lbl 829 `"Ship crews and marine engineers"', add
label define occ1990_lbl 834 `"Water transport infrastructure tenders and crossing guards"', add
label define occ1990_lbl 844 `"Operating engineers of construction equipment"', add
label define occ1990_lbl 848 `"Crane, derrick, winch, and hoist operators"', add
label define occ1990_lbl 853 `"Excavating and loading machine operators"', add
label define occ1990_lbl 859 `"Misc material moving occupations"', add
label define occ1990_lbl 865 `"Helpers, constructions"', add
label define occ1990_lbl 866 `"Helpers, surveyors"', add
label define occ1990_lbl 869 `"Construction laborers"', add
label define occ1990_lbl 874 `"Production helpers"', add
label define occ1990_lbl 875 `"Garbage and recyclable material collectors"', add
label define occ1990_lbl 876 `"Materials movers: stevedores and longshore workers"', add
label define occ1990_lbl 877 `"Stock handlers"', add
label define occ1990_lbl 878 `"Machine feeders and offbearers"', add
label define occ1990_lbl 883 `"Freight, stock, and materials handlers"', add
label define occ1990_lbl 885 `"Garage and service station related occupations"', add
label define occ1990_lbl 887 `"Vehicle washers and equipment cleaners"', add
label define occ1990_lbl 888 `"Packers and packagers by hand"', add
label define occ1990_lbl 889 `"Laborers outside construction"', add
label define occ1990_lbl 890 `"Laborers, except farm--allocated (1990 internal census)"', add
label define occ1990_lbl 905 `"Military"', add
label define occ1990_lbl 991 `"Unemployed"', add
label define occ1990_lbl 999 `"Unknown"', add
label values occ1990 occ1990_lbl

label define durunemp_lbl 00 `"0"'
label define durunemp_lbl 98 `"98"', add
label values durunemp durunemp_lbl

label define incwage_lbl 999999 `"999999"'
label values incwage incwage_lbl


/****Convert 3-digit occ1990 Into 2-digit floorocc, Floor Method****/
gen floorocc = floor(occ1990 / 10)

/****Convert 3-dig occ1990 Into 2-dog occ1990, Personal Code****/
gen myocc = 1 if occ1990 >= 000 & occ1990 <= 22
replace myocc = 2 if occ1990 >= 023 & occ1990 <= 37
replace myocc = 3 if occ1990 == 43
replace myocc = 4 if occ1990 >= 44 & occ1990 <= 59
replace myocc = 5 if occ1990 >= 64 & occ1990 <= 68
replace myocc = 6 if occ1990 >= 69 & occ1990 <= 83
replace myocc = 7 if occ1990 >= 84 & occ1990 <= 89
replace myocc = 8 if occ1990 >= 95 & occ1990 <= 97
replace myocc = 9 if occ1990 >= 98 & occ1990 <= 106
replace myocc = 10 if occ1990 >= 113 & occ1990 <= 154
replace myocc = 11 if occ1990 >= 155 & occ1990 <= 165
replace myocc = 12 if occ1990 >= 166 & occ1990 <= 173
replace myocc = 13 if occ1990 >= 174 & occ1990 <= 176
replace myocc = 14 if occ1990 >= 178 & occ1990 <= 179
replace myocc = 15 if occ1990 >= 183 & occ1990 <= 200
replace myocc = 16 if occ1990 >= 213 & occ1990 <= 223
replace myocc = 17 if occ1990 >= 224 & occ1990 <= 225
replace myocc = 18 if occ1990 >= 226 & occ1990 <= 235
replace myocc = 19 if occ1990 == 243
replace myocc = 20 if occ1990 >= 253 & occ1990 <= 256
replace myocc = 21 if occ1990 >= 258 & occ1990 <= 277
replace myocc = 22 if occ1990 >= 283 & occ1990 <= 290
replace myocc = 23 if occ1990 == 303
replace myocc = 24 if occ1990 == 308
replace myocc = 25 if occ1990 >= 313 & occ1990 <= 315
replace myocc = 26 if occ1990 >= 316 & occ1990 <= 323
replace myocc = 27 if occ1990 >= 326 & occ1990 <= 336
replace myocc = 28 if occ1990 >= 337 & occ1990 <= 344
replace myocc = 29 if occ1990 >= 345 & occ1990 <= 347
replace myocc = 30 if occ1990 >= 348 & occ1990 <= 349
replace myocc = 31 if occ1990 >= 354 & occ1990 <= 357
replace myocc = 32 if occ1990 >= 359 & occ1990 <= 373
replace myocc = 33 if occ1990 >= 375 & occ1990 <= 378
replace myocc = 34 if occ1990 >= 379 & occ1990 <= 391
replace myocc = 35 if occ1990 >= 405 & occ1990 <= 408
replace myocc = 36 if occ1990 == 415
replace myocc = 37 if occ1990 == 417
replace myocc = 38 if occ1990 >= 418 & occ1990 <= 423
replace myocc = 39 if occ1990 >= 425 & occ1990 <= 427
replace myocc = 40 if occ1990 >= 434 & occ1990 <= 444
replace myocc = 41 if occ1990 >= 445 & occ1990 <= 447
replace myocc = 42 if occ1990 >= 448 & occ1990 <= 455
replace myocc = 43 if occ1990 >= 456 & occ1990 <= 469
replace myocc = 44 if occ1990 >= 473 & occ1990 <= 476
replace myocc = 45 if occ1990 >= 479 & occ1990 <= 484
replace myocc = 46 if occ1990 >= 485 & occ1990 <= 489
replace myocc = 47 if occ1990 == 496
replace myocc = 48 if occ1990 == 498
replace myocc = 49 if occ1990 == 503
replace myocc = 50 if occ1990 >= 505 & occ1990 <= 519
replace myocc = 51 if occ1990 >= 523 & occ1990 <= 534
replace myocc = 52 if occ1990 >= 535 & occ1990 <= 549
replace myocc = 53 if occ1990 == 558
replace myocc = 54 if occ1990 >= 563 & occ1990 <= 599
replace myocc = 55 if occ1990 >= 614 & occ1990 <= 617
replace myocc = 56 if occ1990 == 628
replace myocc = 57 if occ1990 >= 634 & occ1990 <= 653
replace myocc = 58 if occ1990 >= 657 & occ1990 <= 659
replace myocc = 59 if occ1990 >= 666 & occ1990 <= 674
replace myocc = 60 if occ1990 >= 675 & occ1990 <= 684
replace myocc = 61 if occ1990 >= 686 & occ1990 <= 688
replace myocc = 62 if occ1990 == 693
replace myocc = 63 if occ1990 >= 694 & occ1990 <= 699
replace myocc = 64 if occ1990 >= 703 & occ1990 <= 717
replace myocc = 65 if occ1990 >= 719 & occ1990 <= 724
replace myocc = 66 if occ1990 >= 726 & occ1990 <= 733
replace myocc = 67 if occ1990 >= 734 & occ1990 <= 736
replace myocc = 68 if occ1990 >= 738 & occ1990 <= 749
replace myocc = 69 if occ1990 >= 753 & occ1990 <= 779
replace myocc = 70 if occ1990 >= 783 & occ1990 <= 789
replace myocc = 71 if occ1990 >= 796 & occ1990 <= 799
replace myocc = 72 if occ1990 >= 803 & occ1990 <= 815
replace myocc = 73 if occ1990 >= 823 & occ1990 <= 825
replace myocc = 74 if occ1990 >= 829 & occ1990 <= 834
replace myocc = 75 if occ1990 >= 844 & occ1990 <= 859
replace myocc = 76 if occ1990 >= 865 & occ1990 <= 874
replace myocc = 77 if occ1990 >= 875 & occ1990 <= 890
replace myocc = 78 if occ1990 == 905
replace myocc = 79 if occ1990 >= 991 & occ1990 <= 999


label define myocc_lbl 01 `"Executive, Administrative, and Managerial Occupations"', add
label define myocc_lbl 02 `"Management Related Occupations"', add
label define myocc_lbl 03 `"Engineers, Architechts, and Surveyors"', add
label define myocc_lbl 04 `"Engineers"', add
label define myocc_lbl 05 `"Mathematical and Computer Scientists"', add
label define myocc_lbl 06 `"Natural Scientists"', add
label define myocc_lbl 07 `"Health Diagnosing Occupations"', add
label define myocc_lbl 08 `"Health Assessment and Treating Occupations"', add
label define myocc_lbl 09 `"Therapists"', add
label define myocc_lbl 10 `"Teachers, Postsecondary"', add
label define myocc_lbl 11 `"Teachers, Except Postsecondary"', add
label define myocc_lbl 12 `"Social Scientists and Urban Planners"', add
label define myocc_lbl 13 `"Social, Recreation, and Religious Workers"', add
label define myocc_lbl 14 `"Lawyers and Judges"', add
label define myocc_lbl 15 `"Writers, Artists, Entertainers, and Athletes"', add
label define myocc_lbl 16 `"Engineering and Related Technologists and Technicians"', add
label define myocc_lbl 17 `"Science Technicians"', add
label define myocc_lbl 18 `"Technicians, Except Health, Engineering, and Science"', add
label define myocc_lbl 19 `"Supervisors and proprietors of sales jobs"', add
label define myocc_lbl 20 `"Sales Representatives, Finance and Business Services"', add
label define myocc_lbl 21 `"Sales Representatives, Commodities"', add
label define myocc_lbl 22 `"Sales Related Occupations"', add
label define myocc_lbl 23 `"Office supervisors"', add
label define myocc_lbl 24 `"Computer and peripheral equipment operators"', add
label define myocc_lbl 25 `"Secretaries, Stenographers, and Typists"', add
label define myocc_lbl 26 `"Information Clerks"', add
label define myocc_lbl 27 `"Records Processing Occupations, Except Financial"', add
label define myocc_lbl 28 `"Financial Records Processing Occupations"', add
label define myocc_lbl 29 `"Duplicating, Mail, and Other Office Machine Operators"', add
label define myocc_lbl 30 `"Communications Equipment Operators"', add
label define myocc_lbl 31 `"Mail and Message Distributing Occupations"', add
label define myocc_lbl 32 `"Material Recording, Scheduling, and Distributing Clerks"', add
label define myocc_lbl 33 `"Adjusters and Investigators"', add
label define myocc_lbl 34 `"Miscellaneous Administrative Support Occupations"', add
label define myocc_lbl 35 `"Private Household Occupations"', add
label define myocc_lbl 36 `"Supervisors of guards"', add
label define myocc_lbl 37 `"Fire fighting, prevention, and inspection"', add
label define myocc_lbl 38 `"Police and Detectives"', add
label define myocc_lbl 39 `"Guards"', add
label define myocc_lbl 40 `"Food Preparation and Serivce Occupations"', add
label define myocc_lbl 41 `"Health Service Occupations"', add
label define myocc_lbl 42 `"Cleaning and Building Service Occupations, Except Households"', add
label define myocc_lbl 43 `"Personal Service Occupations"', add
label define myocc_lbl 44 `"Farm Operators and Managers"', add
label define myocc_lbl 45 `"Farm Occupations, Except Managerial"', add
label define myocc_lbl 46 `"Related Agricultural Occupations"', add
label define myocc_lbl 47 `"Timber, logging, and forestry workers"', add
label define myocc_lbl 48 `"Fishers, hunters, and kindred"', add
label define myocc_lbl 49 `"Supervisors of mechanics and repairers"', add
label define myocc_lbl 50 `"Vehicle and Mobile Equipment Mechanics and Repairers"', add
label define myocc_lbl 51 `"Electrical and Electronic Equipment Repairers"', add
label define myocc_lbl 52 `"Miscellaneous Mechanics and Repairers"', add
label define myocc_lbl 53 `"Supervisors of construction work"', add
label define myocc_lbl 54 `"Construction Trades, Except Supervisors"', add
label define myocc_lbl 55 `"Extractive Occupations"', add
label define myocc_lbl 56 `"Production supervisors or foremen"', add
label define myocc_lbl 57 `"Precision Metal Working Occupations"', add
label define myocc_lbl 58 `"Precision Woodworking Occupations"', add
label define myocc_lbl 59 `"Precision Textile, Apparel, and Furnishings Machine Workers"', add
label define myocc_lbl 60 `"Precision Workers, Assorted Materials"', add
label define myocc_lbl 61 `"Precision Food Production Occupations"', add
label define myocc_lbl 62 `"Adjusters and calibrators"', add
label define myocc_lbl 63 `"Plant and System Operators"', add
label define myocc_lbl 64 `"Metal Working and Plastic Working Machine Operators"', add
label define myocc_lbl 65 `"Metal and Plastic Processing Machine Operators"', add
label define myocc_lbl 66 `"Woodworking Machine Operators"', add
label define myocc_lbl 67 `"Printing Machine Operators"', add
label define myocc_lbl 68 `"Textile, Apparel, and Furnishings Machine Operators"', add
label define myocc_lbl 69 `"Machine Operators, Assorted Materials"', add
label define myocc_lbl 70 `"Fabricators, Assemblers, and Hand Working Occupations"', add
label define myocc_lbl 71 `"Production Inspectors, Testers, Samplers, and Weighers"', add
label define myocc_lbl 72 `"Motor Vehicle Operators"', add
label define myocc_lbl 73 `"Rail Transportation Occupations"', add
label define myocc_lbl 74 `"Water Transportation Occupations"', add
label define myocc_lbl 75 `"Material Moving Equipment Operators"', add
label define myocc_lbl 76 `"Helpers, Construction and Extractive Occupations"', add
label define myocc_lbl 77 `"Freight, Stock, and Material Handlers"', add
label define myocc_lbl 78 `"Military"', add
label define myocc_lbl 79 `"EXPERIENCED UNEMPLOYED NOT CLASSIFIED BY OCCUPATION"', add
label values myocc myocc_lbl
}

/****Install Necessary programs****/
ssc install outreg2


/****Define Limits on the Data Set****/
drop if durunemp == 0 | age > 65 | age < 25


/****Define Some Interaction Terms****/
gen age2 = age^2
gen educ2 = educ^2


***************************************************************************************
***************************************************************************************
***************************************************************************************

/*=======================================================================
								PART 1
Model Improvement
Wage Disparity Across 'state' and 'occ1990'
Wage Disparity Across 'state' and 'floorocc'
Wage Disparity Across 'state' and 'myocc'

Notes:
Table1A: By state and occ1990 Naive regressions
Table1B: By state and occ1990 regrssions with fixed effects
Table1C: By state and occ1990 regrssions with fixed effects and interaction terms

Table2A: By state and occ1990 regrssions with fixed effects and interaction term
Table2B: By state and floorocc regrssions with fixed effects and interaction term
Table2C: By state and myocc regrssions with fixed effects and interaction term
========================================================================*/

/*=======================================================================
/****Wage Disparity across state and occ1990****/
sort statefip occ1990
by statefip occ1990: egen incwage_10 = pctile(incwage), p(10)
by statefip occ1990: egen incwage_25 = pctile(incwage), p(25)
by statefip occ1990: egen incwage_50 = pctile(incwage), p(50)
by statefip occ1990: egen incwage_75 = pctile(incwage), p(75)
by statefip occ1990: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_25 = incwage_25 / incwage_10
gen wagedist_25_50 = incwage_50 / incwage_25
========================================================================*/

/*=======================================================================
*Naive Regressions*
reg durunemp wagedist_10_90
outreg2 using Table1A.doc, replace title(Table 1.A: Naive Regressions) ctitle("",10-90)

reg durunemp wagedist_10_50
outreg2 using Table1A.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90
outreg2 using Table1A.doc, append ctitle("", 50-90)

reg durunemp wagedist_10_25
outreg2 using Table1A.doc, append ctitle("", 10-25)

reg durunemp wagedist_25_50
outreg2 using Table1A.doc, append ctitle("", 25-50)

reg durunemp wagedist_50_75
outreg2 using Table1A.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90
outreg2 using Table1A.doc, append ctitle("", 75-90)



*Regressions with Fixed Effects*
reg durunemp wagedist_10_90 age sex marst educ
outreg2 using Table1B.doc, replace title(Table 1.B: Regressions With Fixed Effects) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ
outreg2 using Table1B.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ
outreg2 using Table1B.doc, append ctitle("", 50-90)

reg durunemp wagedist_10_25 age sex marst educ
outreg2 using Table1B.doc, append ctitle("", 10-25)

reg durunemp wagedist_25_50 age sex marst educ
outreg2 using Table1B.doc, append ctitle("", 25-50)

reg durunemp wagedist_50_75 age sex marst educ
outreg2 using Table1B.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ
outreg2 using Table1B.doc, append ctitle("", 75-90)



*Full Regressions*
reg durunemp wagedist_10_90 age age2 sex marst educ educ2
outreg2 using Table1C.doc, replace title(Table 1.C: Regressions With Fixed Effects and Interaction Terms) ctitle("", 10-90)

reg durunemp wagedist_10_50 age age2 sex marst educ educ2
outreg2 using Table1C.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age age2 sex marst educ educ2
outreg2 using Table1C.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age age2 sex marst educ educ2 
outreg2 using Table1C.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age age2 sex marst educ educ2
outreg2 using Table1C.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age age2 sex marst educ educ2
outreg2 using Table1C.doc, append ctitle("", 10-75)

*Final Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table2A.doc, replace title(Table 2.A: Regressions With Fixed Effects and Interaction Term) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table2A.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table2A.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex marst educ educ2 
outreg2 using Table2A.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table2A.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex marst educ educ2
outreg2 using Table2A.doc, append ctitle("", 10-75)
===========================================================================*/

/*==========================================================================
/****Wage Disparity across state and floorocc****/
sort statefip floorocc
by statefip floorocc: egen incwage_10 = pctile(incwage), p(10)
by statefip floorocc: egen incwage_50 = pctile(incwage), p(50)
by statefip floorocc: egen incwage_75 = pctile(incwage), p(75)
by statefip floorocc: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table2B.doc, replace title(Table 2.B: Full Regressions Using floorocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table2B.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table2B.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex marst educ educ2
outreg2 using Table2B.doc, append ctitle("", 50-75)
 
reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table2B.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex marst educ educ2
outreg2 using Table2B.doc, append ctitle("", 10-75)
==========================================================================*/

/*=========================================================================
/****Wage Disparity across state and myocc****/
sort statefip myocc
by statefip myocc: egen incwage_10 = pctile(incwage), p(10)
by statefip myocc: egen incwage_50 = pctile(incwage), p(50)
by statefip myocc: egen incwage_75 = pctile(incwage), p(75)
by statefip myocc: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table2C.doc, replace title(Table 2.C: Full Regressions Using myocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table2C.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table2C.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex marst educ educ2 
outreg2 using Table2C.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table2C.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex marst educ educ2
outreg2 using Table2C.doc, append ctitle("", 10-75)
=========================================================================*/

***************************************************************************************
***************************************************************************************
***************************************************************************************

/*======================================================================
							Part 2
Drop Occupations With Low Frequencies
Wage Disparity Across 'state' and 'occ1990'
Wage Disparity Across 'state' and 'floorocc'
Wage Disparity Across 'state' and 'myocc'

Notes:
Table3A: By state and occ1990 regrssions with fixed effects and interaction term
Table3B: By state and floorocc regrssions with fixed effects and interaction term
Table3C: By state and myocc regrssions with fixed effects and interaction term
=====================================================================*/


/*======================================================================
/****Drop occupations with a frequency below 20****/
bysort occ1990: drop if _N < 20
bysort floorocc: drop if _N < 20
bysort myocc: drop if _N < 20
=====================================================================*/


/*======================================================================
/****Wage Disparity across state and occ1990****/
sort statefip occ1990
by statefip occ1990: egen incwage_10 = pctile(incwage), p(10)
by statefip occ1990: egen incwage_25 = pctile(incwage), p(25)
by statefip occ1990: egen incwage_50 = pctile(incwage), p(50)
by statefip occ1990: egen incwage_75 = pctile(incwage), p(75)
by statefip occ1990: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_10_25 = incwage_25 / incwage_10
gen wagedist_25_50 = incwage_50 / incwage_25
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75

*Final Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table2A.doc, replace dec(4) title(Table 2.A: Full Regressions using occ1990) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table2A.doc, append dec(4) ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table2A.doc, append dec(4) ctitle("", 50-90)

reg durunemp wagedist_10_25 age sex marst educ educ2
outreg2 using Table2A.doc, append dec(4) ctitle("", 10-25)

reg durunemp wagedist_25_50 age sex marst educ educ2
outreg2 using Table2A.doc, append dec(4) ctitle("", 25-50)

reg durunemp wagedist_50_75 age sex marst educ educ2 
outreg2 using Table2A.doc, append dec(4) ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table2A.doc, append dec(4) ctitle("", 75-90)
=====================================================================*/


/*====================================================================
/****Wage Disparity across state and floorocc****/
sort statefip floorocc
by statefip floorocc: egen incwage_10 = pctile(incwage), p(10)
by statefip floorocc: egen incwage_25 = pctile(incwage), p(25)
by statefip floorocc: egen incwage_50 = pctile(incwage), p(50)
by statefip floorocc: egen incwage_75 = pctile(incwage), p(75)
by statefip floorocc: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_10_25 = incwage_25 / incwage_10
gen wagedist_25_50 = incwage_50 / incwage_25
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table2B.doc, replace dec(4) title(Table 2.B: Full Regressions Using floorocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table2B.doc, append dec(4) ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table2B.doc, append dec(4) ctitle("", 50-90)

reg durunemp wagedist_10_25 age sex marst educ educ2
outreg2 using Table2B.doc, append dec(4) ctitle("", 10-25)

reg durunemp wagedist_25_50 age sex marst educ educ2
outreg2 using Table2B.doc, append dec(4) ctitle("", 25-50)

reg durunemp wagedist_50_75 age sex marst educ educ2
outreg2 using Table2B.doc, append dec(4) ctitle("", 50-75)
 
reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table2B.doc, append dec(4) ctitle("", 75-90)
====================================================================*/

/*======================================================================
/****Wage Disparity across state and myocc****/
sort statefip myocc
by statefip myocc: egen incwage_10 = pctile(incwage), p(10)
by statefip myocc: egen incwage_25 = pctile(incwage), p(25)
by statefip myocc: egen incwage_50 = pctile(incwage), p(50)
by statefip myocc: egen incwage_75 = pctile(incwage), p(75)
by statefip myocc: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_10_25 = incwage_25 / incwage_10
gen wagedist_25_50 = incwage_50 / incwage_25
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table2C.doc, replace dec(4) title(Table 2.C: Full Regressions Using myocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table2C.doc, append dec(4) ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table2C.doc, append ctitle("", 50-90)

reg durunemp wagedist_10_25 age sex marst educ educ2
outreg2 using Table2C.doc, append dec(4) ctitle("", 10-25)

reg durunemp wagedist_25_50 age sex marst educ educ2
outreg2 using Table2C.doc, append dec(4) ctitle("", 25-50)

reg durunemp wagedist_50_75 age sex marst educ educ2 
outreg2 using Table2C.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table2C.doc, append ctitle("", 75-90)
====================================================================*/


***************************************************************************************
***************************************************************************************
***************************************************************************************
***************************************************************************************

/*======================================================================
						Part 3
Drop Occupations With Low Frequencies
Wage Disparity Across 'state', 'marst' and 'occ1990'
Wage Disparity Across 'state', 'marst' and 'floorocc'
Wage Disparity Across 'state', 'marst' and 'myocc'

Notes:
Table4A: By 'state', 'marst' and 'occ1990' regrssions with fixed effects and interaction term
Table4B: By 'state', 'marst' and 'floorocc' regrssions with fixed effects and interaction term
Table4C: By 'state', 'marst' and 'myocc' regrssions with fixed effects and interaction term
=========================================================================*/

/****Convert marst into married unmarried****/
gen newmarst = 1 if marst == 1 | marst == 2
replace newmarst = 2 if marst > 2
 


/****Drop occupations with a frequency below 20****/
bysort occ1990: drop if _N < 20
bysort floorocc: drop if _N < 20
bysort myocc: drop if _N < 20



/****Wage Disparity across state occ1990 and marital status****/
sort statefip occ1990 newmarst
by statefip occ1990 newmarst: egen incwage_10 = pctile(incwage), p(10)
by statefip occ1990 newmarst: egen incwage_25 = pctile(incwage), p(25)
by statefip occ1990 newmarst: egen incwage_50 = pctile(incwage), p(50)
by statefip occ1990 newmarst: egen incwage_75 = pctile(incwage), p(75)
by statefip occ1990 newmarst: egen incwage_90 = pctile(incwage), p(90)


gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_10_25 = incwage_25 / incwage_10
gen wagedist_25_50 = incwage_50 / incwage_25
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex educ educ2
outreg2 using Table3A.doc, replace dec(3) title(Table 3.A: Full Regressions by State, Occupation, and Marital Status) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex educ educ2
outreg2 using Table3A.doc, append dec(3) ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex educ educ2
outreg2 using Table3A.doc, append dec(3) ctitle("", 50-90)

reg durunemp wagedist_10_25 age sex educ educ2
outreg2 using Table3A.doc, append dec(3) ctitle("", 10-25)

reg durunemp wagedist_25_50 age sex educ educ2
outreg2 using Table3A.doc, append dec(3) ctitle("", 25-50)

reg durunemp wagedist_50_75 age sex educ educ2 
outreg2 using Table3A.doc, append dec(3) ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex educ educ2
outreg2 using Table3A.doc, append dec(3) ctitle("", 75-90)



/*=====================================================================
/****Wage Disparity across state floorocc and marital status****/
sort statefip floorocc marst
by statefip floorocc marst: egen incwage_10 = pctile(incwage), p(10)
by statefip floorocc marst: egen incwage_50 = pctile(incwage), p(50)
by statefip floorocc marst: egen incwage_75 = pctile(incwage), p(75)
by statefip floorocc marst: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10


*Full Regressions*
reg durunemp wagedist_10_90 age sex educ educ2
outreg2 using Table4B.doc, replace title(Table 4.B: Full Regressions Using myocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex educ educ2
outreg2 using Table4B.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex educ educ2
outreg2 using Table4B.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex educ educ2
outreg2 using Table4B.doc, append ctitle("", 50-75)
 
reg durunemp wagedist_75_90 age sex educ educ2
outreg2 using Table4B.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex educ educ2
outreg2 using Table4B.doc, append ctitle("", 10-75)
======================================================================*/


/*=====================================================================
/****Wage Disparity across state myocc and marital status****/
sort statefip myocc marst
by statefip myocc marst: egen incwage_10 = pctile(incwage), p(10)
by statefip myocc marst: egen incwage_50 = pctile(incwage), p(50)
by statefip myocc marst: egen incwage_75 = pctile(incwage), p(75)
by statefip myocc marst: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10


*Full Regressions*
reg durunemp wagedist_10_90 age sex educ educ2
outreg2 using Table4C.doc, replace title(Table 4.C: Full Regressions Using myocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex educ educ2
outreg2 using Table4C.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex educ educ2
outreg2 using Table4C.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex educ educ2 
outreg2 using Table4C.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex educ educ2
outreg2 using Table4C.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex educ educ2
outreg2 using Table4C.doc, append ctitle("", 10-75)
======================================================================*/


***************************************************************************************
***************************************************************************************
***************************************************************************************


/*======================================================================
						Part 4
Isolate Specific Occupations with more than 250 observations and see if they conform to overall model

Notes:
Table5A: 
=======================================================================*/


/*======================================================================
/**** Analyze affects in individual occ's with more than 250 observations ****/

*drop if myocc != 1*

*drop if myocc != 21*

*drop if myocc != 40*

*drop if myocc != 54*

*drop if myocc != 72*

*drop if myocc != 76*

*drop if myocc != 77*

======================================================================*/


/*=======================================================================
/****Wage Disparity across state and occ1990****/
sort statefip occ1990
by statefip occ1990: egen incwage_10 = pctile(incwage), p(10)
by statefip occ1990: egen incwage_50 = pctile(incwage), p(50)
by statefip occ1990: egen incwage_75 = pctile(incwage), p(75)
by statefip occ1990: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Final Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table3A.doc, replace title(Table 5.A: Regressions With Fixed Effects and Interaction Term) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table3A.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table3A.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex marst educ educ2 
outreg2 using Table3A.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table3A.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex marst educ educ2
outreg2 using Table3A.doc, append ctitle("", 10-75)
======================================================================*/


/*====================================================================
/****Wage Disparity across state and floorocc****/
sort statefip floorocc
by statefip floorocc: egen incwage_10 = pctile(incwage), p(10)
by statefip floorocc: egen incwage_50 = pctile(incwage), p(50)
by statefip floorocc: egen incwage_75 = pctile(incwage), p(75)
by statefip floorocc: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table3B.doc, replace title(Table 3.B: Full Regressions Using floorocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table3B.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table3B.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex marst educ educ2
outreg2 using Table3B.doc, append ctitle("", 50-75)
 
reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table3B.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex marst educ educ2
outreg2 using Table3B.doc, append ctitle("", 10-75)
======================================================================*/

/*====================================================================
/****Wage Disparity across state and myocc****/
sort statefip myocc
by statefip myocc: egen incwage_10 = pctile(incwage), p(10)
by statefip myocc: egen incwage_50 = pctile(incwage), p(50)
by statefip myocc: egen incwage_75 = pctile(incwage), p(75)
by statefip myocc: egen incwage_90 = pctile(incwage), p(90)

gen wagedist_10_50 = incwage_50 / incwage_10
gen wagedist_10_90 = incwage_90 / incwage_10
gen wagedist_50_90 = incwage_90 / incwage_50
gen wagedist_50_75 = incwage_75 / incwage_50
gen wagedist_75_90 = incwage_90 / incwage_75
gen wagedist_10_75 = incwage_75 / incwage_10

*Full Regressions*
reg durunemp wagedist_10_90 age sex marst educ educ2
outreg2 using Table3C.doc, replace title(Table 2.C: Full Regressions Using myocc) ctitle("", 10-90)

reg durunemp wagedist_10_50 age sex marst educ educ2
outreg2 using Table3C.doc, append ctitle("", 10-50)

reg durunemp wagedist_50_90 age sex marst educ educ2
outreg2 using Table3C.doc, append ctitle("", 50-90)

reg durunemp wagedist_50_75 age sex marst educ educ2 
outreg2 using Table3C.doc, append ctitle("", 50-75)

reg durunemp wagedist_75_90 age sex marst educ educ2
outreg2 using Table3C.doc, append ctitle("", 75-90)

reg durunemp wagedist_10_75 age sex marst educ educ2
outreg2 using Table3C.doc, append ctitle("", 10-75)
======================================================================*/


