# This script matches information from the National Neighborhood Data Archive (NaNDA) to the census tracts of Cook County.
# About NaNDA: https://www.icpsr.umich.edu/web/ICPSR/series/1920

# Date of production: 8/3/23
# Author: Álvaro Padilla Pozo

# Loading libraries
rm(list = ls())
library(here)
library(tidyverse) # v. 2.0.0
library(sf)

# Load cook shapefile
cook <- st_read(here("data", "cook.shp")) %>% 
  mutate(GEOID = as.factor(GEOID))

# Note: All data were downloaded in "R" format (.rda)
# These data use census tracts from 2010, which makes it so we have missing data in 3% of the tracts.

# Parks by census tract (2001-16) (https://www.icpsr.umich.edu/web/ICPSR/studies/38586), has to be downloaded manually.
# We download data, unzip it, and paste it in our "data" folder within our git project.
parks <- load(file = here("data", "ICPSR_38586", "DS0001", "38586-0001-Data.rda"))
parks <- da38586.0001 %>% 
  mutate(GEOID = as.factor(TRACT_FIPS10)) %>% 
  filter(GEOID %in% cook$GEOID) %>% 
  select(-TRACT_FIPS10)
cook <- cook %>% 
  left_join(parks, by = "GEOID")

# Polluting sites by census tract (2018)(https://www.icpsr.umich.edu/web/ICPSR/studies/38597)
polsites <- load(file = here("data", "ICPSR_38597", "DS0001", "38597-0001-Data.rda"))
polsites <- da38597.0001 %>% 
  mutate(GEOID = as.factor(TRACT_FIPS10)) %>% 
  filter(GEOID %in% cook$GEOID & YEAR == 2018) %>% 
  select(-TRACT_FIPS10, -YEAR)
cook <- cook %>% 
  left_join(polsites, by = "GEOID")

# Traffic volume by census tract (1963-2019) (https://www.icpsr.umich.edu/web/ICPSR/studies/38584)  (https://www.icpsr.umich.edu/web/ICPSR/studies/38586)

traffic <- load(file = here("data", "ICPSR_38584", "DS0001", "38584-0001-Data.rda"))
traffic <- da38584.0001 %>% 
  mutate(GEOID = as.factor(TRACT_FIPS10)) %>% 
  filter(GEOID %in% cook$GEOID & YEAR == 2018) %>% 
  select(-TRACT_FIPS10, -YEAR)

cook <- cook %>% 
  left_join(traffic, by = "GEOID")


# Landcover (2001-16)(https://www.icpsr.umich.edu/web/ICPSR/studies/38598)
landcover <- load(file = here("data", "ICPSR_38598", "DS0001", "38598-0001-Data.rda"))
landcover <- da38598.0001 %>% 
  mutate(GEOID = as.factor(TRACT_FIPS),
         p_openspace = PROP_VALUE_21,
         p_lowintensityurban = PROP_VALUE_22,
         p_medintensityurban = PROP_VALUE_23,
         p_highintensityurban = PROP_VALUE_24,
         p_barrenland = PROP_VALUE_31,
         p_forest = PROP_VALUE_41+PROP_VALUE_42+PROP_VALUE_43,
         p_green_nonforest = PROP_VALUE_52+PROP_VALUE_71 #"Herbaceous + Schrub" 
         ) %>% 
  filter(GEOID %in% cook$GEOID & YEAR_INTP == 2016) %>% 
  select(-TRACT_FIPS, -YEAR_INTP, -starts_with("PROP"), -starts_with("VALUE"), GEOID, p_openspace, p_lowintensityurban, p_medintensityurban, p_highintensityurban, p_barrenland, p_forest, p_green_nonforest)

cook <- cook %>% 
  left_join(landcover, by = "GEOID") %>% 
  st_drop_geometry()

write_rds(cook, here("data", "nanda.Rds"))
D <- read_rds(here("data", "nanda.Rds"))
