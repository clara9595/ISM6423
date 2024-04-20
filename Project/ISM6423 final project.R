library(dplyr)
library(ggplot2)
library(readr)
library(maps)

df_marketing <- read.csv("Marketing_Data.csv")
df_user <- read.csv("User_Data.csv")
df_advertising <- read.csv("Advertising_Data.csv")

# Automatically convert all logical columns to integers
df_user <- df_user %>% mutate(across(where(is.logical), as.integer)) %>% mutate()

# Generate box plot showing age range per platform by gender
age_per_platform_by_gender <- ggplot(data=df_user, mapping=aes(x=platform, y=age)) + 
  geom_boxplot() + 
  facet_grid(gender ~ .)
# Generate column charts showing interests per country based on demographics
interests_per_country_by_demographics <- ggplot(data=df_user, mapping=aes(x=location, fill=interests)) + 
  geom_bar(position=position_dodge(width = 0.8), binwidth = 25) + 
  facet_grid(demographics ~ .)
