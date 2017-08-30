library(ggplot2)
library(lattice)
library(data.table)
library(gmodels)
library(dplyr)
setwd("E:\\R\\Exploratory Data Porject2")
nei <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
####2.Total Emissions Trend in US from 1999 to 2008
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#first subset method with group_by
total_emission <- summarize(group_by(nei, year), Emissions = sum(Emissions))
#second subset method with aggregate function
total_emission_2 <- with(nei, aggregate(Emissions, by= list(year), sum))
#using barplot
collabel <- c("red","darkgreen","yellow","darkblue")
par(mfrow = c(1,2))
q1 <- barplot(height = total_emission$Emissions/1000, 
              names.arg = factor(total_emission$year), 
              col = collabel, 
              main = "Total PM2.5 Emissions of US from 1999 to 2008",
              xlab= "years", ylab="Emissions(kilotons)", 
              ylim = c(0,8000))
#dev.copy(png, "Plot1.png",width = 480, height = 480, unit = "px")
#dev.off()
plot(total_emission_2/1000, type = "o", 
     main = "Total PM2.5 Emissions of US from 1999 to 2008", 
     xlab= "years", ylab="Emissions(kilotons)", pch = 19, 
     ol = "blue", lty = 6, ylim=c(0,8000))
#dev.copy(png, "Plot1.png",width = 480, height = 480, unit = "px")
#dev.off()
dev.copy(png, "Plot1_2.png",width = 480, height = 480, unit = "px")
dev.off()
