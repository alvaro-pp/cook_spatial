# This script produces an ACS 5-year dataset from 2019 for Cook County, IL containing relevant variables from tidycensus.
  # Poverty status bu age and sex. 

# Date of production: 8/11/23
  # File status: Under construction
# Author: Thelonious Goerz

# Note: This file can be updated as needed with new variables.

rm(list = ls())
library(tidycensus)
library(tidyverse)
library(here)

# vars19 <- load_variables(year = 2019, "acs5")

acs_2019_cook <- get_acs(geography = "tract",
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
          n_f_blw_poverty_level = "B17001_017",
          n_f_blw_poverty_under5 =  "B17001_018",
          n_f_blw_poverty_5years = "B17001_019",
          n_f_blw_poverty_6to11 = "B17001_020",
          n_f_blw_poverty_12to14 = "B17001_021",
          n_f_blw_poverty_15years = "B17001_022",
          n_f_blw_poverty_16to17 = "B17001_023",
          n_f_blw_poverty_18to24 = "B17001_024",
n_f_blw_poverty_25to34 = "B17001_025",
n_f_blw_poverty_35to44 = "B17001_026",
n_f_blw_poverty_45to54 = "B17001_027",
n_f_blw_poverty_55to64 = "B17001_028",
n_f_blw_poverty_65to74 = "B17001_029",
n_f_blw_poverty_75up = "B17001_030"
        ),
        survey = "acs5",
        year = 2019,
output = "wide")


write_rds(acs_2019_cook,here("data","ACS_2019", "acs_2019.Rds"))
