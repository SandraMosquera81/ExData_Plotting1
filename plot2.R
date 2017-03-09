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

# PNG
png("plot2.png", width=480, height=480)
plot(date_time, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


