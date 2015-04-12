## Defining Constants
fileName = "plot4.png"

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

## Creating Plots
par(mfrow = c(2,2))
par(bg="gainsboro")
par(mar=c(5.1,4.1,3,2.1))

## PLOT 1
plot(data$Time, data$Global_active_power, ylab ="Global Active Power", xlab="",
     type="n",cex.lab = 1, cex.axis = 1)
lines(data$Time, data$Global_active_power)
## PLOT 2
plot(data$Time, data$Voltage, ylab ="Voltage", xlab="datetime",
     type="n",cex.lab = 1, cex.axis = 1)
lines(data$Time, data$Voltage)
## PLOT 3
plot(data$Time, data$Sub_metering_1, ylab ="Energy sub metering", xlab="",
     type="n",cex.lab = 1, cex.axis = 1)
lines(data$Time, data$Sub_metering_1)

points(data$Time, data$Sub_metering_2, cex=0)
lines(data$Time, data$Sub_metering_2, col="red")

points(data$Time, data$Sub_metering_3, cex=0)
lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright", lty = c(1,1,1), col= c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=1)
## PLOT 4
plot(data$Time, data$Global_reactive_power, ylab ="Global_reactive_power", xlab="datetime",
     type="n",cex.lab = 1, cex.axis = 1)
lines(data$Time, data$Global_reactive_power)

## Closing Graphics Device
dev.off()

