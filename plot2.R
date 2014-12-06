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

png("plot2.png",width = 480, height = 480)
with(data, plot(DT, Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")) 
dev.off()