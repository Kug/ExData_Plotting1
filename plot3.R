data <- read.table(file="household_power_consumption.txt",sep=";",header=FALSE,na.strings="?",nrows=2880,skip=66637) 
colnames(data) <- c("date","time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3") 

data$datetime <- strptime(paste(data$date,data$time, sep = " "), format = "%d/%m/%Y %H:%M:%S") 
data$date <- as.Date(data$date,format="%d/%m/%Y") 

## Plot the data and save the plot as plot3.png 
png(filename = "plot3.png", width = 480, height = 480) 


 
with(data, plot(y=SubMetering1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering")) 
with(data, lines(y=SubMetering1,x=datetime,col="black")) 
with(data, lines(y=SubMetering2,x=datetime,col="red")) 
with(data, lines(y=SubMetering3,x=datetime,col="blue")) 
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
 

dev.off() 
