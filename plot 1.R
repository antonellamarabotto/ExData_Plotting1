#Plot 1:Global Active power
#Setting working directory: Choose de directory where your data holds place
setwd("C:/Users/Antonella/Desktop/ExploratoryData/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)# Hole set of data

DataToUSE<-data[66637:69516,]#Selecting data thrugh 1/2/2007 to 2/2/2007

#Transform to Kilowatts Global active power
DataToUSE[, "GlobalActivePowerKwatts"] <- as.numeric(as.character(DataToUSE[, "Global_active_power"])) /1000

#Choosing my graphic device and save it as "Plot1.png" in my working directory
png(filename = "Plot1.png", width = 480, height = 480, units = 'px')
hist(as.numeric(DataToUSE$GlobalActivePowerKwatts), breaks=11 ,col = "red", main = "Global Active Power", xlab = "Global active power(kilowatts)", xlim = c(0,6), ylim = c(0,1200))
dev.off()#Closing graphics device
