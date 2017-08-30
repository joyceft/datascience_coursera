#Plot 4: plot1+2+3+4
#plot4 use par(mfrow= c(2,2))to put all pngs together
png(file = "Plot4-2.png", 
   width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#plot1
plot(plotdata$DT, plotdata$Global_active_power, 
     xlab = "Time Period",ylab = "Global Active Power(kilowatts)", 
     main = "Global Active Power vs Time Period", 
     type = "l", #1(L not 1) = line
     col = "blue") # stronger contrast


#Plot2

plot(plotdata$DT, plotdata$Voltage,
     xlab = "datetime", ylab = "Voltage",
     type = "l")

#plot3

plot(plotdata$DT, plotdata$Sub_metering_1, type = "l", 
     xlab = "Time Period", ylab = "Energy Sub Metering", col = "black")
lines(plotdata$DT, plotdata$Sub_metering_2, type = "l", col = "red")
lines(plotdata$DT, plotdata$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty =1, cex = 1)

#plot4

plot(plotdata$DT, plotdata$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", 
     type = "l", col = "black")

#dev.off()



