# ---------------------------------------------------------------
# Coursera's Exploratory Data Analysis course
# Project 1
# This script prepares plot 1 in png format
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

# plot 1
png(file = 'plot1.png')
par(mfrow=c(1,1)) # single panel in a plot

hist(power.df$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = 'Frequency', main = "Global Active Power", xlim = c(0, 6),
     ylim = c(0, 1200), breaks = 12, col = 2, xaxt = 'n', yaxt = 'n')

# Annotate labels
xticks <- c(0, 2, 4, 6)
yticks <- (1:7 * 200) - 200
axis(1, at = xticks, labels = xticks)
axis(2, at = yticks, labels = yticks)
dev.off()

