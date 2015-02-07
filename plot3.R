data<-read.csv("household_power_consumption.txt",sep=";")

correct.data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

for(i in 3:9){
  
  correct.data[,i]<-as.numeric(as.character(correct.data[,i]))
  
}

Sys.setlocale("LC_TIME", "English")

DateTime <- as.POSIXct(paste(correct.data$Date, correct.data$Time), 
                       format="%d/%m/%Y %H:%M:%S",
)

png("plot3.png",width=480,height=480)

plot(DateTime,correct.data$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     ylim=c(0,40),
     xlab="")

lines(DateTime,correct.data$Sub_metering_2,col="red")

lines(DateTime,correct.data$Sub_metering_3,col="blue")

legend("topright",
       lty= 1,
       lwd=2,
       xjust=0,
       yjust=0, 
       y.intersp=1,
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )

dev.off()