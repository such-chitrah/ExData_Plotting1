#reading Data into R
data<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\ExData_Plotting1\\household_power_consumption.txt",sep=";",skip=1)
cnames<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\ExData_Plotting1\\household_power_consumption.txt",sep=";",nrows=1)
colnames(data)<-cnames
data<-transform(data,Date=as.Date(Date,"%d/%m/%Y"),Time=as.hms(Time),Global_active_power=as.numeric(Global_active_power),
                Global_reactive_power=as.numeric(Global_reactive_power),Global_intensity=as.numeric(Global_intensity),
                Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2))
#subsetting the data from dates - 2007-02-01 and 2007-02-02
febdata<-filter(data, Date >=("2007-02-01") & Date <= ("2007-02-02"))

#PLOT 2 CODE:
dev.new(width=480,height=480,unit="px")
plot(febdata$datetime,febdata$Global_active_power,type="l",xlab= "",ylab = "Global Active Power(kilowatts)")
dev.copy(png,"plot2.png")
dev.off()

