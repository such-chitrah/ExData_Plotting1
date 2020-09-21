#reading Data into R
data<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\ExData_Plotting1\\household_power_consumption.txt",sep=";",skip=1)
cnames<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\ExData_Plotting1\\household_power_consumption.txt",sep=";",nrows=1)
colnames(data)<-cnames
data<-transform(data,Date=as.Date(Date,"%d/%m/%Y"),Time=as.hms(Time),Global_active_power=as.numeric(Global_active_power),
                Global_reactive_power=as.numeric(Global_reactive_power),Global_intensity=as.numeric(Global_intensity),
                Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2))
#subsetting the data from dates - 2007-02-01 and 2007-02-02
febdata<-filter(data, Date >=("2007-02-01") & Date <= ("2007-02-02"))

#PLOT 4 CODE:
dev.new(width=480,height=480,unit="px")

par(mfrow=c(2,2),mar=c(5,5,3,2))
#4.1
plot(febdata$datetime,febdata$Global_active_power,type="l",xlab= "",ylab = "Global Active Power(kilowatts)")
#4.2
plot(febdata$datetime,febdata$Voltage,type="l",xlab= "datetime",ylab = "Voltage")
#4.3
plot(febdata$datetime,febdata$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(febdata$datetime,febdata$Sub_metering_2,col="red",type="l")
lines(febdata$datetime,febdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#4.4
plot(febdata$datetime,febdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,"plot4.png")
dev.off()