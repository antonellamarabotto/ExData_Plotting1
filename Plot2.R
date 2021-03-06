setwd("C:/Users/Antonella/Desktop/ExploratoryData/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)# Hole set of data

DataToUSE<-data[66637:69516,]#Selecting data thrugh 1/2/2007 to 2/2/2007

#Transform to Kilowatts Global active power
DataToUSE[, "GlobalActivePowerKwatts"] <- as.numeric(DataToUSE[, "Global_active_power"]) /1000
#Choosing my graphic device and save it as "Plot2.png" in my working directory
png(filename = "Plot2.png", width = 480, height = 480, units = 'px')

with(DataToUSE, plot(seq(Time), GlobalActivePowerKwatts, xlim = c(0,2880), xaxt = "n", type="n", xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri","Sat"), col.axis="blue", las=2, tck=-.01)
lines(seq(DataToUSE$Time), DataToUSE$GlobalActivePowerKwatts)
dev.off()
