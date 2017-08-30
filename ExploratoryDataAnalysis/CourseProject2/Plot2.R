library(ggplot2)
library(lattice)
library(data.table)
library(gmodels)
library(dplyr)
setwd("E:\\R\\Exploratory Data Porject2")
nei <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
####3.Emissions of Baltimore City
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system.
```{r}
#subset Baltimore by its fip code
baltimore <- filter(nei, fips == "24510")
t_b <- summarize(group_by(baltimore, year), Emissions = sum(Emissions))
t_b_2 <- with(baltimore, aggregate(Emissions, by=list(year), sum))
#using barplot/plot
par(mfrow = c(1,2))
q2 <- barplot(height = t_b$Emissions/1000, names.arg=t_b$year,
              col=collabel, 
              main ="Total PM2.5 Emissions of Baltimore City", 
              xlab = "yaers", ylab = "Emissions(kilotons)", 
              ylim = c(0,4))
plot(t_b_2/1000, type = "o", col="darkgreen", 
     main ="Total PM2.5 Emissions of Baltimore City", 
     xlab = "yaers", ylab = "Emissions(kilotons)",
     ylim = c(0,4),pch=9, lty=6)
dev.copy(png, "Plot2_2.png",width = 480, height = 480, unit = "px")
dev.off()