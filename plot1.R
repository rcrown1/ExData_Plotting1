# Exploratory Data Analysis
# Project 1
# Plot1

#Set Working Directory
setwd("C:/Users/Rick/Documents/DataSciProjects/ExData_Plotting1")
# Load sqldf to allow for filtering of input file
library(sqldf)
# Read Input file filtered to the two specified days of 1/2/2007 and 2/2/2007
data <- read.csv.sql("../Graphing/household_power_consumption.txt", 
             sql = "select * from file WHERE Date in('1/2/2007' , '2/2/2007')", header = TRUE, sep = ";")
# Create png file for plot
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

#Plot Graph
hist(data$Global_active_power, col = "red", main="Global Active Power",
     xlab="Global Active Power(kilowatts)") 
## Close the PNG device
dev.off()
