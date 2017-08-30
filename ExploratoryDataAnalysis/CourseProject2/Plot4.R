library(ggplot2)
library(lattice)
library(data.table)
library(gmodels)
library(dplyr)
setwd("E:\\R\\Exploratory Data Porject2")
nei <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
####5.Emissions of Coal combustion sources
#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999-2008?
coal <- grep("Coal$", SCC$EI.Sector)
coal_data <- SCC[coal,]
coal_nei <- nei[(nei$SCC %in% coal_data$SCC),]
coal_total <- summarize(group_by(coal_nei, year), Emissions = sum(Emissions))
gg <- ggplot(coal_total, aes(as.factor(year), Emissions/1000, fill = factor(year)))
gg + geom_bar(stat = "identity") +
  labs(x="year", y="Emissions(kilotons)", 
       title="PM2.5 Emissions of coal-sourses in US")
dev.copy(png, "Plot4.png")
dev.off()