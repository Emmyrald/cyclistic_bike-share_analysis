# Importing important packages
library (tidyverse)
library(dplyr)
library(lubridate)


#Loading data from file
bike <- read_csv("../Desktop/Data_analytics/cyclist_bike-share-project/cyclist_bike-share.csv")
str(bike)
View(bike)

# Exploring subsets of the data 
bike_100 <- bike %>% drop_na() %>% head(n=2500)
sample_size <- 2500

# Filter and sample the 'casual' members
casual_sample <- bike %>%
  # check mebership status
  filter(member_casual == "casual") %>%
  # remove null
  drop_na() %>%
  #define sample size
  sample_n(size = sample_size) # Sample N from the casual group

# Filter and sample the 'member' members
member_sample <- bike %>%
  filter(member_casual == "member") %>%
  # remove null
  drop_na() %>%
  #define sample size
  sample_n(size = sample_size) # Sample N from the member group

# Combine the two samples into a final 50/50 dataframe
balanced_bike_5k <- bind_rows(casual_sample, member_sample)

# Check the new dataframe structure (should be exactly 50/50)
balanced_bike_5k %>% count(member_casual)

random_bike_5k <- bike %>%
  drop_na() %>%
  sample_n(size=5000)



# Cleaning data: Converting into correct date format 
rides <- bike %>%
  mutate(
    started_at = ymd_hms(started_at),
    ended_at = ymd_hms(ended_at),
    weekday = factor(weekday, 
                     levels = c("Monday","Tuesday","Wednesday",
                                "Thursday","Friday","Saturday","Sunday"))
  ) %>%
  filter(ride_length > 0)

# Determining the average ride length based on membership
rides %>% group_by(member_casual) %>%
  summarise(
    total_rides = n(),
    avg_duration = mean(ride_length),
    median_duration = median(ride_length),
    avg_distance = mean(aprox_distance, na.rm = TRUE)
  )


rides <- rides %>%
  mutate(
    started_at = ymd_hms(started_at),
    weekday = wday(started_at, label = TRUE, abbr = FALSE)
  )


# The Daily patterns of rides by each group: Number of rides per day
rides_per_day <- rides %>%
  group_by(weekday, member_casual) %>%
  summarise(rides = n(),average_dur = mean(ride_length), .groups = "drop")

# Plotting Weekday against Number of rides
rides_per_day %>% 
  ggplot() + 
  geom_col(mapping = aes(weekday, rides, fill = member_casual), position = "dodge") +
             labs(title = "Proportion of Rides by Day", y = "Total Daily Rides")

# Determining the time of the day that riders operate
rides %>%
  mutate(hour = hour(started_at)) %>%
  group_by(hour, member_casual) %>%
  summarise(rides = n(), .groups = "drop")

# Checking ride type preferences
bike_pref <- rides %>%
  group_by(member_casual, rideable_type) %>%
  summarise(n = n(), .groups = "drop_last") %>%
  mutate(percent = n / sum(n) * 100)

# Percentage of Member type per ride type
bike_pref %>%
  ggplot() + 
  geom_col(mapping = aes(rideable_type, percent, fill = member_casual), position = "dodge") +
           labs(
             title = "Bike Type Preference by Rider Type",
             x = "Ride Type",
             y = "Percentage of Rides"
               )

ggplot(rides, aes(ride_length, aprox_distance, color = member_casual)) +
  geom_point(alpha = 0.1) +
  labs(title = "Ride Duration vs Distance")


  
