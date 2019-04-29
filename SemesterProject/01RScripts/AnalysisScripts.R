library(plyr)
library(ggplot2)

#COMPLETED SCRIPTS
ggplot(data=subset(JoinedData, !is.na(LSUPoints)), mapping = aes(x= reorder(Opponent, offense_date), fill=Outcome)) +
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45, hjust = +1))+
  ggtitle("Count of Crimes by LSU Opponents", "In Order of LSU 2018 Season")+
  geom_hline(yintercept = 125, color = 'gold', size = 1)+
  xlab("Opponent Universities")+
  ylab("Total Crime")
#Crime Count by Opponents in order of LSU Season(USE)

count(JoinedData, offense_date, Sport) %>%  
  group_by(Sport) %>% 
  ggplot(mapping = aes(x = offense_date, y = n)) +
  geom_line(color = 'purple', size = 1)+ 
  ggtitle("Crimes for 2018", "Count of Crimes per Day in 2018") +
  xlab("Date Committed") +
  ylab("Crime count") +
  geom_hline(yintercept = 125, color = 'gold', size = 1)
#Line Chart for Daily Crimes Committed


ggplot(data=subset(JoinedData, !is.na(Outcome)), mapping = aes(x= crime, fill=Outcome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Crime Layout for LSU Game Days", "Colored by Game Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")
#Crime Layout for LSU Game Day by Outcome (USE)


ggplot(data = LSUFootball, mapping = aes(x = GameAttendance, y = LSUPoints)) +
  geom_point(size = 4, position = "jitter",color = 'purple') +
  ggtitle("LSU Points Scored by Game Attendance", "Faceted by Outcome")+
  geom_hline(yintercept = 33, color = 'gold', size = 1)+
  geom_vline(xintercept = 90340, color = 'gold', size =1)+
  xlab("Attendance")+
  ylab("LSU Points Scored")+
  scale_x_continuous(labels = scales::comma)+
  theme(axis.text.x = element_text(angle = 90))+
  facet_wrap(~Outcome)
#Point by Game Attendance Plot (USE THIS ONE)

ggplot(data=JoinedData, mapping = aes(x=district, fill = district)) +
  geom_bar()+
  ggtitle("Crime Count by District","Filtered By Crime Type")+
  xlab("District Number")+
  ylab("Crime Count")


ggplot(JoinedData, mapping = aes(x=crime, fill=district)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("Total Crime by Type per District","Colored by Outcome")+
  xlab("Total Crime")+
  ylab("Type of Crime")
#Total Crime by Type and Colored by District (USE THIS ONE)

count(JoinedData, offense_date, Sport, crime) %>%  
  group_by(Sport, crime) %>% 
  summarise(AverageRate = mean(n)) %>% 
  ggplot(mapping = aes(x = crime, y = AverageRate)) +
  geom_col(fill = 'purple')+
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Daily Crime Count by Type", "Faceted by LSU vs NonLSU Dates") +
  xlab("Crime Type") +
  ylab("Crime Rate")+
  facet_wrap(~Sport)

ggplot(data=JoinedData, mapping = aes(x=district, fill = district)) +
  geom_bar()+
  ggtitle("Total Crimes by District for 2018")+
  xlab("District Number")+
  ylab("Total Crime")

#Unused, but useful scripts ------------------------------------------------------------------------------------------------------

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


count(JoinedData, offense_date, Sport, crime) %>%  
  group_by(Sport, offense_date, crime) %>% 
  summarise(CrimeRateTypeTest = mean(n)) 
#Summary of data set for counts



count(JoinedData, offense_date, Sport, crime) %>%  
  group_by(Sport, offense_date) %>% 
  summarise(CrimeRateType = mean(n)) %>% 
  ggplot(mapping = aes(x = offense_date, y = CrimeRateType)) +
  geom_line(color = 'deepskyblue', size = 0.7)+ 
  ggtitle("Crime Rates for 2018", "Count of Crime Types per Day") +
  xlab("Date Committed") +
  ylab("Crime Rate")
#Crime Rate over 2018 (Can use to demonstarate line graph)