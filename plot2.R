hpower<-data.frame(read.csv(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE))
finalpower<-subset(hpower,(hpower$Date=="1/2/2007" | hpower$Date=="2/2/2007"))

##format conversion
finalpower$Global_active_power<-as.numeric(finalpower$Global_active_power)
finalpower$Time<-strptime(paste(finalpower$Date,finalpower$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
finalpower$Date<-as.Date(finalpower$Date,format="%d/%m/%Y")

##plotting code
png(file="plot2.png")
plot(finalpower$Time,finalpower$Global_active_power,type="l",main="Line graph",xlab="Time",ylab="Golbal_active_power(kilowatts)")
dev.off()