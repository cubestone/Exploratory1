data<-read.csv("household_power_consumption.txt",sep=";")

correct.data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

for(i in 3:9){
  
  correct.data[,i]<-as.numeric(as.character(correct.data[,i]))
  
}

Sys.setlocale("LC_TIME", "English")

DateTime <- as.POSIXct(paste(correct.data$Date, correct.data$Time), 
                       format="%d/%m/%Y %H:%M:%S",
)

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot1<-plot(DateTime,correct.data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

plot2<-plot(DateTime,correct.data$Voltage,
            type="l",
            ylab="Voltage",
            )

plot3<-plot(DateTime,correct.data$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     ylim=c(0,40),
     xlab="")

lines(DateTime,correct.data$Sub_metering_2,col="red")

lines(DateTime,correct.data$Sub_metering_3,col="blue")

legend("topright",
       lty= 1,
       lwd=2,
       box.lty=0,
       xjust=0.5,
       yjust=0.5, 
       y.intersp=0.7,
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

plot4<-plot(DateTime,correct.data$Global_reactive_power,
            type="l",
            ylab="Global_reactive_power",
            )

dev.off()