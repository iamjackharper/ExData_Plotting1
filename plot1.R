file <- "data/household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";") 

#Set start and end dates to subset the dataframe
start_date <- strptime("01/02/2007", format="%d/%m/%Y")
end_date <- strptime("03/02/2007", format="%d/%m/%Y")

#This creates an auxiliary datetime column merging date and time columns
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

#The actual subset
df <- subset(df, DateTime >= start_date & DateTime < end_date )

#Global Active Power vector extracted from dataframe
gap <- as.numeric(df$Global_active_power)

#Code to plot and save the result as png image
png("plot1.png", width = 480, height = 480, res = 100)
hist(gap,xlab="Global Active Power", main ="Global Active Power", col = "red")
dev.off()