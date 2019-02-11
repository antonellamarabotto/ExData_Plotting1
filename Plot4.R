setwd("C:/Users/Antonella/Desktop/ExploratoryData/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)# Hole set of data

DataToUSE<-data[66637:69516,]#Selecting data thrugh 1/2/2007 to 2/2/2007


#Choosing my graphic device and save it as "Plot4.png" in my working directory
png(filename = "Plot4.png", width = 480, height = 480, units = 'px')


#Initiating plot
#Choosing my graphic device and save it as "Plot4.png" in my working directory
png(filename = "Plot4.png", width = 480, height = 480, units = 'px')
par(mfrow=c(2,2))
#Plot 2
#Transform to Kilowatts Global active power
DataToUSE[, "GlobalActivePowerKwatts"] <- as.numeric(DataToUSE[, "Global_active_power"]) /1000
with(DataToUSE, plot(seq(Time), GlobalActivePowerKwatts, xlim = c(0,2880), xaxt = "n", type="n", xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri","Sat"), col.axis="blue", las=2, tck=-.01)
lines(seq(DataToUSE$Time), DataToUSE$GlobalActivePowerKwatts)

#Plot: Datetime vs voltage
with(DataToUSE, plot(seq(Time), as.numeric(as.character(Voltage)), xlim = c(0,2880), xaxt = "n", type="n", xlab = "datetime", ylab = "voltage", yaxt="n"))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri","Sat"), col.axis="blue", las=2, tck=-.01)
axis(2, at = c(234000, 238000, 242000,246000), labels = c("234", "238","242", "246"), col.axis="blue", las=2, tck=-.01)
lines(seq(DataToUSE$Time), as.numeric(as.character(DataToUSE$Voltage)))


#Plot 3
with(DataToUSE, plot(seq(Time),as.numeric(Sub_metering_3), xlim = c(0, 2880), ylim=c(0,40000), xaxt = "n", yaxt = "n", type = "n", xlab = "", ylab = "Energy sub metering"))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri","Sat"), col.axis="blue", las=2, tck=-.01)
axis(2, at = c(0, 10000, 20000, 30000), labels = c(0, 10, 20, 30), las=2, tck=-.01)
lines(seq(DataToUSE$Time), as.numeric(as.character(DataToUSE$Sub_metering_1)))
lines(seq(DataToUSE$Time), as.numeric(as.character(DataToUSE$Sub_metering_2)), col="red")
lines(seq(DataToUSE$Time), DataToUSE$Sub_metering_3, col="blue")
legend("topright", col = c("blue","black", "red"),lty = c(1,1,1), legend = c("Sub_metering_3", "Sub_metering_1", "Sub_metering_2"))

#Plot: Datetime vs Global reactive power
with(DataToUSE, plot(seq(Time), as.numeric(as.character(Global_reactive_power)), xlim = c(0,2880), xaxt = "n", type="n", xlab = "datetime", ylab = "Global_reactive_power", yaxt="n"))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri","Sat"), col.axis="blue", las=2, tck=-.01)
axis(2, at = c(0, 100, 200,300, 400, 500), labels = c("0", "0.1","0.2", "0.3", "0.4", "0.5"), col.axis="blue", las=2, tck=-.01)
lines(seq(DataToUSE$Time), as.numeric(as.character(DataToUSE$Global_reactive_power)))

dev.off()
