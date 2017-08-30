#Plot3: ggplot to put 3 lines in one graph
png(file = "Plot3.png", 
    bg = "white",
    width = 480, height = 480, units = "px", pointsize = 10)
#require(ggplot2)
#p1 <- ggplot(plotdata, aes(DT))
 # p1 + geom_line(aes(y= plotdata$Sub_metering_1), color = "black" )
  #p1 + geom_line(aes(y= plotdata$Sub_metering_2), color = "red" )
  #p1 + geom_line(aes(y= plotdata$Sub_metering_3), color = "blue" )
  #p1 <- p1 + ylab("Energy Sub Metering") + xlab("Time Period")
  #legend add failed
  #try add line method
plot(plotdata$DT, plotdata$Sub_metering_1, type = "l", 
     xlab = "Time Period", ylab = "Energy Sub Metering", col = "black")
lines(plotdata$DT, plotdata$Sub_metering_2, type = "l", col = "red")
lines(plotdata$DT, plotdata$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty =1, cex = 1)

dev.off()


