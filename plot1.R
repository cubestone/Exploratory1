data<-read.csv("household_power_consumption.txt",sep=";")

correct.data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

for(i in 3:9){
  
  correct.data[,i]<-as.numeric(as.character(correct.data[,i]))
  
}

png("plot1.png",width=480,height=480)

hist(correct.data$Global_active_power,
     
     main="Global Active Power",
     ylim=c(0,1200),
    
     col="red",
     xlab="Global Active Power (kilowatts)"
     )

dev.off()