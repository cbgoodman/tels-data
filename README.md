# Description
This replication package contains the Stata code and raw spreadsheets needed to create the state-level tax and expenditure limitation data contained in [Mullins and Cox (1995)](http://www.library.unt.edu/gpo/acir/Reports/information/M-194.pdf) and the [Lincoln Institute for Land Policy's](http://www.lincolninst.edu) [Signifiant Features of the Property Tax: Tax Limits](http://datatoolkits.lincolninst.edu/subcenters/significant-features-property-tax/Report_Tax_Limits.aspx).

## Contents of /code/
Run the following do-files to create the state-level extracts. You will need to change the ${home} directory in these do-files to match your directory setup. The running the code will update and replace the contents of the /exports/ and /release/ folders.
1. tel_county.do - creates a state-level dataset of TELs imposed on counties
2. tel_muni.do - creates a state-level dataset of TELs imposed on municipalities
3. tel_sd.do - creates a state-level dataset of TELs imposed on school districts

## Contents of /rawdata/
These are the spreadsheets called by the do-files above:
* tels_county_changes.xlsx - changes in TELs imposed on counties
* tels_muni_changes.xlsx - changes in TELs imposed on cities
* tels_sd_changes.xlsx - changes in TELs imposed on school districts
* crosswalk.xlsx - state fips codes, census codes, names, and abbreviations

## Source material
Full legal citations for all included data can be found on the [wiki](https://github.com/cbgoodman/localdebtlimits/wiki) at the top of this page.
