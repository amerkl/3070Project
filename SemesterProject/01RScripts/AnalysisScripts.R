library(plyr)
library(ggplot2)

#COMPLETED SCRIPTS
ggplot(data=subset(JoinedData, !is.na(LSUPoints)), mapping = aes(x=Opponent, fill=Outcome)) +
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45))+
  ggtitle("Count of Crimes by LSU Opponents")+
  xlab("Opponent Universities")+
  ylab("Total Crime")
#Crime Count by Opponents

ggplot(data=subset(JoinedData, !is.na(LSUPoints)), mapping = aes(x=Outcome, fill=crime)) +
  geom_bar()+
  ggtitle("TotalCrime by LSU Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")

ggplot(data=subset(JoinedData, !is.na(Outcome)), mapping = aes(x=crime, fill=Outcome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("TotalCrime by LSU Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")
#Crime by Outcome

ggplot(data = LSUFootball) +
  geom_point(mapping = aes(x = GameAttendance, y = LSUPoints, color = Outcome, size = 9)) +
  ggtitle("LSU Points Scored by Game Attendance", "Colored by Outcome")+
  xlab("Attendance")+
  ylab("LSU Points Scored")
#Point by Game Attendance Plot

ggplot(data=subset(JoinedData, !is.na(district)), mapping = aes(x=crime, fill=district)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("Total Crime by Type per District","Colored by Outcome")+
  xlab("Total Crime")+
  ylab("Type of Crime")
#Total Crime by Type and Colored by District

ggplot(data=subset(JoinedData, !is.na(a_c))) +
  geom_bar(mapping = aes(x = crime, fill = a_c)) +
  ggtitle("Total Crimes for 2018", "Separated by Committed and Attempted") +
  theme(axis.text.x = element_text(angle = 90))+
  xlab("Crime Type")+
  ylab("Total Crime")
#Crimes by Committed vs Attempted

ggplot(data=JoinedData, mapping = aes(x=district, fill = crime)) +
  geom_bar()+
  ggtitle("Crime Count by District","Filtered By Crime Type")+
  xlab("District Number")+
  ylab("Crime Count")
#Crime by District

ggplot(data=subset(JoinedData, !is.na(Outcome)), mapping = aes(x=offense_date))+
  geom_bar() ->p

p+facet_grid(vars(crime))+
  ggtitle("Crime Count per District during Football Season")
#Faceted Crime by District, basically unreadable.