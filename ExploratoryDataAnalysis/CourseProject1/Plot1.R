#1.Histogram:
# set the default arguments for this histogram
png(file = "Plot1.png", 
    bg = "white",
    width = 480, height = 480, units = "px", pointsize = 10)

hist(plotdata$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     breaks = 30,
     xaxt = "n",
     yaxt = "n", bg = "white") # not show the axis scale, set them later
#prob = TRUE
#when want the density plot
axis = axis(1, at = seq(0,7,1))#set x axis scale
axis = axis(2, at = seq(0,1300,200)) #set y axis scale
rug(plotdata$Global_active_power)

dev.off()


