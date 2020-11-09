file <- "data/household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";") 

#Set start and end dates to subset the dataframe
start_date <- strptime("01/02/2007", format="%d/%m/%Y")
end_date <- strptime("03/02/2007", format="%d/%m/%Y")

#This creates an auxiliary datetime column merging date and time columns
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

#The actual subset
df <- subset(df, DateTime >= start_date & DateTime < end_date )

#Sub metering vectors extracted from dataframe
sub1 <- as.numeric(df$Sub_metering_1)
sub2 <- as.numeric(df$Sub_metering_2)
sub3 <- as.numeric(df$Sub_metering_3)

#Create POSIXct days vector from DateTime column
days <- as.POSIXct(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Code to plot and save the result as png image
png("plot3.png", width = 480, height = 480, res = 100)
plot(days,sub1,ylab="Energy sub metering", type="n")
lines(days,sub1)
lines(days,sub2, col="red")
lines(days,sub3, col="blue")
legend("topright",legend=names(df)[7:9],lwd = 1, col = c("black","red","blue"))
dev.off()