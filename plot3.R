if(!file.exists("./data")){dir.create("./data")}
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./data/data.zip", method= "curl")
#unzip data
unzip(zipfile="./data/data.zip",exdir="./data1")

#read data

PWC<- read.table("./data1/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(PWC)

#subset data
subset_data<- PWC[PWC$Date %in% c("1/2/2007","2/2/2007"),]
# numeric values

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<- as.numeric(subset_data$Global_active_power)
SuM1<- as.numeric(subset_data$Sub_metering_1)
SuM2<- as.numeric(subset_data$Sub_metering_2)
SuM3<-as.numeric(subset_data$Sub_metering_3)

# PNG
png("plot3.png", width=480, height=480)
plot(date_time,SuM1, col= "black", type = "l", ylab="Energy Submetering", xlab="")

lines(date_time,SuM2, col="blue", type = "l")
lines(date_time,SuM3,col="red", type = "l")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  lty=c(1,1,1)
           ,col=c("black","red","blue"))
    dev.off()
     