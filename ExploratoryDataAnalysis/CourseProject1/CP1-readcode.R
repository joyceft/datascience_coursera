require(data.table)
require(stringr)
require(dplyr)
require(tidyr)
all_class <- c("character","character","numeric","numeric",
               "numeric","numeric","numeric","numeric","numeric")
rowdata0 <- read.table("household_power_consumption.txt", sep = ";",
                       colClasses = all_class, header = TRUE, na.strings = "?", 
                       stringsAsFactors = FALSE)
select_date_rowdata0 <- filter(rowdata0, 
                               Date == "1/2/2007"|Date == "2/2/2007")
datetime_rowdata0 <- tidyr::unite(select_date_rowdata0, 
                                  "DT",Date, Time, sep = "")
datetime_rowdata0$DT <- as.POSIXlt(strptime(datetime_rowdata0$DT, "%d/%m/%Y%H:%M:%S")) 
plotdata <- datetime_rowdata0
