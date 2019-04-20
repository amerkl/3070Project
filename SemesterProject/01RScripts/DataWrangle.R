#installing package to read API

library(RSocrata)
library(tidyverse)
#calling package to read API and filter it

token <- "NDto4CJ4JBrcMyuBGCp4NiXs5"
#Security Token

OriginalData <- read.socrata("https://data.brla.gov/resource/5rji-ddnu.json", app_token = token)
#Converting into data frame

OriginalData %>%
  select('offense_date', 'crime', 'a_c', 'district') -> AllCrime
#filtering API down to needed data

AllCrime %>%
  filter(str_detect(offense_date, "2018")) %>% 
  mutate(offense_date = lubridate::ymd(offense_date)) -> BRCrime



#LSUFootball Upload
LSUFootball <- read_csv(here::here("Data","2018LSUFootballSchedule.csv"),
                        col_types = cols(Date = col_date(format = "%m/%d/%Y"), 
                                         EndTime = col_skip(), GameAttendance = col_number(), 
                                         LSUPoints = col_number(), OpponentPoints = col_number(), 
                                         SpecialEvent = col_logical(), StartTime = col_skip()))
#mean(LSUFootball$LSUPoints)
#meanfunction
full_join(BRCrime, LSUFootball, by = c("offense_date" = "Date")) -> JoinedData
