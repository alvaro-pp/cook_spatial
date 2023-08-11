# This script produces an ACS 5-year dataset from 2019 for Cook County, IL containing relevant variables from tidycensus.
  # Poverty status bu age and sex. 

# Date of production: 8/11/23
  # File status: Under construction
# Author: Thelonious Goerz

# Note: This file can be updated as needed with new variables.

rm(list = ls())
library(tidycensus)
library(tidyverse)

# vars19 <- load_variables(year = 2019, "acs5")

get_acs(geography = "tract",
        state = "IL",
        county = "Cook",
        
        variables = c(
           n_blw_poverty_denom = "B17001_001",
           n_total_blw_povery_level = "B17001_002", 
# Male
# Convention: N = number, M = Male,
# Blw_Poverty = Below poverty line, 
# Age = under5, 5year, 6to10 etc. 

          n_m_blw_poverty_level = "B17001_003", 
# Estimate!!Total:!!Income in the past 12 months below poverty level:!!Male:
# POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          n_m_below_poverty_under5 = "B17001_004",
          n_m_below_poverty_5year = "B17001_005", 
          n_m_blw_poverty_6to11 =  "B17001_006",
          n_m_blw_poverty_12to14 = "B17001_007",
          n_m_blw_poverty_15years = "B17001_008",
          n_m_blw_poverty_16to17 =  "B17001_009",
          n_m_blw_poverty_18to24 = "B17001_010",
          n_m_blw_poverty_25to34 = "B17001_011",
          n_m_blw_poverty_35to44 = "B17001_012",
          n_m_blw_poverty_45to54 = "B17001_013",
          n_m_blw_poverty_55to64 = "B17001_014",
          n_m_blw_poverty_65to74 = "B17001_015",
          n_m_blw_poverty_74up = "B17001_016",
# Female
          B17001_017
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:
            POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          549
          B17001_018
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!Under 5 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          550
          B17001_019
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!5 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          551
          B17001_020
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!6 to 11 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          552
          B17001_021
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!12 to 14 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          553
          B17001_022
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!15 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          554
          B17001_023
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!16 and 17 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          555
          B17001_024
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!18 to 24 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          556
          B17001_025
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!25 to 34 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          557
          B17001_026
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!35 to 44 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          558
          B17001_027
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!45 to 54 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          559
          B17001_028
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!55 to 64 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          560
          B17001_029
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!65 to 74 years
          POVERTY STATUS IN THE PAST 12 MONTHS BY SEX BY AGE
          tract
          561
          B17001_030
          Estimate!!Total:!!Income in the past 12 months below poverty level:!!Female:!!75 years and over
          
        ),
        survey = "acs5",
        year = 2019)