hpower<-data.frame(read.csv(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE))
finalpower<-subset(hpower,(hpower$Date=="1/2/2007" | hpower$Date=="2/2/2007"))
## format conversion

finalpower$Time<-strptime(paste(finalpower$Date,finalpower$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
finalpower$Date<-as.Date(finalpower$Date,format="%d/%m/%Y")
finalpower$Sub_metering_1<-as.numeric(finalpower$Sub_metering_1)
finalpower$Sub_metering_2<-as.numeric(finalpower$Sub_metering_2)
finalpower$Sub_metering_3<-as.numeric(finalpower$Sub_metering_3)

##plotting code

png(file="plot3.png",width=480,height=480)
plot(finalpower$Time,finalpower$Sub_metering_1,type="n",xlab="Time",ylab="Energy sub metering",main="Time vs Energy Sub-metering")
lines(finalpower$Time,finalpower$Sub_metering_1,col="blue")
lines(finalpower$Time,finalpower$Sub_metering_2,col="red")
lines(finalpower$Time,finalpower$Sub_metering_3,col="green")
legend("topright",col=c("blue","red","green"),legend=c("Sub_metering_1","sub_metering_2","Sub_metering_3"),lwd=1,lty=c(1,1,1,1),pch=c(NA,NA,NA,NA),merge=FALSE)
dev.off()