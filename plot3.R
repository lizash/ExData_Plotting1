# ---------------------------------------------------------------
# Coursera's Exploratory Data Analysis course
# Project 1
# This script prepares plot 3 in png format
# ---------------------------------------------------------------
# Read in the data. It is assumed that the data are in the current directory
all.power.df <- read.table("household_power_consumption.txt", header = T, sep = ';',
                           stringsAsFactors = F)

# Select only the data on the two days specified in the task
power.df <- all.power.df[all.power.df$Date %in% c("1/2/2007", '2/2/2007'), ]

# Create a variable that combines time and date and convert it to the date format
power.df$time <- paste(power.df$Date, power.df$Time, sep = ' ')
power.df$time <- strptime(power.df$time, format = "%d/%m/%Y %H:%M:%S")

# Convert columns that will be used in plots into numeric format
for (cln in c('Global_active_power', 'Sub_metering_1', 'Sub_metering_2',
              'Sub_metering_3', 'Global_reactive_power', 'Voltage')) {
  power.df[ , cln] <- as.numeric(power.df[ , cln])
}

# plot 3
png(file = 'plot3.png')
par(mfrow=c(1,1)) # single panel in a plot
plot(power.df$time, power.df$Sub_metering_1, type = 'l',
     ylab = "Energy sub metering", xlab = '', col = "black")
par(new=TRUE)

plot(power.df$time, power.df$Sub_metering_2, type = 'l', col = "red",
     xlab = "", ylab = "", xaxt = 'n', yaxt = 'n', ylim = c(0, 40))

par(new=TRUE)
plot(power.df$time, power.df$Sub_metering_3, type = 'l', col = "blue",
     xlab = "", ylab = "", xaxt = 'n', yaxt = 'n', ylim = c(0, 40))

legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c(1, 2, 4), lty=c(1,1,1))
dev.off()

