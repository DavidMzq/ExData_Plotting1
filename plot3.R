# Set Locale so the it could show English character in plot.
Sys.setlocale('LC_ALL','English')

#Read the data into data.frame name data
data<-read.table("./data/exdata_data_household_power_consumption/household_power_consumption.txt",skip=66636, nrows=2880,header=TRUE,na.strings="?" ,sep=";") 

#Rename data's columns with meaningful names
cnames<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data) <- cnames

#Merge Date and Time into a new column named DT
data$DT<-paste(data$Date,data$Time,sep=" ") 
data$DT<-  strptime(data$DT,"%d/%m/%Y %H:%M:%S")

#Begin plot

png("plot3.png",width = 480, height = 480)
with(data, plot(DT, Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering",col="black")) 
lines(data$DT, data$Sub_metering_2,type="l",xlab = "",ylab="Energy sub metering",col="red")
lines(data$DT, data$Sub_metering_3,type="l",xlab = "",ylab="Energy sub metering",col="blue")
legend("topright", lwd=1, lty=1, col = c("black","red","blue" ), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) 
dev.off()
