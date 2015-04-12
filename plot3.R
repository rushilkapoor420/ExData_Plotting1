## Defining Constants
fileName = "plot3.png"

## Reading Data
df <- read.table(file="Input Data//household_power_consumption.txt", header=TRUE, sep = ";", 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                 na.strings = "?")
df$Time <- strptime(paste(df$Date,df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subsetting data for the dates 2007-02-01 and 2007-02-02
data <- df[(df$Date == as.Date("2007-02-01")) | (df$Date == as.Date("2007-02-02")), ]
rm(df)

## Opening PNG Graphics Device
png(file=fileName)

## Creating Plot
par(mex=0.8)
par(bg="gainsboro")
plot(data$Time, data$Sub_metering_1, ylab ="Energy sub metering", xlab="",
     type="n",cex.lab = 1, cex.axis = 1)
lines(data$Time, data$Sub_metering_1)

points(data$Time, data$Sub_metering_2, cex=0)
lines(data$Time, data$Sub_metering_2, col="red")

points(data$Time, data$Sub_metering_3, cex=0)
lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright", lty = c(1,1,1), col= c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1)

## Closing Graphics Device
dev.off()
