#Plot2: scatter plot with line
png(file = "Plot2.png", 
    bg = "white",
    width = 480, height = 480, units = "px", pointsize = 10)

#x is the first column DT, y is the 2 column.
plot(plotdata$DT, plotdata$Global_active_power, 
     xlab = "Time Period",ylab = "Global Active Power(kilowatts)", 
     main = "Global Active Power vs Time Period", 
     type = "l", #1(L not 1) = line
     col = "blue") # stronger contrast

dev.off()


