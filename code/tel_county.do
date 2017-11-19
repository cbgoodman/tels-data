* ==================================
* TITLE: STATE-IMPOSED TAX AND EXPENDITURE LIMTITATIONS
* Created: 	11.17.2017
* Modified:	11.17.2017
* ==================================

* Description: This .do file expands the TEL data by state into long annual panel

set more off
clear all

* GLOBALS
* The $home directory will need to be changed
global home "~/Dropbox/Data/tels/tels-data/"
global raw "${home}rawdata/"
global exports "${home}exports/"

local begindate 1962
local finaldate 2012

* IMPORTING A CROSSWALK FOR FIPS CODES, STATE NAMES, AND STATE ABBREVIATIONS
* Importing and "loading in" the crosswalk
import excel using ${raw}crosswalk.xlsx, clear firstrow

* Renaming variables
rename Name statename
rename FIPSStateCode statefips
rename CensusStateCode statecode
rename USPSAbbreviation stateabb
replace stateabb = upper(stateabb)
label var stateabb "State Abbreviation"

destring statefips statecode, replace

* Saving crosswalk as a temporary file
tempfile crosswalk
save `crosswalk'
* Storing the levels of State FIPS for use in expanding dataset
levelsof statefips, local(fips)

* PREPARING THE TAX AND EXPENDITURE LIMIT DATA
* Load in raw TEL data
import excel using ${raw}tel_county_changes.xlsx, clear firstrow
destring statefips, replace

label var typename "Govt Type"
label var typecode "Census Govt Type Code"
label var opt_lim "Overall Rate Limit"
label var spt_lim "Specific Rate Limit"
label var ptrev_lim "Levy Limit"
label var assess_lim "Assessed Value Limit"
label var genrev_lim "General Revenue Limit"
label var genexp_lim "General Expenditure Limit"
label var fd "Full Disclosure Requirement"

merge m:1 statefips using `crosswalk', nogen keep(3)

order statefips statecode statename stateabb typecode typename year opt_lim spt_lim ptrev_lim assess_lim genrev_lim genexp_lim fd notes
label var statefips "State FIPS Code"
label var statename "State"

* Export to Stata file
sort stateabb year
save ${exports}tels_county_changes.dta, replace

* Export to Excel File
export excel using ${exports}tels_county_changes.xlsx, replace firstrow(varlabels)
