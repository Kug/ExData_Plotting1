data <- read.table(file="household_power_consumption.txt",sep=";",header=FALSE,na.strings="?",nrows=2880,skip=66637) 
colnames(data) <- c("date","time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3") 

data$datetime <- strptime(paste(data$date,data$time, sep = " "), format = "%d/%m/%Y %H:%M:%S") 
data$date <- as.Date(data$date,format="%d/%m/%Y") 

## Plot the data and save the plot as plot1.png 
png(filename = "plot1.png", width = 480, height = 480) 


hist(data$GlobalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)") 


dev.off() 
