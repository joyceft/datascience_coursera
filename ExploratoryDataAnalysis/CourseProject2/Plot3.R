library(ggplot2)
library(lattice)
library(data.table)
library(gmodels)
library(dplyr)
setwd("E:\\R\\Exploratory Data Porject2")
nei <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
####4.Emissions of 4 types of Sources
#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of these 
#four sources have seen decreases in emissions from 1999-2008 
#for Baltimore City? Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system.
#subset Baltimore by its fip code
baltimore <- filter(nei, fips == "24510")
g <- ggplot(baltimore, aes(x=as.factor(year), y=Emissions, fill = factor(year)))
g + 
  geom_bar(stat="identity") + 
  facet_grid(.~type) +
  theme(axis.text.x = element_text(angle = 45,hjust = 1)) +
  labs(x="year", y="Emissions(tons)", 
       title="PM2.5 Emissions of 4 types of sources in Baltimore")
dev.copy(png, "Plot3.png")
dev.off()