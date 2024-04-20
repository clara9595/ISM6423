library(dplyr)
library(readr)

df_marketing <- read.csv("C:/Users/clare/Downloads/ISM 6423 final report datasets/Marketing_Data.csv")
df_user <- read.csv("C:/Users/clare/Downloads/ISM 6423 final report datasets/User_Data.csv")
df_advertising <- read.csv("C:/Users/clare/Downloads/ISM 6423 final report datasets/Advertising_Data.csv")

# Inspecting data to find see if there is any missing value
str(df_marketing)
str(df_user)
str(df_advertising)

master_data <- right_join(df_user, df_advertising, by = "id")

# Automatically convert all logical columns to integers
clean_master <- master_data %>% mutate(across(where(is.logical), as.integer))






# Example of merging df_marketing and df_dummy on a common 'campaign_id'
# First ensure that 'campaign_id' is of the same type in both dataframes
df_marketing <- mutate(df_marketing, campaign_id = as.character(campaign_id))
df_dummy <- mutate(df_dummy, campaign_id = as.character(campaign_id))

# Merge marketing and dummy data on 'campaign_id'
combined_df_1 <- left_join(df_marketing, df_dummy, by = "campaign_id")

# Example of merging combined_df_1 with df_advertising on a common 'campaign_id'
# Ensure that 'campaign_id' is of the same type in df_advertising
df_advertising <- mutate(df_advertising, campaign_id = as.character(campaign_id))

# Final merge to create a fully combined dataframe
final_combined_df <- left_join(combined_df_1, df_advertising, by = "campaign_id")

# View the structure of the final combined dataframe to verify it has merged correctly
str(final_combined_df)

# Save the final combined dataframe to a new CSV file, if needed
write.csv(final_combined_df, "final_combined_data.csv", row.names = FALSE)
