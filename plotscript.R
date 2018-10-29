library(rlist)
fbData <- read.csv("temp_datalab_records_social_facebook.csv")
disney<-fbData[fbData$username == "Disneyland",]

rate<-0
for (i in 2:length(disney$time)){rate<-list.append(rate,(disney$checkins[i]-disney$checkins[i-1]) / as.numeric((as.Date(disney$time[i])-as.Date(disney$time[i-1]))))}

plot(as.Date(disney$time),disney$talking_about_count,xlab="Time (days)",ylab="FB 'talking about' count per day",xlim=as.Date(c("2017-01-01","2018-07-31")))
plot(as.Date(disney$time),rate,xlab="Time (days)",ylab="FB check-in rate (check-ins/day)",xlim=as.Date(c("2017-01-01","2018-07-31")))