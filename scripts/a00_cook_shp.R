# This script produces a shape file with the census tracts of Cook county, IL.
# Date of production: 8/3/23
# Author: Álvaro Padilla Pozo

# Whenever we're working with census geographies it's good to remeber that IL is associated with the code "17" and Cook county with the code "031".
# Source: https://www2.census.gov/programs-surveys/acs/summary_file/2015/documentation/geography/5yr_year_geo/il.xls

# Loading libraries
rm(list = ls())
library(sf) # v 1.0-13
library(tigris) # v 2.0.3
library(dplyr) # v 1.1.2
library(magrittr) # v 2.0.3
library(here) # v 1.0.1

# Loading tracts of cook county
cook <- tracts(state = 17, county = 031, year = 2021) %>% 
  mutate(GEOID = as.factor(GEOID)) %>% 
  select(GEOID, geometry)

# Writing a shape file.
st_write(cook, here("data", "cook.shp"), append = F)

