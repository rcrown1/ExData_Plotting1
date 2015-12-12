# Exploratory Data Analysis
# Project 1
# Plot4

#Set Working Directory
setwd("C:/Users/Rick/Documents/DataSciProjects/ExData_Plotting1")
# Load sqldf to allow for filtering of input file
library(sqldf)
# Read Input file filtered to the two specified days of 1/2/2007 and 2/2/2007
data <- read.csv.sql("../Graphing/household_power_consumption.txt", 
                     sql = "select * from file WHERE Date in('2/1/2007', '2/2/2007')", header = TRUE, sep = ";")

# Combine and reformat Date & Time 
dt <- as.POSIXct(paste(data$Date, data$Time), format="%m/%d/%Y %H:%M:%S")

sub1 <- cbind.data.frame(dt,measure=data$Sub_metering_1,mes_typ=1)
sub2 <- cbind.data.frame(dt,measure=data$Sub_metering_2,mes_typ=2)
sub3 <- cbind.data.frame(dt,measure=data$Sub_metering_3,mes_typ=3)
all_meter <- rbind(sub1,sub2,sub3)

# Create png file for plot
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

par(mfrow= c(2,2))
#Plot Graph 1
plot(dt,data$Global_active_power,type='l',ylab="Global Active Power(kilowatts)",
     xlab="",ylim=c(0,6))
#Plot Graph 2
plot(dt,data$Voltage,type='l',ylab="Voltage",
     xlab="datetime")
#Plot Graph 3

par(mar=c(4,6,2,4)) # Shrink margins
plot(all_meter$dt,all_meter$measure, type = "n", ylim =c(0,30), ylab="Energy sub metering",
     xlab="")
lines(dt,data$Sub_metering_1,col=1,lwd=1) # add a line for data$Sub_metering_1
lines(dt,data$Sub_metering_2,col=2,lwd=1) # add a line for data$Sub_metering_2
lines(dt,data$Sub_metering_3,col=4,lwd=1) # add a line for data$Sub_metering_3

legend("topright", # places a legend at the top right corner 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend
       lty=c(1,1),bty = "n", # sets legend to line symbol and no border
       lwd=c(0,0),col=c("black","blue","red")) # assigns line color and width
#Plot Graph 4
plot(dt,data$Global_reactive_power,type='l',ylab="Global_reactive_power",
     xlab="datetime")

## Close the PNG device
dev.off()
