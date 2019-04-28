library(plyr)
library(ggplot2)

#COMPLETED SCRIPTS
ggplot(data=subset(JoinedData, !is.na(LSUPoints)), mapping = aes(x= reorder(Opponent, offense_date), fill=Outcome)) +
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45))+
  ggtitle("Count of Crimes by LSU Opponents", "In Order of LSU 2018 Season")+
  geom_hline(yintercept = 125, color = 'gold', size = 1)+
  xlab("Opponent Universities")+
  ylab("Total Crime")
#Crime Count by Opponents in order of LSU Season(USE)

ggplot(data=subset(JoinedData, !is.na(LSUPoints)), mapping = aes(x=Outcome)) +
  geom_bar()+
  ggtitle("TotalCrime by LSU Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")
#don't use right now

ggplot(data=subset(JoinedData, !is.na(Outcome)), mapping = aes(x= crime, fill=Outcome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Crime Layout for LSU Game Days", "Colored by Game Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")
#Crime Layout for LSU Game Day by Outcome (USE)
ggplot(data=subset(JoinedData, is.na(Outcome)), mapping = aes(x= offense_date, y = crime)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Crime Layout for LSU Game Days", "Colored by Game Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")


ggplot(data = LSUFootball, mapping = aes(x = GameAttendance, y = LSUPoints)) +
  geom_point(size = 4, position = "jitter",color = 'purple') +
  ggtitle("LSU Points Scored by Game Attendance", "Colored by Outcome")+
  geom_hline(yintercept = 33, color = 'gold', size = 1)+
  xlab("Attendance")+
  ylab("LSU Points Scored")+
  scale_x_continuous(labels = scales::comma)+
  theme(axis.text.x = element_text(angle = 90))+
  facet_wrap(~Outcome)
#Point by Game Attendance Plot (USE THIS ONE)


ggplot(data=subset(JoinedData, !is.na(district)), mapping = aes(x=crime, fill=district)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("Total Crime by Type per District","Colored by Outcome")+
  xlab("Total Crime")+
  ylab("Type of Crime")
#Total Crime by Type and Colored by District (USE THIS ONE)

ggplot(data=subset(JoinedData, !is.na(a_c))) +
  geom_bar(mapping = aes(x = crime, fill = a_c)) +
  ggtitle("Total Crimes for 2018", "Separated by Committed and Attempted") +
  theme(axis.text.x = element_text(angle = 90))+
  xlab("Crime Type")+
  ylab("Total Crime")
#Crimes by Committed vs Attempted

ggplot(data=JoinedData, mapping = aes(x=district, fill = district)) +
  geom_bar()+
  ggtitle("Crime Count by District","Filtered By Crime Type")+
  xlab("District Number")+
  ylab("Crime Count")
#Crime by District (USE THIS, NAs are meaningful!!)

ggplot(data=subset(JoinedData, !is.na(Outcome)), mapping = aes(x=offense_date))+
  geom_bar() ->p

p+facet_grid(vars(crime))+
  ggtitle("Crime Count per District during Football Season")
#Faceted Crime by District, basically unreadable.


count(JoinedData, Crime)


count(JoinedData, offense_date, Sport, crime) %>%  
  group_by(Sport, crime) %>% 
  summarise(CrimeRateType = mean(n)) %>% 
  ggplot(mapping = aes(x = crime, y = CrimeRateType)) +
  geom_col()+
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Daily Crime Count by Type", "Faceted by LSU vs NonLSU Dates") +
  xlab("Crime Type") +
  ylab("Crime Rate")+
  facet_wrap(~Sport)
#faceted crime rates for LSU and NONLSU dates (USE THIS ONE)

count(JoinedData, offense_date, Sport, crime) %>%  
  group_by(Sport, offense_date) %>% 
  summarise(CrimeRateType = mean(n)) %>% 
  ggplot(mapping = aes(x = offense_date, y = CrimeRateType)) +
  geom_line(color = 'deepskyblue', size = 0.7)+ 
  ggtitle("Crime Rates for 2018", "Count of Crime Types per Day") +
  xlab("Date Committed") +
  ylab("Crime Rate")
#Crime Rate over 2018 (Can use to demonstarate line graph)






#TESTS ONLY FROM HERE DOWN -------------------------------------------------------------------------------------------------------



#faceted LSU Crime
facet_wrap((~Sport), labeller = "label_both", "LSU Dates", "Normal Dates")


count(JoinedData, offense_date, Sport, crime) %>%  
  group_by(Sport, crime) %>% 
  summarise(CrimeRateType = mean(n))+
  ggplot()


#attempted reorder but oh well

count(JoinedData, offense_date, Outcome, crime) %>%  
  group_by(Outcome, offense_date, crime) %>% 
  summarise(mean(n)) %>% 
  rename(JoinedData, 'Average' = 'mean(n)') -> CrimeAverages

  rename(CrimeAverages, 'Average' = 'mean(n)') %>% 
  ggplot(data = subset(CrimeAverages, !is.na(Outcome)), mapping = aes(x= crime)) +
  geom_bar(sort('mean(n', decreasing = TRUE)) +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Crime Layout for LSU Game Days", "Colored by Game Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")+
  facet_wrap(~Outcome)
  
  
  
  count(JoinedData, offense_date, Outcome, crime) %>%  
    group_by(Outcome, offense_date) -> CrimeAverages
    
    ggplot(data=subset(CrimeAverages, !is.na(Outcome)), mapping = aes(x= crime)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90))+
    ggtitle("Crime Layout for LSU Game Days", "Colored by Game Outcome")+
    xlab("Crime Type")+
    ylab("Total Crime")
    
    count(JoinedData, offense_date, Sport) %>%  
      group_by(Sport) -> CrimePerDay
 
       
    count(JoinedData, offense_date, Sport) %>%  
      group_by(Sport) %>% 
      ggplot(mapping = aes(x = offense_date, y = n)) +
      geom_line(color = 'deepskyblue', size = 0.7)+ 
      ggtitle("Crime Commited Crimes for 2018", "Count committed crimes per Day") +
      xlab("Date Committed") +
      ylab("Crime Rate")
#USE THIS YA DUMMY