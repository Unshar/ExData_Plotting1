## ******************************************************************************************
## Exploratory Data Analysis - Week 1 - Assignment - Plot2
## ******************************************************************************************
## This assignment uses data from the UC Irvine Machine Learning Repository, a
## popular repository for machine learning datasets. In particular, we will be
## using the “Individual household electric power consumption Data Set”. The
## following descriptions of the 9 variables in the dataset are taken from the
## UCI web site: 
## - Date: Date in format dd/mm/yyyy Time: time in format hh:mm:ss 
##  - Global_active_power: household global minute-averaged active power (in kilowatt) 
## - Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
## - Voltage: minute-averaged voltage (in volt) 
## - Global_intensity: household global minute-averaged current intensity (in ampere)
## - Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an
## oven and a microwave (hot plates are not electric but gas powered). 
## - Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It
## corresponds to the laundry room, containing a washing-machine, a
## tumble-drier, a refrigerator and a light. 
## - Sub_metering_3: energy sub-metering
##  - No. 3 (in watt-hour of active energy). It corresponds to an electric
## water-heater and an air-conditioner. 
## ******************************************************************************************
## Author: Unshar (MissK)
## Date: May 2014
## Source: household_power_consumption.txt (2,075,259 rows and 9 columns)
## Outputs: plot2.png
## ******************************************************************************************

##(1) Install function for packages    
packages<-function(x){
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
packages(sqldf)
packages(graphics)
packages(ggplot2)
packages(grDevices)
packages(lattice)
packages(grid)

##(1) Load source file from R Working directory using SQL
dir<-getwd()
path<-paste(c(dir,"/household_power_consumption.txt"), collapse='')
SelectDTSql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
Data <- read.csv2.sql(path,SelectDTSql)

##(2) Create a Date field type date and time classes
K_Date<-as.Date(Data$Date, "%d/%m/%Y")
K_weekday<-format(K_Date, "%A, %b %d, %Y") 
x<-paste(Data$Date, Data$Time, sep = " ")
K_DateTime<-strptime(x, format="%d/%m/%Y %H:%M:%S")

## (3) Making Plots

## (3.2) Plot2 "Global Active Power - Kilowatss vs Weekday"
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12, res=72)

with(Data, plot(K_DateTime,
                Global_active_power, 
                type = "l",
                xlab = " ",
                ylab = "Global Active Power (kilowatts)"))    

dev.off()
