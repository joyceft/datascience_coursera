library(ggplot2)
library(lattice)
library(data.table)
library(gmodels)
library(dplyr)
setwd("E:\\R\\Exploratory Data Porject2")
nei <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
####7.Emissions of Baltimore and LA
#Compare emissions from motor vehicle sources in Baltimore City
#with emissions from motor vehicle sources in Los Angeles County, 
#California (fips == "06037"). Which city has seen greater changes 
#over time in motor vehicle emissions

#subset data
motor_bal_nei <- summarize(group_by(
  filter(nei, fips=="24510"&type=="ON-ROAD"), year), 
  Emissions = sum(Emissions))
motor_la_nei <- summarize(group_by(
  filter(nei, fips=="06037"&type=="ON-ROAD"), year), 
  Emissions = sum(Emissions))
#add new variables as the compare factor
motor_bal_nei$county <- "Baltimore"
motor_la_nei$county <- "LA"
motor_bal_la <- rbind(motor_bal_nei, motor_la_nei)
ggplot(motor_bal_la, aes(as.factor(year), Emissions, fill = county)) +
  geom_bar(stat="identity") + 
  facet_grid(county~., scales="free") +
  labs(xlab = "year", ylab = "Emissions(tons)", 
       title="PM2.5 Emissions of Motor Vehicles in Baltimore and LA")
dev.copy(png,"Plot6.png")
dev.off()