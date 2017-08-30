library(ggplot2)
library(lattice)
library(data.table)
library(gmodels)
library(dplyr)
setwd("E:\\R\\Exploratory Data Porject2")
nei <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
####6.Motor vehicle emissions of Baltimore
#How have emissions from motor vehicle sources changed from 1999-2008 
#in Baltimore City?
baltimore <- filter(nei, fips == "24510")
motor_bal <- subset(baltimore, type == "ON-ROAD")
motor_bal_nei <- summarize(group_by(motor_bal, year), Emissions= sum(Emissions))
ww <- ggplot(motor_bal_nei, aes(as.factor(year), Emissions, fill = factor(year))) 
ww + geom_bar(stat = "identity") +
  labs(xlab = "year", ylab = "Emissions(tons)", title="PM2.5 Emissions of Motor Vehicles in US")
dev.copy(png, "Plot5.png")
dev.off()