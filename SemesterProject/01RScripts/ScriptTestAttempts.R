#INCOMPLETE SCRIPTS


#average crime count per lsu date per non lsu date INCOMPLETE
ggplot(data=subset(JoinedData, is(LSUPoints)), mapping = aes(x=crime, fill=Outcome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("")

#try2
ggplot(data = subset(JoinedData, !is.na(Outcome), mapping = aes(x=offense_date, fill(crime))))+
  geom_bar()

#still attempting
which(JoinedData$offense_date, arr.ind = FALSE, useNames = TRUE)

#Good Lord
table(!is.na(JoinedData$LSUPoints))

#kill me
which(CheckDates$FALSE==FALSE)

#whatever
JoinedData %>%
  group_by(!is.na())

JoinedData  %>% 
  count(crime)->CrimeTypeDF
ggplot(data = CrimeTypeDF, mapping = aes(crime))+
  geom_bar()

max(JoinedData$crime)

filter(JoinedData, Outcome=NonLSU)

as.data.frame(JoinedData$crime)->cdf

JoinedData$offense_date +
  filter(str_detect(offense_date, "2018-09-02"|"2018-09-08"|"2018-09-15"|"2018-09-22"|"2018-09-29"|"2018-10-06"|"2018-10-13"|
                      "2018-10-20"|"2018-11-03"|"2018-11-10"|"2018-11-17"|"2018-11-24"))


#Crime per audience count (if audience is above average) INCOMPLETE
ggplot(data=subset(JoinedData, is(Outcome)), mapping = aes(x=crime, fill=Outcome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("")

#Crime for LSU Point Parameters (COMPLETED)
mean(LSUFootball$LSUPoints)->AvgPoints


filter_(JoinedData$Outcome, "NA")


#Count of Crime Type per LSU Outcome**** COMPLETE
ggplot(data=subset(JoinedData, !is.na(Outcome)), mapping = aes(x=crime, fill=Outcome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90)) -> co

co+facet_grid(vars(Outcome))



#Total 2018 Crime by District
ggplot(data=JoinedData, mapping = aes(x=district, fill = crime)) +
  geom_bar() 

#trying stuff
ggplot(data = LSUFootball) +
  geom_point(mapping = aes(x = Outcome, y = LSUPoints)) #points by outcome

ggplot(data = LSUFootball) +
  geom_point(mapping = aes(x = GameAttendance, y = LSUPoints, color = Outcome, size = 9))  #) #+
#geom_smooth(mapping = aes(x = GameAttendance, y = LSUPoints))
#Graphic showing how Game Attendance Affects the Outcome and Points Scored over 2018

ggplot(data=JoinedData) +
  geom_bar(mapping = aes(x=crime, fill=district)) +
  theme(axis.text.x = element_text(angle = 90))

#Crime Count of Crime by Type per district

ggplot(data = JoinedData, mapping=aes(x=district, fill=crime)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))
#Crime count by district sorted by crime type

ggplot(data = JoinedData, mapping=aes(x=offense_date)) +
  geom_bar(color = 'steelblue') +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Crime Count per Day for 2018")

ggplot(JoinedData,mapping = aes(offense_date, crimeVector))+
  geom_line()

length(crimeVector)

c(JoinedData$crime)->crimeVector
count(JoinedData$crime)  

ggplot(data=subset(JoinedData, !is.na(LSUPoints)), mapping = aes(x=Outcome)) +
  geom_bar()+
  ggtitle("TotalCrime by LSU Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")
#don't use right now

ggplot(data=subset(JoinedData, is.na(Outcome)), mapping = aes(x= offense_date, y = crime)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Crime Layout for LSU Game Days", "Colored by Game Outcome")+
  xlab("Crime Type")+
  ylab("Total Crime")




CrimeTypeDF$crime->CrimeTypes