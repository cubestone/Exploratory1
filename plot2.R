data<-read.csv("household_power_consumption.txt",sep=";")

correct.data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

for(i in 3:9){
  
  correct.data[,i]<-as.numeric(as.character(correct.data[,i]))
  
}

Sys.setlocale("LC_TIME", "English")

DateTime <- as.POSIXct(paste(correct.data$Date, correct.data$Time), 
                       format="%d/%m/%Y %H:%M:%S",
                       )

png("plot2.png",width=480,height=480)

plot(DateTime,correct.data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()