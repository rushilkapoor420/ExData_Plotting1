## Defining Constants
fileName = "plot2.png"

## Reading Data
df <- read.table(file="Input Data//household_power_consumption.txt", header=TRUE, sep = ";", 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                 na.strings = "?")
df$Time <- strptime(paste(df$Date,df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subsetting data for the dates 2007-02-01 and 2007-02-02
data <- df[(df$Date == as.Date("2007-02-01")) | (df$Date == as.Date("2007-02-02")), ]
rm(df)

## Creating Plot
par(mex=0.8)
par(bg="gainsboro")
plot(data$Time, data$Global_active_power, ylab ="Global Active Power (kilowatts)", xlab="",
     type="n",cex.lab = 0.75, cex.axis = 0.75)
lines(data$Time, data$Global_active_power)

## Copying plot into a png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, filename = fileName)
dev.off()
